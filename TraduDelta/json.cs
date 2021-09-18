using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

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

        public static string getvaluefromjson(string path, string key)
        {
            JObject Json1 = JObject.Parse(File.ReadAllText(path));

            return (string)Json1[key];
        }

        public static void cleanjson(string path1, string path2)
        {
            JObject Json1 = JObject.Parse(File.ReadAllText(path1));
            JObject Json2 = JObject.Parse(File.ReadAllText(path2));

            IList<string> keys1 = Json1.Properties().Select(p => p.Name).ToList();
            IList<string> keys2 = Json2.Properties().Select(p => p.Name).ToList();

            for (int i = 0; i < keys2.Count; i++)
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
