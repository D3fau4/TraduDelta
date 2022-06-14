using TraduDelta.Lib.Files;
using UndertaleModLib;

namespace TraduDelta.Lib.Utils.Helpers;

public class ModHelper : IHelper
{
    /// <summary>
    ///     Apply all mods
    /// </summary>
    /// <param name="path">game.win path</param>
    public void Process(string path)
    {
        if (path.Contains(".win"))
        {
            UndertaleData Data = null;

            using (var stream = new FileStream(path, FileMode.Open, FileAccess.Read))
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
                    if (true)
                        Data.Strings.MakeString(
                            "4275696c6420636f6d70696c61646f206578706cc3ad636974616d656e74652070617261206c612074726164756" +
                            "36369c3b36e2064656c2065717569706f204454532070617261207375732070726f796563746f73207075626c6963616" +
                            "46f7320656e205472616475537175617265");
                    var build = new GameWin(Data);
                    build.save(path);
                    cmdutils.print("Done! " + path.Replace(".win", ".mod.win") + " was saved.",
                        ConsoleColor.Green);
                }
        }
    }
}