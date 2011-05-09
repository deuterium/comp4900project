using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlPop.Style.Value = "display:none;";
    }
    protected void A_Click(object sender, EventArgs e)
    {
        pnlPop.Style.Value = "display:block;";

    }
    protected void B_Click(object sender, EventArgs e)
    {
        pnlPop.Style.Value = "display:block;";
        MPE.Show();
    }
}