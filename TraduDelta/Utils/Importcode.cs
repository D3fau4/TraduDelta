using System;
using UndertaleModLib;
using UndertaleModLib.Decompiler;
using UndertaleModLib.Models;

namespace TraduDelta
{
    class Importcode
    {
        UndertaleData Data;
        public Importcode(UndertaleData Data)
        {
            this.Data = Data;
        }

        void SafeImport(string codeName, string gmlCode, bool IsGML, bool destroyASM = true, bool CheckDecompiler = false)
        {
            try
            {
                var instructions = Assembler.Assemble(gmlCode, Data);
                Data.Code.ByName(codeName).Replace(instructions);

            }
            catch (Exception ex)
            {
                string ErrorText = "Error at " + (IsGML ? "GML code: " : "ASM code: ") + codeName + @"': " + gmlCode + "\nError: " + ex.ToString();
                cmdutils.print(ErrorText, ConsoleColor.Red);
            }
        }

        public void Import(string codeName, string gmlCode, bool IsGML = true, bool doParse = true, bool destroyASM = true, bool CheckDecompiler = false)
        {
            bool SkipPortions = false;
            UndertaleCode code = Data.Code.ByName(codeName);
            if (Data.Code.ByName(codeName) == null)
            {
                code = new UndertaleCode();
                code.Name = Data.Strings.MakeString(codeName);
                Data.Code.Add(code);
            }
            if (Data?.GeneralInfo.BytecodeVersion > 14 && Data.CodeLocals.ByName(codeName) == null)
            {
                UndertaleCodeLocals locals = new UndertaleCodeLocals();
                locals.Name = code.Name;

                UndertaleCodeLocals.LocalVar argsLocal = new UndertaleCodeLocals.LocalVar();
                argsLocal.Name = Data.Strings.MakeString("arguments");
                argsLocal.Index = 0;

                locals.Locals.Add(argsLocal);

                code.LocalsCount = 1;
                code.GenerateLocalVarDefinitions(code.FindReferencedLocalVars(), locals); // Dunno if we actually need this line, but it seems to work?
                Data.CodeLocals.Add(locals);
            }
            if (doParse)
            {
                // This portion links code.
                if (codeName.Substring(0, 10).Equals("gml_Script"))
                {
                    // Add code to scripts section.
                    if (Data.Scripts.ByName(codeName.Substring(11)) == null)
                    {
                        UndertaleScript scr = new UndertaleScript();
                        scr.Name = Data.Strings.MakeString(codeName.Substring(11));
                        scr.Code = code;
                        Data.Scripts.Add(scr);
                    }
                    else
                    {
                        UndertaleScript scr = Data.Scripts.ByName(codeName.Substring(11));
                        scr.Code = code;
                    }
                }
                else if (codeName.Substring(0, 16).Equals("gml_GlobalScript"))
                {
                    // Add code to global init section.
                    UndertaleGlobalInit init_entry = null;
                    // This doesn't work, have to do it the hard way: UndertaleGlobalInit init_entry = Data.GlobalInitScripts.ByName(scr_dup_code_name_con);
                    foreach (UndertaleGlobalInit globalInit in Data.GlobalInitScripts)
                    {
                        if (globalInit.Code.Name.Content == codeName)
                        {
                            init_entry = globalInit;
                            break;
                        }
                    }
                    if (init_entry == null)
                    {
                        UndertaleGlobalInit NewInit = new UndertaleGlobalInit();
                        NewInit.Code = code;
                        Data.GlobalInitScripts.Add(NewInit);
                    }
                    else
                    {
                        UndertaleGlobalInit NewInit = init_entry;
                        NewInit.Code = code;
                    }
                }
            }
            SafeImport(codeName, gmlCode, IsGML);
        }
    }
}
