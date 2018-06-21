using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using prototype.ErrorPages;

namespace prototype
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            if(exc.GetType() == typeof(HttpException))
            {
                Server.Transfer("~/ErrorPages/404.aspx");
            }

            Response.Write("<h2>Global Page Error</h2>\n");
            Response.Write("<p>" + exc.Message + "</p>\n");
            Response.Write("Return to the <a href='~/View/CarFinder.aspx'>" + "Home Page </a>\n");

            ExceptionUtility.Equals(exc, "Default Page");
            ExceptionUtility.NotifySystemOps(exc);

            Server.ClearError();
        }

        protected void Session_End(object sender, EventArgs e)
        {
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}