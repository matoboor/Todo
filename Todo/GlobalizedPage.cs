using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;

namespace Todo
{
    public class GlobalizedPage : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            if (Request.Cookies["Culture"] != null)
            {
                Thread.CurrentThread.CurrentCulture =
                    CultureInfo.CreateSpecificCulture(Request.Cookies["Culture"].Value);

                Thread.CurrentThread.CurrentUICulture = new CultureInfo(Request.Cookies["Culture"].Value);

                base.InitializeCulture();
            }
            else
            {
                Thread.CurrentThread.CurrentCulture =
                    CultureInfo.CreateSpecificCulture("en-GB");

                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-GB");

                base.InitializeCulture();
            }
        }
    }
}