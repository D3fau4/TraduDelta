using TraduDelta.Lib.Utils;

namespace TraduDelta.CLI;

public class HandlerArgs
{
    // Modes of operation
    public enum Mode
    {
        ApplyMods,
        Json2Po,
        ExtractText,
        MergePo,
        Help
    }

    public HandlerArgs(string[] raw_args)
    {
        Handler[] Handlers =
        {
            // OP modes
            new(new[] { "--applymods" }, () => OperationMode = Mode.ApplyMods),
            new(new[] { "--json2po" }, () => OperationMode = Mode.Json2Po),
            new(new[] { "--extracttext", "-x" }, () => OperationMode = Mode.ExtractText),
            new(new[] { "--merge", "-m" }, () => OperationMode = Mode.MergePo),
            new(new[] { "--help", "-h" }, () => OperationMode = Mode.Help),

            // Args
            new(new[] { "--gamewin", "-g" }, x => GameWinPath = x),
            new(new[] { "--ch1text", "-ch1t" }, x => ch1TextPath = x),
            new(new[] { "--ch2jptext", "-ch2jpt" }, x => ch2jpTextPath = x),
            new(new[] { "--poold" }, x => poOld = x),
            new(new[] { "--ponew" }, x => poNew = x)
        };

        for (var i = 0; i < raw_args.Length; ++i)
        {
            var handler = Handlers.FirstOrDefault(x => x.Aliases.Contains(raw_args[i]));

            if (handler is null)
                Console.WriteLine($"Warning: unknown arg {raw_args[i]}");
            else
                handler.Invoke(handler.RequiresArg ? raw_args[++i] : null!);
        }

        if (OperationMode is null)
            return;
    }

    public Mode? OperationMode { get; private set; }
    public string GameWinPath { get; private set; } = "game.win";
    public string ch1TextPath { get; private set; } = "lang/lang_en_ch1.json";
    public string ch2jpTextPath { get; private set; } = "lang/lang_ja.json";
    public string poOld { get; private set; }
    public string poNew { get; private set; }

    public static void PrintInfo()
    {
        cmdutils.print("TraduDelta.exe [MODE] [FILE/DIRECTORY]");
        cmdutils.print("Usage:");
        cmdutils.print("--applymods                  Apply TS mods.");
        cmdutils.print("--json2po                    Convert .json to .po");
        cmdutils.print("--extracttext                Extract the texts from the game.win");
    }

    private class Handler
    {
        public readonly string[] Aliases;
        private readonly Action? Fn;

        private readonly Action<string>? FnArg;

        public Handler(string[] Aliases, Action<string> Fn)
        {
            this.Aliases = Aliases;
            FnArg = Fn;
        }

        public Handler(string[] Aliases, Action Fn)
        {
            this.Aliases = Aliases;
            this.Fn = Fn;
        }

        public bool RequiresArg => FnArg != null;

        public void Invoke(string arg)
        {
            if (FnArg != null)
                FnArg(arg);
            else
                Fn!();
        }
    }
}