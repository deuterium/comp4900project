using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;

public partial class Summary_Default : System.Web.UI.Page
{

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
            ddlLabLabManager.DataTextField  = "text";
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

    protected void btnCourseLookUp_Click(object sender, EventArgs e)
    {
        var q = from x in ctx.TrainingCourses
                select x;
        var total = q.Count();

        List<String> courseArray = ctx.TrainingCourses.Select(c => c.trainingName).ToList();


        for (int i = 0; i < total; i++)
        {
            GridView myGridView = new GridView();
            String temp = courseArray[i];
            myGridView.DataSource = ctx.Employees
                               .Join(
                                  ctx.TrainingTakens,
                                  emp => emp.empNo,
                                  TT => TT.empNo,
                                  (emp, TT) =>
                                     new
                                     {
                                         emp = emp,
                                         TT = TT
                                     }
                               )
                               .Join(
                                  ctx.TrainingCourses,
                                  temp0 => temp0.TT.trainingNo,
                                  TC => TC.trainingNo,
                                  (temp0, TC) =>
                                     new
                                     {
                                         temp0 = temp0,
                                         TC = TC
                                     }
                               )
                               .Where(temp1 => (temp1.TC.trainingName == temp))
                               .Select(
                                  temp1 =>
                                     new
                                     {
                                         lastname = temp1.temp0.emp.lname,
                                         firstname = temp1.temp0.emp.fname,
                                         startdate = temp1.temp0.TT.startDate,
                                         enddate = temp1.temp0.TT.endDate
                                     }
                               );
            grvPanelValidCourses.Controls.Add(myGridView);
            
            myGridView.Caption = "<table width=\"100%\" class=\"gvCaption\"><tr><td>" + temp + "</td></tr></table>";
            myGridView.DataBind();
        }
               
    }

}