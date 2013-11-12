using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.Domain
{
    public class AnnotFormatter
    {
        private AllowableCharacters _allowableCharacters;
        private IgnorableAnnotationExtractor _ignorableAnnotationExtractor;

        public string[] FormattedStringArray { get; set; }
        public bool IgnoreFlag { get; set; }

        public AnnotFormatter(AllowableCharacters allowableCharacters,
            IgnorableAnnotationExtractor ignorableAnnotationExtractor)
        {
            this._allowableCharacters = allowableCharacters;
            this._ignorableAnnotationExtractor = ignorableAnnotationExtractor;
        }

        public void executeFormat(string input)
        {
            IgnoreFlag = _ignorableAnnotationExtractor.containsIgnorableString(input);
            if (IgnoreFlag)
                FormattedStringArray = new String[0];
            else
            {
                string formattedAnnotation = _allowableCharacters.RemoveAllowableCharacters(input);
                FormattedStringArray = formattedAnnotation.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            }
        }
    }
}
