using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.Domain
{
    public class IgnorableAnnotationExtractor
    {

        public List<string> _ignorableStringList;

        public IgnorableAnnotationExtractor()
        {
            _ignorableStringList = new List<string>(new string[] {
                "copy of" });
        }

        public bool containsIgnorableString(string input)
        {
            bool ret = false;
            foreach (string s in _ignorableStringList)
            {
                if (input.ToLower().Contains(s.ToLower()))
                {
                    ret = true;
                    break;
                }
            }

            return ret;
        }

    }
}
