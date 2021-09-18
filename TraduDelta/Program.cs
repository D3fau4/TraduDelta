using System;
using System.IO;
using System.Collections;
using UndertaleModLib;
using UndertaleModLib.Compiler;
using UndertaleModLib.Decompiler;
using System.Collections.Generic;

namespace TraduDelta
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args[0].Contains(".win")){
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
            if (Directory.Exists(args[0]))
            {
                int count = 0;
                List<string> Key = new List<string>();
                List<string> value = new List<string>();
                foreach (string file in Directory.GetFiles(args[0], "*.asm"))
                {
                    if (Path.GetFileName(file).Equals("gml_GlobalScript_stringsetloc.asm") || Path.GetFileName(file).Equals("gml_GlobalScript_msgsetsubloc.asm") || 
                        Path.GetFileName(file).Equals("gml_GlobalScript_msgnextloc.asm"))
                    {
                        continue;
                    }
                    Console.WriteLine(file);
                    string []str = File.ReadAllLines(file);
                    for (int i = 0; i < str.Length; i++)
                    {
                        if (str[i].Contains("gml_Script_stringsetloc"))
                        {
                            count++;
                            /* Check value */
                            string tmp = "";
                            str[i - 2] = str[i - 2].Replace("push.s \"", "");
                            for (int j = 0; j < str[i - 2].Length; j++)
                            {
                                if (!str[i - 2][j].Equals('\"'))
                                {
                                    tmp += str[i - 2][j];
                                }
                                else
                                {
                                    if (!str[i - 2][j + 1].Equals('@'))
                                    {
                                        tmp += str[i - 2][j];
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                                value.Add(tmp);
                            /* END check value */
                            /* Check key */
                            tmp = "";
                            str[i - 4] = str[i - 4].Replace("push.s \"", "");
                            for (int j = 0; j < str[i - 4].Length; j++)
                            {
                                if (!str[i - 4][j].Equals('\"'))
                                {
                                    tmp += str[i - 4][j];
                                }
                                else
                                {
                                    if (!str[i - 4][j + 1].Equals('@'))
                                    {
                                        tmp += str[i - 4][j];
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                                Key.Add(tmp);
                        }
                        if (str[i].Contains("gml_Script_msgsetsubloc"))
                        {
                            count++;
                            /* Check value */
                            string tmp = "";
                            str[i - 3] = str[i - 3].Replace("push.s \"", "");
                            for (int j = 0; j < str[i - 3].Length; j++)
                            {
                                if (!str[i - 3][j].Equals('\"'))
                                {
                                    tmp += str[i - 3][j];
                                }
                                else
                                {
                                    if (!str[i - 3][j + 1].Equals('@'))
                                    {
                                        tmp += str[i - 3][j];
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                                value.Add(tmp);
                            Console.WriteLine(tmp);
                            /* END check value */
                            /* Check key */
                            tmp = "";
                            str[i - 7] = str[i - 7].Replace("push.s \"", "");
                            for (int j = 0; j < str[i - 7].Length; j++)
                            {
                                if (!str[i - 7][j].Equals('\"'))
                                {
                                    tmp += str[i - 7][j];
                                }
                                else
                                {
                                    if (!str[i - 7][j + 1].Equals('@'))
                                    {
                                        tmp += str[i - 7][j];
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                                Key.Add(tmp);
                            Console.WriteLine(tmp);
                        }
                        if (str[i].Contains("gml_Script_msgnextloc"))
                        {
                            count++;
                            /* Check value */
                            string tmp = "";
                            
                            str[i - 2] = str[i - 2].Replace("push.s \"", "");
                            for (int j = 0; j < str[i - 2].Length; j++)
                            {
                                if (!str[i - 2][j].Equals('\"'))
                                {
                                    tmp += str[i - 2][j];
                                }
                                else
                                {
                                    if (!str[i - 2][j + 1].Equals('@'))
                                    {
                                        tmp += str[i - 2][j];
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                                value.Add(tmp);
                            Console.WriteLine(tmp);
                            /* END check value */
                            /* Check key */
                            tmp = "";
                            str[i - 4] = str[i - 4].Replace("push.s \"", "");
                            for (int j = 0; j < str[i - 4].Length; j++)
                            {
                                if (!str[i - 4][j].Equals('\"'))
                                {
                                    tmp += str[i - 4][j];
                                }
                                else
                                {
                                    if (!str[i - 4][j + 1].Equals('@'))
                                    {
                                        tmp += str[i - 4][j];
                                    }
                                    else
                                    {
                                        break;
                                    }
                                }
                            }
                            Console.WriteLine(tmp);
                                Key.Add(tmp);
                        }
                    }
                }
                json.writejson(Key, value);
                Console.WriteLine(count);
                Console.WriteLine(value.Count);
            }
        }
    }
}
