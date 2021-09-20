using System;
using System.IO;
using UndertaleModLib;

namespace TraduDelta
{
    class GameWin
    {
        private UndertaleData Data;
        public GameWin(UndertaleData Data)
        {
            this.Data = Data;
        }
        public void save(string path)
        {
            if (this.Data == null || this.Data.UnsupportedBytecodeVersion)
                return;
            bool save_complete = true;
            try
            {
                using (var stream = new FileStream(path + "temp", FileMode.Create, FileAccess.Write))
                {
                    UndertaleIO.Write(stream, Data, message =>
                    {
                        
                    });
                }

                if (File.Exists(path.Replace(".win", ".mod.win")))
                {
                    File.Delete(path.Replace(".win", ".mod.win"));
                }
                File.Move(path + "temp", path.Replace(".win", ".mod.win"));
            }
            catch (Exception ex)
            {
                save_complete = false;
            }
        }
    }
}
