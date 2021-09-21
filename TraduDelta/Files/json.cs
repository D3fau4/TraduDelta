using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UndertaleModLib;

namespace TraduDelta
{
    class json
    {
        static string outputfolder = "Output";
        public static void writejson(Dictionary<string, string> keyValuePairs, string path, bool outfolder = true)
        {
            var json = JsonConvert.SerializeObject(keyValuePairs, Formatting.Indented);
            if (outfolder)
            {
                if (!Directory.Exists(outputfolder))
                    Directory.CreateDirectory(outputfolder);

                File.WriteAllText(Path.Combine(outputfolder, path).Replace(".asm", ".json"), json);
            }
            else
            {
                File.WriteAllText(path, json);
            }
        }

        public static string replaceASM(string ASM, string path, UndertaleData Data)
        {
            Dictionary<string, string> keyValuePairs = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(path));
            Dictionary<string, string> keyoffset = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(Path.Combine("Mods", "mod_map.json")));
            Texts me = new Texts();
            Texts offset = new Texts();

            me.Keys = new List<string>(keyValuePairs.Keys);
            me.Values = new List<string>(keyValuePairs.Values);
            offset.Values = new List<string>(keyoffset.Values);
            offset.Keys = new List<string>(keyoffset.Keys);
            for (int i = 0; i < me.Keys.Count; i++)
            {
                int index = 0;
                var string1 = Data.Strings.MakeString(me.Values[i]);
                index = Data.Strings.IndexOf(string1);
                cmdutils.print(index);
                ASM = ASM.Replace("{" + me.Keys[i] + "}", me.Values[i]).Replace(offset.Values[i], "@" + index);
            }
            return ASM;
        }

        public static string getvaluefromjson(string path, string key)
        {
            JObject Json1 = JObject.Parse(File.ReadAllText(path));

            return (string)Json1[key];
        }

        public static Dictionary<string, string> Gettext(string path)
        {
            Dictionary<string, string> keyValuePairs;
            keyValuePairs = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(path));
            return keyValuePairs;
        }

        public static void cleanjson(string path1, string path2)
        {
            JObject Json1 = JObject.Parse(File.ReadAllText(path1));
            JObject Json2 = JObject.Parse(File.ReadAllText(path2));

            IList<string> keys1 = Json1.Properties().Select(p => p.Name).ToList();
            IList<string> keys2 = Json2.Properties().Select(p => p.Name).ToList();

            for (int i = 0; i < keys1.Count; i++)
            {
                if (!keys2.Contains(keys1[i]))
                {
                    Json1.Remove(keys1[i]);
                }
            }

            File.WriteAllText(path1, Json1.ToString());
        }
    }
}
