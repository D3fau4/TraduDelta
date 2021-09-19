using System;
using System.Collections.Generic;
using System.IO;
using UndertaleModLib;
using UndertaleModLib.Decompiler;
using Yarhl.FileSystem;
using Yarhl.Media.Text;

namespace TraduDelta
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args[0].Contains(".win"))
            {
                UndertaleData Data = null;

                using (var stream = new FileStream(args[0], FileMode.Open, FileAccess.Read))
                {
                    Data = UndertaleIO.Read(stream);
                }

                if (Data != null)
                {
                    if (Data.IsGameMaker2())
                    {
                        foreach (string file in Directory.GetFiles("Mods", "*.asm"))
                        {
                            Console.WriteLine("Import mod: " + file);
                            Data.Scripts.ByName(Path.GetFileName(file))?.Code.Replace(Assembler.Assemble(@File.ReadAllText(file), Data.Functions, Data.Variables, Data.Strings));
                        }
                        foreach (string file in Directory.GetFiles("Mods", "*.gml"))
                        {
                            Console.WriteLine("Import mod: " + file);
                            Data.Scripts.ByName(Path.GetFileName(file))?.Code.ReplaceGML(File.ReadAllText(file), Data);
                        }
                    }
                }
            }
            if (File.Exists(args[0]))
            {
                var text1 = json.Gettext(args[0]);
                Texts me = new Texts();

                me.Keys = new List<string>(text1.Keys);
                me.Values = new List<string>(text1.Values);
                json2Po po = new json2Po();
                var meme = po.Convert(me);
                Po2Binary po2Binary = new Po2Binary();
                var binary = po2Binary.Convert(meme);
                var node1 = new Node(Path.GetFileName(args[0]), binary);
                node1.Stream.WriteTo("meme1.po");
            }

            if (Directory.Exists(args[0]))
            {
                int count = 0;
                Dictionary<string, string> fullpair = new Dictionary<string, string>();
                foreach (string file in Directory.GetFiles(args[0], "*.asm"))
                {
                    Dictionary<string, string> keyValuePairs = new Dictionary<string, string>();
                    if (Path.GetFileName(file).Equals("gml_GlobalScript_stringsetloc.asm") || Path.GetFileName(file).Equals("gml_GlobalScript_msgsetsubloc.asm") ||
                        Path.GetFileName(file).Equals("gml_GlobalScript_msgnextloc.asm") || Path.GetFileName(file).Equals("gml_GlobalScript_msgsetloc.asm") ||
                        Path.GetFileName(file).Equals("gml_GlobalScript_c_msgsetloc.asm") || Path.GetFileName(file).Equals("gml_Script_scr_84_get_lang_string_ch1.asm"))
                    {
                        continue;
                    }
                    Console.WriteLine(file);
                    string[] str = File.ReadAllLines(file);
                    for (int i = 0; i < str.Length; i++)
                    {
                        string buffervalue = "";
                        string bufferkey = "";
                        if (str[i].Contains("gml_Script_stringsetloc") || str[i].Contains("gml_Script_msgsetsubloc") || str[i].Contains("gml_Script_msgnextloc") ||
                            str[i].Contains("gml_Script_msgsetloc") || str[i].Contains("gml_Script_c_msgsetloc") || str[i].Contains("gml_Script_c_msgnextloc") || 
                            str[i].Contains("gml_Script_msgnextsubloc") || str[i].Contains("gml_Script_stringsetsubloc") || str[i].Contains("gml_Script_scr_84_get_lang_string_ch1"))
                        {
                            bool flag = false;
                            bool flag1 = false;
                            /* Recorro hacia arriba para encontrar la string */
                            for (int j = i; j > 0; j--)
                            {
                                /* Busco la string */
                                if (str[j].Contains("push.s \""))
                                {
                                    // elimino la función para extraer el texto
                                    str[j] = str[j].Replace("push.s \"", "");
                                    if (str[i].Contains("gml_Script_scr_84_get_lang_string_ch1"))
                                    {
                                        flag = true;
                                    }
                                    if (!flag)
                                    {
                                        for (int k = 0; k < str[j].Length; k++)
                                        {
                                            if (!str[j][k].Equals('\"'))
                                            {
                                                buffervalue += str[j][k];
                                            }
                                            else if (!str[j][k + 1].Equals('@'))
                                            {
                                                buffervalue += str[j][k];
                                            } else
                                            {
                                                flag = true;
                                                break;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        for (int k = 0; k < str[j].Length; k++)
                                        {
                                            if (!str[j][k].Equals('\"'))
                                            {
                                                bufferkey += str[j][k];
                                            }
                                            else if (!str[j][k + 1].Equals('@'))
                                            {
                                                bufferkey += str[j][k];
                                            }
                                            else
                                            {
                                                flag1 = true;
                                                break;
                                            }
                                        }
                                        if (flag1)
                                            break;
                                    }
                                }
                            }
                            /* Añadidos al diccionario */
                            try
                            {
                                if (str[i].Contains("gml_Script_scr_84_get_lang_string_ch1"))
                                {
                                    Console.WriteLine("Importando texto desde el Capítulo 1");
                                    //Console.WriteLine(bufferkey);
                                    buffervalue = json.getvaluefromjson("D:\\SteamLibrary\\steamapps\\common\\DELTARUNEdemo\\lang\\lang_en_ch1.json", bufferkey);
                                }
                                keyValuePairs.Add(bufferkey, buffervalue);
                                fullpair.Add(bufferkey, buffervalue);
                            }
                            catch (Exception)
                            {
                                //Console.WriteLine("Clave repetida");
                            }
                            /* Limpiamos buffer*/
                            buffervalue = "";
                            buffervalue = "";
                        }
                    }
                    if (keyValuePairs.Count != 0)
                    {
                        json.writejson(keyValuePairs, Path.GetFileName(file));
                        Powritter.write(keyValuePairs, Path.GetFileName(file));
                    }
                        
                }
                /* Write lang_en.json */ 
                json.writejson(fullpair, "lang_en.json", false);
                json.cleanjson("lang_en.json", "D:\\SteamLibrary\\steamapps\\common\\DELTARUNEdemo\\lang\\lang_ja.json");
                Powritter.write(fullpair, "lang_en.po");
            }
        }
    }
}
