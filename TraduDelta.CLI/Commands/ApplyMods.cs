using System.ComponentModel;
using Spectre.Console.Cli;
using TraduDelta.Lib.Utils.Helpers;

namespace TraduDelta.CLI.Commands;

public class ApplyMods : Command<ApplyMods.Settings>
{
    public sealed class Settings : CommandSettings
    {
        [CommandOption("--gamewin <GAMEWIN>")]
        [Description("Game.win path")]
        [DefaultValue("Game.win")]
        public string gamewin_path { get; set; }
    }

    public override int Execute(CommandContext context, Settings settings)
    {
        if (settings.gamewin_path.Equals(string.Empty) || !File.Exists(settings.gamewin_path))
        {
            throw new FileNotFoundException();
        }

        ModHelper a = new ModHelper();
        a.Process(settings.gamewin_path);
        return 0;
    }
}