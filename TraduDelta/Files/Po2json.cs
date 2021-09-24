using Yarhl.FileFormat;
using Yarhl.Media.Text;

namespace TraduDelta
{
    public class Po2json : IConverter<Po, Texts>
    {
        Texts json;
        public Texts Convert(Po source)
        {
            json = new Texts();

            foreach (var entry in source.Entries)
            {
                json.Keys.Add(entry.Context.Replace("<EMPTY>", string.Empty));
                json.Values.Add(entry.Translated.Replace("<CONTROL>", "\u0016").Replace("\n", "&").Replace("<F>", "\f").Replace("<EMPTY>", string.Empty));
            }

            return json;
        }
    }
}