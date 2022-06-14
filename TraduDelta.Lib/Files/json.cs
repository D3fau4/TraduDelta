using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using UndertaleModLib;

namespace TraduDelta.Lib.Files;

public class json
{
    private static readonly string outputfolder = "Output";

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

    public static void writejson(Texts keyValuePairs, string path, bool outfolder = true)
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
        var keyValuePairs = JsonConvert.DeserializeObject<Dictionary<string, string>>(File.ReadAllText(path));
        var keyoffset =
            JsonConvert.DeserializeObject<Dictionary<string, string>>(
                File.ReadAllText(path.Replace(".json", "_map.json")));
        var me = new Texts();
        var offset = new Texts();

        me.Keys = new List<string>(keyValuePairs.Keys);
        me.Values = new List<string>(keyValuePairs.Values);
        offset.Values = new List<string>(keyoffset.Values);
        offset.Keys = new List<string>(keyoffset.Keys);
        for (var i = 0; i < me.Keys.Count; i++)
        {
            var index = 0;
            var string1 = Data.Strings.MakeString(me.Values[i]);
            index = Data.Strings.IndexOf(string1);
            ASM = ASM.Replace("{" + me.Keys[i] + "}", me.Values[i]).Replace(offset.Values[i], "@" + index);
        }

        return ASM;
    }

    public static string getvaluefromjson(string path, string key)
    {
        var Json1 = JObject.Parse(File.ReadAllText(path));

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
        var Json1 = JObject.Parse(File.ReadAllText(path1));
        var Json2 = JObject.Parse(File.ReadAllText(path2));

        IList<string> keys1 = Json1.Properties().Select(p => p.Name).ToList();
        IList<string> keys2 = Json2.Properties().Select(p => p.Name).ToList();
        for (var i = 0; i < keys1.Count; i++)
            if (!keys2.Contains(keys1[i]))
            {
                Json1.Remove(keys1[i]);
                keys1.RemoveAt(i);
            }

        string meme = "";
        for (var i = 0; i < keys2.Count; i++)
            if (!keys1.Contains(keys2[i]))
                meme += $"{keys2[i]}\n";
        File.WriteAllText("log.txt", meme);
        File.WriteAllText(path1, Json1.ToString());
    }
}