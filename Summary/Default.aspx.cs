using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Summary_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        BCCAEntities ctx = new BCCAEntities();
        ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labInsNo });
        ddlLabLabManager.DataValueField = "value";
        ddlLabLabManager.DataTextField = "text";
        ddlLabLabManager.DataBind();
    }
}