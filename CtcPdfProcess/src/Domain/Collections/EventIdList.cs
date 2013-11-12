using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.Domain.Collections
{
    public class EventIdList : List<int>
    {
        public EventIdList() : base() { }

        public EventIdList(EventIdList eventIdList) : base()
        {
            foreach (int j in eventIdList)
            {
                this.Add(j);
            }
        }

        public override bool Equals(object obj)
        {
            bool ret = true;
            List<int> other = (List<int>)obj;

            this.Sort();
            other.Sort();

            for (int i = 0; i < this.Count; i++)
            {
                if (i > other.Count - 1)
                {
                    ret = false;
                    break;
                }
                else
                {
                    if (this[i] != other[i])
                    {
                        ret = false;
                        break;
                    }
                }
            }

            return ret;
        }
    }
}
