using System;
using System.Linq;
using BCCAModel;

/// <summary>
///Followup/Default.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Chris Wood - chriswood.ca@gmail.com
/// </summary>
public partial class Followup_Default : System.Web.UI.Page
{

    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Incident/Accident Followup

    protected void Populate_Incidents()
    { 
        //gvwFollowupIncidents.DataSource = ctx.Incidents.Where(
    }
    #endregion

    #region Lab Inspection Followup
    #endregion

    #region Office Inspection Followup
    #endregion
}