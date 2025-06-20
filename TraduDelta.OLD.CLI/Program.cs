﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using TraduDelta.Lib.Files;
using TraduDelta.Lib.Utils;
using UndertaleModLib;
using Yarhl.FileSystem;
using Yarhl.Media.Text;

namespace TraduDelta;

internal class Program
{
    protected static bool flag = true;

    private static void Main(string[] args)
    {
        cmdutils.print("Welcome to TraduDelta.CLI by D3fau4!");

        if (args.Length > 0)
            switch (args[0])
            {
                case "--applymods":
                    if (args[1].Contains(".win"))
                    {
                        UndertaleData Data = null;

                        using (var stream = new FileStream(args[1], FileMode.Open, FileAccess.Read))
                        {
                            cmdutils.print("Reading Data.win...");
                            Data = UndertaleIO.Read(stream);
                            cmdutils.print("Read complete!", ConsoleColor.Green);
                        }

                        if (Data != null)
                            if (Data.IsGameMaker2())
                            {
                                cmdutils.print("Applying mods...");
                                var mod = new Mods(Data);
                                mod.ApplyMods();
                                cmdutils.print("Done!", ConsoleColor.Green);
                                cmdutils.print("Saving changes...");
                                if (flag)
                                    Data.Strings.MakeString(
                                        "4275696c6420636f6d70696c61646f206578706cc3ad636974616d656e74652070617261206c612074726164756" +
                                        "36369c3b36e2064656c2065717569706f204454532070617261207375732070726f796563746f73207075626c6963616" +
                                        "46f7320656e205472616475537175617265");
                                var build = new GameWin(Data);
                                build.save(args[1]);
                                cmdutils.print("Done! " + args[1].Replace(".win", ".mod.win") + " was saved.",
                                    ConsoleColor.Green);
                            }
                    }

                    break;
                case "--json2po":
                    if (File.Exists(args[1]))
                    {
                        var text1 = json.Gettext(args[1]);
                        var me = new Texts();

                        me.Keys = new List<string>(text1.Keys);
                        me.Values = new List<string>(text1.Values);
                        var po = new json2Po();
                        var meme = po.Convert(me);
                        var po2Binary = new Po2Binary();
                        var binary = po2Binary.Convert(meme);
                        var node1 = new Node(Path.GetFileName(args[1]), binary);
                        node1.Stream.WriteTo("meme1.po");
                    }

                    break;
                case "--extracttext":
                    if (args.Length < 3)
                    {
                        cmdutils.print("lang_en_ch1.json not found", ConsoleColor.Red);
                        cmdutils.print("Usage: TraduDelta.CLI.exe --extracttext gTraduDelta.OLD.CLIn_ch1.json");
                        break;
                    }

                    if (args.Length < 4)
                    {
                        cmdutils.print("lang_ja.json not found", ConsoleColor.Red);
                        cmdutils.print("Usage: TraduDelta.CLI.exe --extracttext gTraduDelta.OLD.CLIn_ch1.json");
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
                                            cmdutils.print("Importing text from Chapter 1", ConsoleColor.Gray);
                                            //cmdutils.print(bufferkey);
                                            buffervalue.Append(json.getvaluefromjson(args[2], bufferkey.ToString()));
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
                        json.cleanjson("lang_en.json", args[3]);
                        fullpair = json.Gettext("lang_en.json");
                        Powritter.write(fullpair, "lang_en.po");
                        cmdutils.print("Done!", ConsoleColor.Green);
                    }

                    break;
                case "--clean":
                    Directory.Delete("Output", true);
                    Directory.Delete("OUT_PO", true);
                    Directory.Delete("Updated_po", true);
                    File.Delete("lang_en.json");
                    cmdutils.print("Cleaned!");
                    break;
                case "--mergetranslation":
                    if (Directory.Exists(args[1]))
                        foreach (var str in Directory.GetFiles(args[1]))
                        {
                            cmdutils.print(str, ConsoleColor.Blue);
                            var meme = NodeFactory.FromFile(str).TransformWith(new Binary2Po());
                            var old = meme.TransformWith(new Po2json()).GetFormatAs<Texts>();
                            foreach (var str2 in Directory.GetFiles(args[2]))
                                if (Path.GetFileName(str).Equals(Path.GetFileName(str2)))
                                {
                                    var meme2 = NodeFactory.FromFile(str2).TransformWith(new Binary2Po());
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

                                    Powritter.write(_new, Path.GetFileName(str));
                                }
                        }

                    break;
                case "--updatepo":
                    if (Directory.Exists(args[1]))
                    {
                        foreach (var str in Directory.GetFiles(args[1]))
                        {
                            cmdutils.print(str, ConsoleColor.Blue);
                            var meme = NodeFactory.FromFile(str).TransformWith(new Binary2Po());
                            meme.TransformWith(new Po2json()).TransformWith(new json2Po())
                                .TransformWith(new Po2Binary()).Stream
                                .WriteTo(Path.Combine("Updated_po", Path.GetFileName(str)));
                        }
                    }
                    else if (File.Exists(args[1]))
                    {
                        cmdutils.print(args[1], ConsoleColor.Blue);
                        var meme = NodeFactory.FromFile(args[1]).TransformWith(new Binary2Po());
                        meme.TransformWith(new Po2json()).TransformWith(new json2Po()).TransformWith(new Po2Binary())
                            .Stream.WriteTo(args[1]);
                    }

                    break;
                default:
                    cmdutils.print("Invalid settings: " + args[0], ConsoleColor.Red);
                    printhelp();
                    break;
            }
        else
            printhelp();
    }

    private static void printhelp()
    {
        cmdutils.print("TraduDelta.CLI.exe ");
        cmdutils.print("--json2po                    Convert .json to .po");
        cmdutils.print("--extracttext                Extract the texts from the game.win");
        cmdutils.print("--mergetranslation           ");
        cmdutils.print("--updatepo                   ");
        cmdutils.print("--clean                      Clean files.");
    }
}