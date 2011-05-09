using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Inspections_Lab_Lab : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //rdoFireEvacYes.Checked = true;
        //testLabel.Text = rblFireEvac.SelectedItem.ToString();
    }
    protected void btnLabInspectionSubmit_Click(object sender, EventArgs e)
    {
        LabInspection inc = new LabInspection()
        {
            
        };

        LabInspectionDetail detailFireEvac = new LabInspectionDetail()
        {
            labItemNo = 1,
            @checked = this.rblFireEvac.SelectedItem.Value,
            comments = this.tbxCommentFireEvac.Text,
        };

        LabInspectionDetail detailFireExtinguish = new LabInspectionDetail() 
        {
            labItemNo = 2,
            @checked = this.rblFireExtinguish.SelectedValue,
            comments = this.tbxCommentFireExtinguish.Text,
        };

        BCCAEntities ctx = new BCCAEntities();

        ctx.AddToLabInspections(inc);
        ctx.SaveChanges();
    }
}