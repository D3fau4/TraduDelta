using System.ComponentModel;
using Spectre.Console.Cli;

namespace TraduDelta.CLI.Commands;

public class MergePo : Command<MergePo.Settings>
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
        throw new NotImplementedException();
    }
}