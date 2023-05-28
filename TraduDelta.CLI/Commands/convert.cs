using System.ComponentModel;
using Spectre.Console.Cli;
using TraduDelta.Lib.Utils.Helpers;

namespace TraduDelta.CLI.Commands;

public class convert : Command<convert.Settings>
{
    public sealed class Settings : CommandSettings
    {
        [CommandOption("--input <texts>")]
        [Description("File")]
        [DefaultValue("lang_es.json")]
        public string text_path { get; set; }
    }

    public override int Execute(CommandContext context, Settings settings)
    {
        if (settings.text_path.Equals(string.Empty) || !File.Exists(settings.text_path))
            throw new FileNotFoundException();

        if (settings.text_path.Contains(".po"))
        {
            Po2JsonHelper PO2JsonHelper = new Po2JsonHelper();
            PO2JsonHelper.Process(settings.text_path);
        } 
        else if (settings.text_path.Contains(".json"))
        {
            
        }

        return 0;
    }
}