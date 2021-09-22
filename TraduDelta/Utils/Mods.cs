using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using UndertaleModLib;

namespace TraduDelta
{
    class Mods
    {
        private UndertaleData Data;
        private string ConfigPath;
        private Dictionary<string, string> mods;
        private string stringsfile;

        public Mods(UndertaleData data, string path = "Mods/Config.json")
        {
            this.Data = data;
            this.ConfigPath = path;
            JObject Json1 = JObject.Parse(File.ReadAllText(path));
            this.mods = Json1.SelectToken("Mods").ToObject<Dictionary<string, string>>();
            this.stringsfile = Path.Combine(Path.GetDirectoryName(ConfigPath), Json1.SelectToken("Strings").ToString());
        }

        public void ApplyMods()
        {
            Importcode import = new Importcode(this.Data);
            foreach (var mod in this.mods)
            {
                if (mod.Value.Contains(".asm"))
                {
                    cmdutils.print("Import mod: " + mod.Value);
                    string file = File.ReadAllText(Path.Combine(Path.GetDirectoryName(ConfigPath), mod.Value));

                    file = json.replaceASM(file, this.stringsfile, Data);
                    import.Import(mod.Key, file, false, true);
                }else if (mod.Value.Contains(".gml")){
                    cmdutils.print("Import mod: " + mod.Value);
                    string file = File.ReadAllText(Path.Combine(Path.GetDirectoryName(ConfigPath), mod.Value));

                    file = json.replaceASM(file, this.stringsfile, Data);
                    import.Import(mod.Key, file, true, true);
                }
            }
        }
    }
}
