using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prototype
{
    public class Answer_1_String : Answer
    {
        public Answer_1_String(String answer, int importance)
        {
            _answerValue = answer;
            _importance = importance;
        }
        public override Object AnswerValue()
        {
            return _answerValue;
        }

        public override int Importance()
        {
            return _importance;
        }
    }
}