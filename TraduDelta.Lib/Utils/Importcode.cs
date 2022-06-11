using UndertaleModLib;
using UndertaleModLib.Decompiler;
using UndertaleModLib.Models;

namespace TraduDelta.Lib.Utils;

internal class Importcode
{
    public static string ProfilesFolder = Path.Combine("tmp", "Profiles");
    private readonly UndertaleData Data;

    public Importcode(UndertaleData Data)
    {
        this.Data = Data;
    }

    public void NukeProfileGML(string codeName)
    {
        // This is written as intended
        var path = Path.Combine(ProfilesFolder, Data.ToolInfo.CurrentMD5, "Temp", codeName + ".gml");
        if (File.Exists(path)) File.Delete(path);
    }

    private void SafeImport(string codeName, string gmlCode, bool IsGML, bool destroyASM = true,
        bool CheckDecompiler = false)
    {
        try
        {
            if (IsGML)
            {
                Data.Code.ByName(codeName).ReplaceGML(gmlCode, Data);

                // Write to profile if necessary.
                var path = Path.Combine(ProfilesFolder, Data.ToolInfo.CurrentMD5, "Temp", codeName + ".gml");
                if (File.Exists(path))
                    File.WriteAllText(path, Decompiler.GetDecompiledText(Data, codeName));
            }
            else
            {
                var instructions = Assembler.Assemble(gmlCode, Data);
                Data.Code.ByName(codeName).Replace(instructions);
                if (destroyASM)
                    NukeProfileGML(codeName);
            }
        }
        catch (Exception ex)
        {
            if (!CheckDecompiler)
            {
                var ErrorText = "Error at " + (IsGML ? "GML code: " : "ASM code: ") + codeName + @"': " + gmlCode +
                                "\nError: " + ex;
                //MessageBox.Show(ErrorText, "UndertaleModTool", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                Import(codeName, "", false);
                //throw new Exception("Error!");
            }
        }
    }

    public void Import(string codeName, string gmlCode, bool IsGML = true, bool doParse = true, bool destroyASM = true,
        bool CheckDecompiler = false)
    {
        var SkipPortions = false;
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
            code.GenerateLocalVarDefinitions(code.FindReferencedLocalVars(),
                locals); // Dunno if we actually need this line, but it seems to work?
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
                    if (globalInit.Code.Name.Content == codeName)
                    {
                        init_entry = globalInit;
                        break;
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
            else if (codeName.Substring(0, 10).Equals("gml_Object"))
            {
                var afterPrefix = codeName.Substring(11);
                var underCount = 0;
                string methodNumberStr = "", methodName = "", objName = "";
                for (var i = afterPrefix.Length - 1; i >= 0; i--)
                    if (afterPrefix[i] == '_')
                    {
                        underCount++;
                        if (underCount == 1)
                        {
                            methodNumberStr = afterPrefix.Substring(i + 1);
                        }
                        else if (underCount == 2)
                        {
                            objName = afterPrefix.Substring(0, i);
                            methodName = afterPrefix.Substring(i + 1,
                                afterPrefix.Length - objName.Length - methodNumberStr.Length - 2);
                            break;
                        }
                    }

                var methodNumber = 0;
                try
                {
                    methodNumber = int.Parse(methodNumberStr);
                    if (methodName == "Collision" && (methodNumber >= Data.GameObjects.Count || methodNumber < 0))
                    {
                        var doNewObj = true;
                        if (doNewObj)
                        {
                            UndertaleGameObject gameObj = new UndertaleGameObject();
                            //gameObj.Name = Data.Strings.MakeString(SimpleTextInput("Enter object name", "Enter object name", "This is a single text line input box test.", false));
                            Data.GameObjects.Add(gameObj);
                        }
                        else
                        {
                            // It *needs* to have a valid value, make the user specify one.
                            var possible_values = new List<uint>();
                            possible_values.Add(uint.MaxValue);
                            //methodNumber = (int)ReduceCollisionValue(possible_values);
                        }
                    }
                }
                catch
                {
                    if (afterPrefix.LastIndexOf("_Collision_") != -1)
                    {
                        var s2 = "_Collision_";
                        objName = afterPrefix.Substring(0, afterPrefix.LastIndexOf("_Collision_"));
                        methodNumberStr = afterPrefix.Substring(afterPrefix.LastIndexOf("_Collision_") + s2.Length,
                            afterPrefix.Length - (afterPrefix.LastIndexOf("_Collision_") + s2.Length));
                        methodName = "Collision";
                        // GMS 2.3+ use the object name for the one colliding, which is rather useful.
                        if (Data.GMS2_3)
                        {
                            if (Data.GameObjects.ByName(methodNumberStr) != null)
                            {
                                for (var i = 0; i < Data.GameObjects.Count; i++)
                                    if (Data.GameObjects[i].Name.Content == methodNumberStr)
                                    {
                                        methodNumber = i;
                                        break;
                                    }
                            }
                            else
                            {
                                var doNewObj = true;
                                if (doNewObj)
                                {
                                    UndertaleGameObject gameObj = new UndertaleGameObject();
                                    gameObj.Name = Data.Strings.MakeString(objName);
                                    Data.GameObjects.Add(gameObj);
                                }
                            }

                            if (Data.GameObjects.ByName(methodNumberStr) != null)
                            {
                                // It *needs* to have a valid value, make the user specify one, silly.
                                var possible_values = new List<uint>();
                                possible_values.Add(uint.MaxValue);
                                //ReassignGUIDs(methodNumberStr, ReduceCollisionValue(possible_values));
                            }
                        }
                    }
                }

                UndertaleGameObject obj = Data.GameObjects.ByName(objName);
                if (obj == null)
                {
                    var doNewObj = true;
                    if (doNewObj)
                    {
                        UndertaleGameObject gameObj = new UndertaleGameObject();
                        gameObj.Name = Data.Strings.MakeString(objName);
                        Data.GameObjects.Add(gameObj);
                    }
                    else
                    {
                        SkipPortions = true;
                    }
                }

                if (!SkipPortions)
                {
                    obj = Data.GameObjects.ByName(objName);
                    var eventIdx = (int)Enum.Parse(typeof(EventTypes), methodName);
                    var duplicate = false;
                    try
                    {
                        foreach (UndertaleGameObject.Event evnt in obj.Events[eventIdx])
                        foreach (UndertaleGameObject.EventAction action in evnt.Actions)
                            if (action.CodeId?.Name?.Content == codeName)
                                duplicate = true;
                    }
                    catch
                    {
                        // Something went wrong, but probably because it's trying to check something non-existent
                        // Just keep going
                    }

                    if (duplicate == false)
                    {
                        UndertalePointerList<UndertaleGameObject.Event> eventList = obj.Events[eventIdx];
                        UndertaleGameObject.EventAction action = new UndertaleGameObject.EventAction();
                        UndertaleGameObject.Event evnt = new UndertaleGameObject.Event();

                        action.ActionName = code.Name;
                        action.CodeId = code;
                        evnt.EventSubtype = (uint)methodNumber;
                        evnt.Actions.Add(action);
                        eventList.Add(evnt);
                    }
                }
            }
        }

        SafeImport(codeName, gmlCode, IsGML, destroyASM, CheckDecompiler);
    }

    private enum EventTypes
    {
        Create,
        Destroy,
        Alarm,
        Step,
        Collision,
        Keyboard,
        Mouse,
        Other,
        Draw,
        KeyPress,
        KeyRelease,
        Trigger,
        CleanUp,
        Gesture,
        PreCreate
    }
}