using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Summary_Default : System.Web.UI.Page
{
    /* Chris LOVES t3h pen0r TODO */
    static BCCAEntities ctx = new BCCAEntities();
    private int department;
    private string labManager;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BCCAEntities ctx = new BCCAEntities();
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr });
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField = "text";
            ddlLabLabManager.DataBind();
        }

    }
    protected void btnInspectionLookUp_Click(object sender, EventArgs e)
    {
        department = Convert.ToInt32(tbxLabDepartment.Text);
        labManager  = Convert.ToString(ddlLabLabManager.SelectedValue);

        grvLabInspections.DataSource = ctx.LabInspections.Select(LI => LI).Where(LI => ((LI.deptNo == department))
                                                                                && (LI.labMgr == labManager));
        grvLabInspections.DataBind();
    }

}