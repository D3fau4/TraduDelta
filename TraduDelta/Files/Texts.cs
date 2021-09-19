using System.Collections.Generic;
using Yarhl.FileFormat;

namespace TraduDelta
{
    public class Texts : IFormat
    {
        public List<string> Keys { get; set; }
        public List<string> Values { get; set; }
    }
}
