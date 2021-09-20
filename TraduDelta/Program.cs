using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UndertaleModLib;
using Yarhl.FileSystem;
using Yarhl.Media.Text;

namespace TraduDelta
{
    class Program
    {

        static void Main(string[] args)
        {

            cmdutils.print("Welcome to TraduDelta by D3fau4!", ConsoleColor.Green);

            if (args.Length > 0)
            {
                switch (args[0])
                {
                    case "--applymods":

                        cmdutils.print("Write the lenguage code name: ", ConsoleColor.Cyan);
                        var codename = Console.ReadLine();
                        if (codename.Length > 2)
                        {
                            cmdutils.print("Error: the code name is bigger than 2 characters", ConsoleColor.Red);
                            cmdutils.print("Please use a smoller lenguage code. ex: es, en, ja, etc...", ConsoleColor.Blue);
                        }
                        cmdutils.print("Write the lenguage what do you use: ", ConsoleColor.Cyan);
                        var lenguage = Console.ReadLine();
                        if (args[1].Contains(".win"))
                        {
                            UndertaleData Data = null;

                            using (var stream = new FileStream(args[1], FileMode.Open, FileAccess.Read))
                            {
                                cmdutils.print("Reading Data.win...", ConsoleColor.White);
                                Data = UndertaleIO.Read(stream);
                                cmdutils.print("Read complete!", ConsoleColor.Green);
                            }

                            if (Data != null)
                            {
                                if (Data.IsGameMaker2())
                                {
                                    int codename_index = 0;
                                    int Lenguage_index = 0;
                                    int LenguageUpper_index = 0;
                                    Data.Strings.MakeString(codename);
                                    Data.Strings.MakeString(lenguage);
                                    Data.Strings.MakeString(lenguage.ToUpper());

                                    for (int i = 0; i < Data.Strings.Count; i++)
                                    {
                                        if (Data.Strings[i].Content.Equals(codename))
                                        {
                                            codename_index = i;
                                        }
                                        else if (Data.Strings[i].Content.Equals(lenguage))
                                        {
                                            Lenguage_index = i;
                                        }
                                        else if (Data.Strings[i].Content.Equals(lenguage.ToUpper()))
                                        {
                                            LenguageUpper_index = i;
                                            break;
                                        }
                                    }
                                    foreach (string file in Directory.GetFiles("Mods", "*.asm"))
                                    {
                                        cmdutils.print("Import mod: " + file);
                                        string mod = File.ReadAllText(file);

                                        mod = mod.Replace("{LENGUAGE}", codename).Replace("@FFFFFF", "@" + codename_index.ToString());
                                        Importcode import = new Importcode(Data);
                                        import.Import(Path.GetFileName(file).Replace(".asm", ""), mod, false, true);
                                    }
                                    cmdutils.print("Saving changes...", ConsoleColor.White);
                                    GameWin build = new GameWin(Data);
                                    build.save(args[1]);
                                    cmdutils.print("Done! " + args[1].Replace(".win", ".mod.win") + " was saved.", ConsoleColor.Green);
                                }
                            }
                        }
                        break;
                    case "--json2po":
                        if (File.Exists(args[1]))
                        {
                            var text1 = json.Gettext(args[1]);
                            Texts me = new Texts();

                            me.Keys = new List<string>(text1.Keys);
                            me.Values = new List<string>(text1.Values);
                            json2Po po = new json2Po();
                            var meme = po.Convert(me);
                            Po2Binary po2Binary = new Po2Binary();
                            var binary = po2Binary.Convert(meme);
                            var node1 = new Node(Path.GetFileName(args[1]), binary);
                            node1.Stream.WriteTo("meme1.po");
                        }
                        break;
                    case "--extracttext":
                        if (args.Length < 3)
                        {
                            cmdutils.print("lang_en_ch1.json not found", ConsoleColor.Red);
                            cmdutils.print("Usage: TraduDelta.exe --extracttext game.win lang_en_ch1.json");
                            break;
                        }
                        if (args.Length < 4)
                        {
                            cmdutils.print("lang_ja.json not found", ConsoleColor.Red);
                            cmdutils.print("Usage: TraduDelta.exe --extracttext game.win lang_en_ch1.json");
                            break;
                        }
                        if (args[1].Contains(".win"))
                        {
                            UndertaleData Data = null;

                            using (var stream = new FileStream(args[1], FileMode.Open, FileAccess.Read))
                            {
                                cmdutils.print("Reading Data.win...");
                                Data = UndertaleIO.Read(stream);
                                cmdutils.print("Read complete!", ConsoleColor.Green);
                            }
                            cmdutils.print("Depcompiling game...");
                            Dictionary<string, string> codedep = Decompiler.Decompile(Data);
                            cmdutils.print("Done!", ConsoleColor.Green);
                            Dictionary<string, string> fullpair = new Dictionary<string, string>();
                            foreach (var entry in codedep)
                            {
                                Dictionary<string, string> keyValuePairs = new Dictionary<string, string>();
                                if (Path.GetFileName(entry.Key).Equals("gml_GlobalScript_stringsetloc.asm") || Path.GetFileName(entry.Key).Equals("gml_GlobalScript_msgsetsubloc.asm") ||
                                    Path.GetFileName(entry.Key).Equals("gml_GlobalScript_msgnextloc.asm") || Path.GetFileName(entry.Key).Equals("gml_GlobalScript_msgsetloc.asm") ||
                                    Path.GetFileName(entry.Key).Equals("gml_GlobalScript_c_msgsetloc.asm") || Path.GetFileName(entry.Key).Equals("gml_Script_scr_84_get_lang_string_ch1.asm"))
                                {
                                    continue;
                                }
                                cmdutils.print(entry.Key, ConsoleColor.Magenta);
                                string[] str = entry.Value.Split("\n");
                                for (int i = 0; i < str.Length; i++)
                                {
                                    /*string buffervalue = "";
                                    string bufferkey = "";*/
                                    StringBuilder buffervalue = new StringBuilder();
                                    StringBuilder bufferkey = new StringBuilder();
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
                                                }
                                                else
                                                {
                                                    for (int k = 0; k < str[j].Length; k++)
                                                    {
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
                                                cmdutils.print("Importing text from Chapter 1", ConsoleColor.Gray);
                                                //cmdutils.print(bufferkey);
                                                buffervalue.Append(json.getvaluefromjson(args[2], bufferkey.ToString()));
                                            }
                                            if (buffervalue.ToString().Contains("\\\\") || buffervalue.ToString().Contains("\\\""))
                                            {
                                                keyValuePairs.Add(bufferkey.ToString(), buffervalue.ToString().Replace("\\\\", "\\").Replace("\\\"", "\"").Replace('\f', 'ç'));
                                                fullpair.Add(bufferkey.ToString(), buffervalue.ToString().Replace("\\\\", "\\").Replace("\\\"", "\"").Replace('\f', 'ç'));
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
                            json.cleanjson("lang_en.json", args[3]);
                            fullpair = json.Gettext("lang_en.json");
                            Powritter.write(fullpair, "lang_en.po");
                            cmdutils.print("Done!", ConsoleColor.Green);
                        }
                        break;
                    case "--clean":
                        Directory.Delete("Output", true);
                        Directory.Delete("OUT_PO", true);
                        File.Delete("lang_en.json");
                        cmdutils.print("Cleaned!");
                        break;
                    case "--mergetranslation":
                        var text3 = json.Gettext(args[1]);
                        var text4 = json.Gettext(args[2]);
                        Powritter.write(text3, text4, Path.GetFileName(args[1].Replace(".json", ".merged.po")));
                        break;
                    default:
                        cmdutils.print("Invalid settings: " + args[0], ConsoleColor.Red);
                        printhelp();
                        break;
                }
            }
            else
            {
                printhelp();
            }
        }

        static void printhelp()
        {
            cmdutils.print("TraduDelta.exe [MODE] [FILE/DIRECTORY]\n");
            cmdutils.print("--applymods                  Apply TS mods.");
            cmdutils.print("--json2po                    Convert .json to .po");
            cmdutils.print("--extracttext                Extract the texts from the game.win");
            cmdutils.print("--clean                      Clean files.");
        }
    }
}
