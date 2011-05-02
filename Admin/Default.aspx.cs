using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASP.global_asax.Session_Authentication();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = Session["AuthenticatedUser"].ToString();
    }
}