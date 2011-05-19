using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            Label1.Text += Session["AuthenticatedUser"].ToString();
            Label2.Text += Session["AuthenticationHash"].ToString();
            Label3.Text += Session["RoleNo"].ToString();
            Label4.Text += Session["DeptNo"].ToString();
        }
    }
}