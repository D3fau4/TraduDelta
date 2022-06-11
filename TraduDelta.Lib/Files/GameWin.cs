using UndertaleModLib;

namespace TraduDelta.Lib.Files;

public class GameWin
{
    private readonly UndertaleData Data;

    public GameWin(UndertaleData Data)
    {
        this.Data = Data;
    }

    public void save(string path)
    {
        if (Data == null || Data.UnsupportedBytecodeVersion)
            return;
        try
        {
            using (var stream = new FileStream(path + "temp", FileMode.Create, FileAccess.Write))
            {
                UndertaleIO.Write(stream, Data, message => { });
            }

            if (File.Exists(path.Replace(".win", ".mod.win"))) File.Delete(path.Replace(".win", ".mod.win"));
            File.Move(path + "temp", path.Replace(".win", ".mod.win"));
        }
        catch (Exception)
        {
        }
    }
}