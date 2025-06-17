using Spectre.Console;
using TraduDelta.Lib.Files;
using UndertaleModLib;

namespace TraduDelta.Lib.Utils.Helpers;

public class ModHelper : IHelper
{
    /// <summary>
    ///     Apply all mods
    /// </summary>
    /// <param name="path">game.win path</param>
    public override void Process(string path)
    {
        if (path.Contains(".win"))
        {
            UndertaleData Data = null;

            using (var stream = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                AnsiConsole.MarkupLine("Reading Data.win...");
                Data = UndertaleIO.Read(stream);
                AnsiConsole.MarkupLine("[Green]Read complete![/]");
            }

            if (Data != null)
                if (Data.IsGameMaker2())
                {
                    AnsiConsole.MarkupLine("Applying mods...");
                    var mod = new Mods(Data);
                    mod.ApplyMods();
                    AnsiConsole.MarkupLine("[Green]Done![/]");
                    AnsiConsole.MarkupLine("Saving changes...");

                    var build = new GameWin(Data);
                    build.save(path);
                    AnsiConsole.MarkupLine("[Green]Done! " + path.Replace(".win", ".mod.win") + " was saved.[/]");
                }
        }
    }
}