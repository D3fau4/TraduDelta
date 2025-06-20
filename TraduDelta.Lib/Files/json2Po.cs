﻿using Yarhl.FileFormat;
using Yarhl.Media.Text;

namespace TraduDelta.Lib.Files;

public class json2Po : IConverter<Texts, Po>
{
    public Po Convert(Texts source)
    {
        //Read the language used by the user' OS, this way the editor can spellcheck the translation. - Thanks Liquid_S por the code
        var currentCulture = Thread.CurrentThread.CurrentCulture;
        var po = new Po
        {
            Header = new PoHeader("Deltarune Chapter 1&2", "anyemail@D3fau4.com", currentCulture.Name)
            {
                LanguageTeam = "Any"
            }
        };

        for (var i = 0; i < source.Keys.Count; i++)
        {
            if (source.Values[i] == string.Empty || source.Values[i] == null) source.Values[i] = "<EMPTY>";
            if (source.Keys[i] == string.Empty) source.Keys[i] = "<EMPTY>";
            if (source.Values[i].Contains("&")) source.Values[i] = source.Values[i].Replace("&", "\n");
            if (source.Values[i].Contains("\u0016")) source.Values[i] = source.Values[i].Replace("\u0016", "<CONTROL>");
            if (source.Values[i].Contains('\f')) source.Values[i] = source.Values[i].Replace("\f", "<F>");

            var translation = string.Empty;

            if (source.TranslatedValues.Count > 0)
            {
                var check = source.TranslatedValues.TryGetValue(source.Keys[i], out var value);
                if (check) translation = value.Replace("\\\\", "\\").Replace("\\\"", "\"").Replace('\f', 'ç');
            }

            po.Add(new PoEntry(source.Values[i])
            {
                Flags = "game-Delta",
                Translated = translation,
                Context = source.Keys[i]
            });
        }

        return po;
    }

    public Po Convert(Texts source, Texts tradu)
    {
        //Read the language used by the user' OS, this way the editor can spellcheck the translation. - Thanks Liquid_S por the code
        var currentCulture = Thread.CurrentThread.CurrentCulture;
        var po = new Po
        {
            Header = new PoHeader("Deltarune Chapter 1&2", "anyemail@D3fau4.com", currentCulture.Name)
            {
                LanguageTeam = "Any"
            }
        };

        for (var i = 0; i < source.Keys.Count; i++)
        {
            /* clean */
            if (source.Values[i] == string.Empty || source.Values[i] == null) source.Values[i] = "<EMPTY>";
            if (source.Keys[i] == string.Empty) source.Keys[i] = "<EMPTY>";
            if (source.Values[i].Contains("&")) source.Values[i] = source.Values[i].Replace("&", "\n");
            if (source.Values[i].Contains("\u0016")) source.Values[i] = source.Values[i].Replace("\u0016", "<CONTROL>");
            if (source.Values[i].Contains('\f')) source.Values[i] = source.Values[i].Replace("\f", "<F>");

            if (tradu.Values[i] == string.Empty || tradu.Values[i] == null) tradu.Values[i] = "<EMPTY>";
            if (tradu.Keys[i] == string.Empty) tradu.Keys[i] = "<EMPTY>";
            if (tradu.Values[i].Contains("&")) tradu.Values[i] = tradu.Values[i].Replace("&", "\n");
            if (tradu.Values[i].Contains("\u0016")) tradu.Values[i] = tradu.Values[i].Replace("\u0016", "<CONTROL>");
            if (tradu.Values[i].Contains('\f')) tradu.Values[i] = tradu.Values[i].Replace("\f", "<F>");
            /* clean */

            po.Add(new PoEntry(source.Values[i])
            {
                Context = source.Keys[i],
                Translated = tradu.Values[i]
            });
        }

        return po;
    }
}