using Yarhl.FileFormat;
using Yarhl.Media.Text;

namespace TraduDelta
{
    public class Po2json : IConverter<Po, Texts>
    {
        public Texts Convert(Po source)
        {
            Texts t = new Texts();

            foreach (var entry in source.Entries)
            {
                t.Keys.Add(entry.Context.Replace("<EMPTY>", string.Empty));
                t.Values.Add(entry.Original.Replace("<CONTROL>", "\u0016").Replace("\n", "&").Replace("<F>", "\f").Replace("<EMPTY>", string.Empty));
                if (!entry.Translated.Equals(string.Empty))
                {
                    t.TranslatedValues.Add(entry.Context, entry.Translated);
                }
            }
            return t;
        }
    }
}