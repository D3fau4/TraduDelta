using Yarhl.FileSystem;
using Yarhl.Media.Text;

namespace TraduDelta.Lib.Files;

internal class Powritter
{
    public static void write(Dictionary<string, string> keyValuePairs, string file)
    {
        var me = new Texts();

        me.Keys = new List<string>(keyValuePairs.Keys);
        me.Values = new List<string>(keyValuePairs.Values);
        var po = new json2Po();
        var meme = po.Convert(me);
        Po2Binary po2Binary = new Po2Binary();
        var binary = po2Binary.Convert(meme);
        var node1 = new Node(Path.GetFileName(file), binary);
        if (!Directory.Exists("OUT_PO"))
            Directory.CreateDirectory("OUT_PO");
        node1.Stream.WriteTo(Path.Combine("OUT_PO", Path.GetFileName(file).Replace(".asm", ".po")));
    }

    public static void write(Dictionary<string, string> keyValuePairs, Dictionary<string, string> keyValuePairsTradu,
        string file)
    {
        Console.WriteLine("Output: " + file);
        var me = new Texts();
        var tradu = new Texts();

        me.Keys = new List<string>(keyValuePairs.Keys);
        me.Values = new List<string>(keyValuePairs.Values);
        tradu.Keys = new List<string>(keyValuePairsTradu.Keys);
        tradu.Values = new List<string>(keyValuePairsTradu.Values);
        var po = new json2Po();
        var meme = po.Convert(me, tradu);
        Po2Binary po2Binary = new Po2Binary();
        var binary = po2Binary.Convert(meme);
        var node1 = new Node(Path.GetFileName(file), binary);
        if (!Directory.Exists("OUT_PO"))
            Directory.CreateDirectory("OUT_PO");
        node1.Stream.WriteTo(Path.Combine("OUT_PO", Path.GetFileName(file).Replace(".json", ".po")));
    }

    public static void write(Texts txt, string file)
    {
        Console.WriteLine("Output: " + file);
        var po = new json2Po();
        var meme = po.Convert(txt);
        Po2Binary po2Binary = new Po2Binary();
        var binary = po2Binary.Convert(meme);
        var node1 = new Node(Path.GetFileName(file), binary);
        if (!Directory.Exists("OUT_PO"))
            Directory.CreateDirectory("OUT_PO");
        node1.Stream.WriteTo(Path.Combine("OUT_PO", Path.GetFileName(file).Replace(".json", ".po")));
    }
}