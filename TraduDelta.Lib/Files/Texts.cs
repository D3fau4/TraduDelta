using Yarhl.FileFormat;

namespace TraduDelta.Lib.Files;

public class Texts : IFormat
{
    public Texts()
    {
        Keys = new List<string>();
        Values = new List<string>();
        TranslatedValues = new Dictionary<string, string>();
    }

    public List<string> Keys { get; set; }
    public List<string> Values { get; set; }
    public Dictionary<string, string> TranslatedValues { get; set; }
}