using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yarhl.FileFormat;

namespace TraduDelta
{
    public class Texts : IFormat
    {
        public List<string> Keys {  get; set; }
        public List<string> Values {  get; set;}
    }
}
