using Yarhl.FileFormat;
using Yarhl.Media.Text;

namespace TraduDelta
{
    class json2Po : IConverter<Texts, Po>
    {
        public Po Convert(Texts source)
        {
            //Read the language used by the user' OS, this way the editor can spellcheck the translation. - Thanks Liquid_S por the code
            var currentCulture = System.Threading.Thread.CurrentThread.CurrentCulture;
            var po = new Po
            {
                Header = new PoHeader("Deltarune Chapter 1&2", "anyemail@D3fau4.com", currentCulture.Name)
                {
                    LanguageTeam = "Any"
                }
            };

            for (int i = 0; i < source.Keys.Count; i++)
            {
                if (source.Values[i] == string.Empty || source.Values[i] == null)
                {
                    source.Values[i] = "<EMPTY>";
                }
                if (source.Keys[i] == string.Empty)
                {
                    source.Keys[i] = "<EMPTY>";
                }
                if (source.Values[i].Contains("&"))
                {
                    source.Values[i] = source.Values[i].Replace("&", "\n");
                }
                if (source.Values[i].Contains("\u0016"))
                {
                    source.Values[i] = source.Values[i].Replace("\u0016", "<CONTROL>");
                }
                if (source.Values[i].Contains('\f'))
                {
                    source.Values[i] = source.Values[i].Replace("\f", "<F>");
                }
                po.Add(new PoEntry(source.Values[i])
                {
                    Context = source.Keys[i],
                });
            }

            return po;
        }
    }
}
