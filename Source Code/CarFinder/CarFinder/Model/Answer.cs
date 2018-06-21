using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prototype
{
    public abstract class Answer
    {
        protected Object _answerValue;
        protected int _importance;


        public abstract int Importance();
        public abstract Object AnswerValue();
    }
}