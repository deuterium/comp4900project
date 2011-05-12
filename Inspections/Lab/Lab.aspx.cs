using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Inspections_Lab_Lab : System.Web.UI.Page
{
    BCCAEntities ctx = new BCCAEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //rdoFireEvacYes.Checked = true;
        //testLabel.Text = rblFireEvac.SelectedItem.ToString();
    }
    protected void btnLabInspectionSubmit_Click(object sender, EventArgs e)
    {

        Page.Validate("vgpLabB");
        Page.Validate("vgpLabC");
        if (Page.IsValid)
        {
            
        }

        /*
        LabInspection inc = new LabInspection()
        {
            
        };


        ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labItemNo = 1,
                @checked = this.rblFireEvac.SelectedItem.Value,
                comments = this.tbxCommentFireEvac.Text,
            });

        LabInspectionDetail detailFireEvac = new LabInspectionDetail()
        ;

        LabInspectionDetail detailFireExtinguish = new LabInspectionDetail() 
        {
            labItemNo = 2,
            @checked = this.rblFireExtinguish.SelectedValue,
            comments = this.tbxCommentFireExtinguish.Text,
        };


        ctx.AddToLabInspections(inc);
        ctx.SaveChanges();
        */
    }
}