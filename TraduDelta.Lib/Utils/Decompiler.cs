using UndertaleModLib;
using UndertaleModLib.Decompiler;
using UndertaleModLib.Models;

namespace TraduDelta.Lib.Utils;

internal class Decompiler
{
    private static string ReplaceFirst(string text, string search, string replace)
    {
        var pos = text.IndexOf(search);
        if (pos < 0) return text;
        return text.Substring(0, pos) + replace + text.Substring(pos + search.Length);
    }

    public static string GetDecompiledText(UndertaleData Data, string codeName)
    {
        var code = Data.Code.ByName(codeName);
        var DECOMPILE_CONTEXT = new GlobalDecompileContext(Data, false);
        try
        {
            return code != null ? UndertaleModLib.Decompiler.Decompiler.Decompile(code, DECOMPILE_CONTEXT) : "";
        }
        catch (Exception e)
        {
            return "/*\nDECOMPILER FAILED!\n\n" + e + "\n*/";
        }
    }

    public static Dictionary<string, string> Decompile(UndertaleData Data)
    {
        var meme = false;
        var fullpair = new Dictionary<string, string>();
        foreach (var code_orig in Data.Code)
        {
            code_orig.Offset = 0;
            if (Data.CodeLocals.ByName(code_orig.Name.Content) == null)
            {
                var locals = new UndertaleCodeLocals();
                locals.Name = code_orig.Name;
                uint codeLocalsCount = 0;
                var equivalentGlobalScript = code_orig.Name.Content.Replace("gml_Script_", "gml_GlobalScript_");
                if (Data.CodeLocals.ByName(equivalentGlobalScript) != null)
                {
                    foreach (var localvar in Data.CodeLocals.ByName(equivalentGlobalScript)
                                 .Locals)
                    {
                        var argsLocal = new UndertaleCodeLocals.LocalVar();
                        argsLocal.Name = localvar.Name;
                        argsLocal.Index = localvar.Index;
                        locals.Locals.Add(argsLocal);
                        codeLocalsCount += 1;
                    }

                    code_orig.LocalsCount = codeLocalsCount;
                    code_orig.GenerateLocalVarDefinitions(code_orig.FindReferencedLocalVars(), locals);
                    meme = false;
                }
                else
                {
                    var argsLocal = new UndertaleCodeLocals.LocalVar();
                    argsLocal.Name = Data.Strings.MakeString("arguments");
                    argsLocal.Index = 0;
                    locals.Locals.Add(argsLocal);
                    code_orig.LocalsCount = 1;
                    code_orig.GenerateLocalVarDefinitions(code_orig.FindReferencedLocalVars(), locals);
                }

                Data.CodeLocals.Add(locals);
            }

            var file_name = code_orig.Name.Content + ".asm";
            if (!meme)
            {
                var x = "";
                try
                {
                    var disasm_code = code_orig.Disassemble(Data.Variables, Data.CodeLocals.For(code_orig));
                    //ScriptMessage(code_orig.Name.Content);
                    //ScriptMessage("1 " + disasm_code);
                    var ix = -1;
                    if (code_orig.Instructions.Count > 0 &&
                        code_orig.Instructions[0].Kind == UndertaleInstruction.Opcode.B)
                        ix = disasm_code.IndexOf("b [");
                    var code = "";
                    if (ix != -1)
                    {
                        code = disasm_code.Substring(ix + 2, disasm_code.IndexOf(']', ix) - (ix + 1));
                        var toBeSearched2 = ReplaceFirst(disasm_code, "b " + code, "");
                        ix = toBeSearched2.IndexOf(":" + code);
                        x = "";
                        if (ix != -1)
                        {
                            code = toBeSearched2.Substring(ix, toBeSearched2.Length - ix);
                            x = toBeSearched2.Replace(code, "");
                        }

                        code_orig.Replace(Assembler.Assemble(x, Data));
                    }

                    var str_path_to_use = "";
                    if (file_name.Length > 150)
                        str_path_to_use = file_name.Substring(0, 150) + ".asm";
                    else
                        str_path_to_use = code_orig.Name.Content + ".asm";
                    var code_output = "";
                    if (code_orig != null)
                        code_output = code_orig.Disassemble(Data.Variables, Data.CodeLocals.For(code_orig));

                    fullpair.Add(str_path_to_use, code_output);
                }
                catch (Exception)
                {
                }
            }
        }

        return fullpair;
    }
}