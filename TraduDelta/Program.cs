using System;
using System.IO;
using UndertaleModLib;
using UndertaleModLib.Compiler;
using UndertaleModLib.Decompiler;

namespace TraduDelta
{
    class Program
    {
        static void Main(string[] args)
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
                    foreach ( string file in Directory.GetFiles("Mods", "*.asm"))
                    {
                        Console.WriteLine(file);
                        Data.Scripts.ByName(Path.GetFileName(file))?.Code.Replace(Assembler.Assemble(@File.ReadAllText(file), Data.Functions, Data.Variables, Data.Strings));
                    }
                    foreach (string file in Directory.GetFiles("Mods", "*.gml"))
                    {
                        Console.WriteLine(file);
                        Data.Scripts.ByName(Path.GetFileName(file))?.Code.ReplaceGML(File.ReadAllText(file), Data);
                    }
                }
            }
        }
    }
}
