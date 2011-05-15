using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Training_Default : System.Web.UI.Page
{// Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    protected void Page_Load(object sender, EventArgs em)
    {
        //DateTime currentDate = DateTime.Now;
        //var q = ctx.Employees.Where(e => e.empNo == 6)
        //                       .Join(
        //                          ctx.TrainingTakens,
        //                          emp => emp.empNo,
        //                          TT => TT.empNo,
        //                          (emp, TT) =>
        //                             new
        //                             {
        //                                 emp = emp,
        //                                 TT = TT
        //                             }
        //                       )
        //                       .Join(
        //                          ctx.TrainingCourses,
        //                          temp0 => temp0.TT.trainingNo,
        //                          TC => TC.trainingNo,
        //                          (temp0, TC) =>
        //                             new
        //                             {
        //                                 temp0 = temp0,
        //                                 TC = TC
        //                             }
        //                       )
        //                       .Where(temp1 => (currentDate <= temp1.temp0.TT.endDate))
        //                       .Select(
        //                          temp1 =>
        //                             new
        //                             {
        //                                 coursename = temp1.TC.trainingName,
        //                                 lastname = temp1.temp0.emp.lname,
        //                                 firstname = temp1.temp0.emp.fname,
        //                                 startdate = temp1.temp0.TT.startDate,
        //                                 enddate = temp1.temp0.TT.endDate
        //                             }
        //                       );
        //int poop = q.Count();
        //GridView1.DataSource = q;
        //GridView1.DataBind();
    }
}