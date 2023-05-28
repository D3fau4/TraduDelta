using Newtonsoft.Json.Linq;
using Spectre.Console;
using TraduDelta.Lib.Files;
using UndertaleModLib;

namespace TraduDelta.Lib.Utils;

public class Mods
{
    private readonly string ConfigPath;
    private readonly UndertaleData Data;
    private readonly Dictionary<string, string> mods;
    private readonly string stringsfile;

    public Mods(UndertaleData data, string path = "Mods/Config_PC.json")
    {
        Data = data;
        ConfigPath = path;
        if (Data.GeneralInfo.LastObj.ToString().Equals("111627"))
            path = path.Replace("_PC.json", "_Switch.json");
        var Json1 = JObject.Parse(File.ReadAllText(path));
        mods = Json1.SelectToken("Mods").ToObject<Dictionary<string, string>>();
        stringsfile = Path.Combine(Path.GetDirectoryName(ConfigPath), Json1.SelectToken("Strings").ToString());
    }

    public void ApplyMods()
    {
        var import = new Importcode(Data);
        
        AnsiConsole.Progress()
            .Start(ctx => 
            {
                // Define tasks
                var task1 = ctx.AddTask("[green]Añadiendo mods...[/]");

                int inc = 100 / mods.Count;
                foreach (var mod in mods)
                    if (mod.Value.Contains(".asm"))
                    {
                        //cmdutils.print("Import mod: " + mod.Value, ConsoleColor.Magenta);
                        var file = File.ReadAllText(Path.Combine(Path.GetDirectoryName(ConfigPath), mod.Value));

                        file = json.replaceASM(file, stringsfile, Data);
                        import.Import(mod.Key, file, false);
                        task1.Increment(inc);
                    }
                    else if (mod.Value.Contains(".gml"))
                    {
                        //cmdutils.print("Import mod: " + mod.Value, ConsoleColor.Magenta);
                        var file = File.ReadAllText(Path.Combine(Path.GetDirectoryName(ConfigPath), mod.Value));

                        file = json.replaceASM(file, stringsfile, Data);
                        import.Import(mod.Key, file);
                        task1.Increment(inc);
                    }

                task1.Value = 100;
            });
    }
}