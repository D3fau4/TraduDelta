using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yarhl.FileSystem;
using Yarhl.Media.Text;

namespace TraduDelta
{
    class Powritter
    {
        public static void write(Dictionary<string, string> keyValuePairs, string file)
        {
            Texts me = new Texts();

            me.Keys = new List<string>(keyValuePairs.Keys);
            me.Values = new List<string>(keyValuePairs.Values);
            json2Po po = new json2Po();
            var meme = po.Convert(me);
            Po2Binary po2Binary = new Po2Binary();
            var binary = po2Binary.Convert(meme);
            var node1 = new Node(Path.GetFileName(file), binary);
            if (!Directory.Exists("OUT_PO"))
                Directory.CreateDirectory("OUT_PO");
            node1.Stream.WriteTo(Path.Combine("OUT_PO", Path.GetFileName(file).Replace(".asm", ".po")));
        }
    }
}
