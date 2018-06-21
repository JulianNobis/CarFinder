using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prototype.View
{
    public partial class ClearSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session["answers"] = new Dictionary<int, Answer>();
            Session["answeredQuestion"] = false;
            Session["gaveImportanceFactor"] = false;
            Session["ActiveViewIndex"] = 0;
            Session["allMarkedButtons"] = new List<String>();
            WebForm1 wf = new WebForm1();
            wf.Page_Load(null, EventArgs.Empty);
        }
    }
}