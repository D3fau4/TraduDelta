﻿using Yarhl.FileFormat;
using Yarhl.Media.Text;

namespace TraduDelta.Lib.Files;

public class Po2json : IConverter<Po, Texts>
{
    public Texts Convert(Po source)
    {
        var t = new Texts();

        foreach (var entry in source.Entries)
        {
            t.Keys.Add(entry.Context.Replace("<EMPTY>", string.Empty));
            t.Values.Add(entry.Original.Replace("<CONTROL>", "\u0016").Replace("\n", "&").Replace("<F>", "\f")
                .Replace("<EMPTY>", string.Empty).Replace("\\\\", "\\").Replace("\\\"", "\"").Replace('\f', 'ç'));
            if (!entry.Translated.Equals(string.Empty)) t.TranslatedValues.Add(entry.Context, entry.Translated);
        }

        return t;
    }
}