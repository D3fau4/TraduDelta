using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TraduDelta
{
    class json
    {
        public static void writejson(List<string> key, List<string> value)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.Indented;
                writer.WriteStartObject();
                for (int i = 0; i < key.Count; i++)
                {
                    writer.WritePropertyName(key[i].ToString());
                    writer.WriteValue(value[i].ToString());
                }
                writer.WriteEndObject();
            }
            File.WriteAllText("meme.json", sb.ToString());
        }
    }
}
