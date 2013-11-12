using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.Domain
{
    public class AllowableCharacters
    {
        public List<string> _characterList;

        public AllowableCharacters()
        {
            _characterList = new List<string>(new string[] {
            "Students",
            "students",
            "Student",
            "student",
            "Parents",
            "parents",
            "Parent",
            "parent",            
            ",",
            ";",
            "  e"} );          
        }

        public string RemoveAllowableCharacters(string input)
        {
            string ret = input;

            foreach (string s in _characterList)
            {
                ret = ret.Replace(s, String.Empty);
            }

            return ret.Trim();
        }
    }
}
