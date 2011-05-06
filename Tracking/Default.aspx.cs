using System;
using System.Linq;
using BCCAModel;
using System.Collections.Generic;


public partial class Tracking_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BCCAEntities ctx = new BCCAEntities();
        //List<Employers> employers = new List<Employers>();
        //var qry = ;

        List<String> employers = new List<String> { "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", "Other (specify)" };
        ddlEmployers.DataSource = employers;
        ddlEmployers.DataBind();

        
        ddlDepartments.DataSource = ctx.Departments;
        ddlDepartments.DataValueField = "deptName";
        ddlDepartments.DataBind();

    }

    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        //IList<State> states = GetStateList(GetCountryList()[((DropDownList)sender).SelectedIndex]);
        //ddlStates.DataSource = states;
        //ddlStates.DataBind();
    }
}