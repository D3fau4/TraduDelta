using System;
using System.IO;
using UndertaleModLib;
using UndertaleModLib.Decompiler;
using UndertaleModLib.Models;

namespace TraduDelta
{
    class Decompiler
    {
        string ReplaceFirst(string text, string search, string replace)
        {
            int pos = text.IndexOf(search);
            if (pos < 0)
            {
                return text;
            }
            return text.Substring(0, pos) + replace + text.Substring(pos + search.Length);
        }

        void Decompile(UndertaleData Data)
        {
            foreach (var code_orig in Data.Code)
            {
                code_orig.Offset = 0;
                if (Data.CodeLocals.ByName(code_orig.Name.Content) == null)
                {
                    UndertaleCodeLocals locals = new UndertaleCodeLocals();
                    locals.Name = code_orig.Name;
                    uint codeLocalsCount = 0;
                    string equivalentGlobalScript = (code_orig.Name.Content).Replace("gml_Script_", "gml_GlobalScript_");
                    if (Data.CodeLocals.ByName(equivalentGlobalScript) != null)
                    {
                        foreach (UndertaleCodeLocals.LocalVar localvar in Data.CodeLocals.ByName(equivalentGlobalScript).Locals)
                        {
                            UndertaleCodeLocals.LocalVar argsLocal = new UndertaleCodeLocals.LocalVar();
                            argsLocal.Name = localvar.Name;
                            argsLocal.Index = localvar.Index;
                            locals.Locals.Add(argsLocal);
                            codeLocalsCount += 1;
                        }
                        code_orig.LocalsCount = codeLocalsCount;
                        code_orig.GenerateLocalVarDefinitions(code_orig.FindReferencedLocalVars(), locals);
                        code_orig.DuplicateEntry = false;
                    }
                    else
                    {
                        UndertaleCodeLocals.LocalVar argsLocal = new UndertaleCodeLocals.LocalVar();
                        argsLocal.Name = Data.Strings.MakeString("arguments");
                        argsLocal.Index = 0;
                        locals.Locals.Add(argsLocal);
                        code_orig.LocalsCount = 1;
                        code_orig.GenerateLocalVarDefinitions(code_orig.FindReferencedLocalVars(), locals);
                    }
                    Data.CodeLocals.Add(locals);
                }
                string file_name = code_orig.Name.Content + ".asm";
                if (!code_orig.DuplicateEntry)
                {
                    string x = "";
                    try
                    {
                        string disasm_code = code_orig.Disassemble(Data.Variables, Data.CodeLocals.For(code_orig));
                        //ScriptMessage(code_orig.Name.Content);
                        //ScriptMessage("1 " + disasm_code);
                        int ix = -1;
                        if (code_orig.Instructions.Count > 0 && code_orig.Instructions[0].Kind == UndertaleInstruction.Opcode.B)
                            ix = disasm_code.IndexOf("b [");
                        string code = "";
                        if (ix != -1)
                        {
                            code = disasm_code.Substring(ix + 2, disasm_code.IndexOf(']', ix) - (ix + 1));
                            string toBeSearched2 = ReplaceFirst(disasm_code, "b " + code, "");
                            ix = toBeSearched2.IndexOf(":" + code);
                            x = "";
                            if (ix != -1)
                            {
                                code = toBeSearched2.Substring(ix, toBeSearched2.Length - (ix));
                                x = toBeSearched2.Replace(code, "");
                            }
                            code_orig.Replace(Assembler.Assemble(x, Data));
                        }
                        string str_path_to_use = "";
                        if (file_name.Length > 150)
                            str_path_to_use = file_name.Substring(0, 150) + ".asm";
                        else
                            str_path_to_use = code_orig.Name.Content + ".asm";
                        string code_output = "";
                        if (code_orig != null)
                            code_output = code_orig.Disassemble(Data.Variables, Data.CodeLocals.For(code_orig));
                        File.WriteAllText(str_path_to_use, code_output);
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
        }
    }
}
