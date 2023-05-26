using System.Text;
using TraduDelta.Lib.Files;
using UndertaleModLib;
using Yarhl.FileSystem;
using Yarhl.Media.Text;

namespace TraduDelta.Lib.Utils.Helpers;

public class Json2PoHelper : IHelper
{
    public void Process(string s1)
    {
        if (File.Exists(s1))
        {
            var text1 = json.Gettext(s1);
            var me = new Texts();

            me.Keys = new List<string>(text1.Keys);
            me.Values = new List<string>(text1.Values);
            var po = new json2Po();
            var meme = po.Convert(me);
            var po2Binary = new Po2Binary();
            var binary = po2Binary.Convert(meme);
            var node1 = new Node(Path.GetFileName(s1), binary);
            node1.Stream?.WriteTo("lang.po");
        }
    }
}

public class Po2JsonHelper : IHelper
{
    public void Process(string s1)
    {
        throw new NotImplementedException();
    }
}

public class PoMergeTranslation : IHelper
{
    /// <summary>
    ///     Merge Po files
    /// </summary>
    /// <param name="OldPo">translation to merge in the new one</param>
    /// <param name="NewPo">translation with new texts</param>
    public void Process(string OldPo, string NewPo)
    {
        cmdutils.print(OldPo, ConsoleColor.Blue);
        var meme = NodeFactory.FromFile(OldPo).TransformWith(new Binary2Po());
        var old = meme.TransformWith(new Po2json()).GetFormatAs<Texts>();
        var meme2 = NodeFactory.FromFile(NewPo).TransformWith(new Binary2Po());
        var _new = meme2.TransformWith(new Po2json()).GetFormatAs<Texts>();
        try
        {
            for (var i = 0; i < old.Keys.Count; i++)
                if (_new.Keys.Contains(old.Keys[i]))
                {
                    var flag = old.TranslatedValues.TryGetValue(old.Keys[i], out var val);
                    if (flag) _new.TranslatedValues.Add(old.Keys[i], val);
                }
        }
        catch (Exception)
        {
            /* No hacer nada */
        }

        Powritter.write(_new, "meme.po");
    }
}

public class Gamewin2Po : IHelper
{
    /// <summary>
    ///     Extract all texts
    /// </summary>
    /// <param name="gameWinPath"></param>
    /// <param name="ch1TextsPath"></param>
    /// <param name="jpTextsPath"></param>
    public void Process(string gameWinPath, string ch1TextsPath, string jpTextsPath, bool withCh1Texts = true)
    {
        if (gameWinPath.Contains(".win"))
        {
            UndertaleData Data = null;

            using (var stream = new FileStream(gameWinPath, FileMode.Open, FileAccess.Read))
            {
                cmdutils.print("Reading Data.win...");
                Data = UndertaleIO.Read(stream);
                cmdutils.print("Read complete!", ConsoleColor.Green);
            }

            cmdutils.print("Depcompiling game...");
            var codedep = Decompiler.Decompile(Data);
            cmdutils.print("Done!", ConsoleColor.Green);
            var fullpair = new Dictionary<string, string>();
            foreach (var entry in codedep)
            {
                var keyValuePairs = new Dictionary<string, string>();
                if (Path.GetFileName(entry.Key).Equals("gml_GlobalScript_stringsetloc.asm") ||
                    Path.GetFileName(entry.Key).Equals("gml_GlobalScript_msgsetsubloc.asm") ||
                    Path.GetFileName(entry.Key).Equals("gml_GlobalScript_msgnextloc.asm") ||
                    Path.GetFileName(entry.Key).Equals("gml_GlobalScript_msgsetloc.asm") ||
                    Path.GetFileName(entry.Key).Equals("gml_GlobalScript_c_msgsetloc.asm") ||
                    Path.GetFileName(entry.Key).Equals("gml_Script_scr_84_get_lang_string_ch1.asm"))
                    continue;
                cmdutils.print(entry.Key, ConsoleColor.Magenta);
                var str = entry.Value.Split("\n");
                for (var i = 0; i < str.Length; i++)
                {
                    var buffervalue = new StringBuilder();
                    var bufferkey = new StringBuilder();
                    if (str[i].Contains("gml_Script_stringsetloc") ||
                        str[i].Contains("gml_Script_msgsetsubloc") ||
                        str[i].Contains("gml_Script_msgnextloc") ||
                        str[i].Contains("gml_Script_msgsetloc") ||
                        str[i].Contains("gml_Script_c_msgsetloc") ||
                        str[i].Contains("gml_Script_c_msgnextloc") ||
                        str[i].Contains("gml_Script_msgnextsubloc") ||
                        str[i].Contains("gml_Script_stringsetsubloc") ||
                        str[i].Contains("gml_Script_scr_84_get_lang_string_ch1"))
                    {
                        var flag = false;
                        var flag1 = false;
                        /* Recorro hacia arriba para encontrar la string */
                        for (var j = i; j > 0; j--)
                            /* Busco la string */
                            if (str[j].Contains("push.s \""))
                            {
                                // elimino la función para extraer el texto
                                str[j] = str[j].Replace("push.s \"", "");
                                if (str[i].Contains("gml_Script_scr_84_get_lang_string_ch1")) flag = true;
                                if (!flag)
                                {
                                    for (var k = 0; k < str[j].Length; k++)
                                        if (!str[j][k].Equals('\"'))
                                        {
                                            buffervalue.Append(str[j][k]);
                                        }
                                        else if (!str[j][k + 1].Equals('@'))
                                        {
                                            buffervalue.Append(str[j][k]);
                                        }
                                        else
                                        {
                                            flag = true;
                                            break;
                                        }
                                }
                                else
                                {
                                    for (var k = 0; k < str[j].Length; k++)
                                        if (!str[j][k].Equals('\"'))
                                        {
                                            bufferkey.Append(str[j][k]);
                                        }
                                        else if (!str[j][k + 1].Equals('@'))
                                        {
                                            bufferkey.Append(str[j][k]);
                                        }
                                        else
                                        {
                                            flag1 = true;
                                            break;
                                        }

                                    if (flag1)
                                        break;
                                }
                            }

                        /* Añadidos al diccionario */
                        try
                        {
                            if (str[i].Contains("gml_Script_scr_84_get_lang_string_ch1"))
                            {
                                if (withCh1Texts)
                                {
                                    cmdutils.print("Importing text from Chapter 1", ConsoleColor.Gray);
                                    buffervalue.Append(json.getvaluefromjson(ch1TextsPath, bufferkey.ToString()));
                                }
                                else
                                {
                                    bufferkey.Clear();
                                    buffervalue.Clear();
                                    continue;
                                }
                            }

                            if (buffervalue.ToString().Contains("\\\\") ||
                                buffervalue.ToString().Contains("\\\""))
                            {
                                keyValuePairs.Add(bufferkey.ToString(),
                                    buffervalue.ToString().Replace("\\\\", "\\").Replace("\\\"", "\"")
                                        .Replace('\f', 'ç'));
                                fullpair.Add(bufferkey.ToString(),
                                    buffervalue.ToString().Replace("\\\\", "\\").Replace("\\\"", "\"")
                                        .Replace('\f', 'ç'));
                            }
                            else
                            {
                                keyValuePairs.Add(bufferkey.ToString(), buffervalue.ToString());
                                fullpair.Add(bufferkey.ToString(), buffervalue.ToString());
                            }
                        }
                        catch (Exception)
                        {
                            //cmdutils.print("Clave repetida");
                        }

                        /* Limpiamos buffer*/
                        bufferkey.Clear();
                        buffervalue.Clear();
                    }
                }

                if (keyValuePairs.Count > 0)
                {
                    json.writejson(keyValuePairs, Path.GetFileName(entry.Key));
                    Powritter.write(keyValuePairs, Path.GetFileName(entry.Key));
                }
            }

            json.writejson(fullpair, "lang_en.json", false);
            json.cleanjson("lang_en.json", jpTextsPath);
            fullpair = json.Gettext("lang_en.json");
            Powritter.write(fullpair, "lang_en.po");
            cmdutils.print("Done!", ConsoleColor.Green);
        }
    }
}