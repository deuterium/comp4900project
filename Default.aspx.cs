﻿using System;
using System.Linq;
using System.Web.Security;
using BCCAModel;

public partial class _Default : System.Web.UI.Page
{

    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            //Label1.Text += Session["AuthenticatedUser"].ToString();
            //Label2.Text += Session["AuthenticationHash"].ToString();
            //Label3.Text += Session["RoleNo"].ToString();
            //Label4.Text += Session["DeptNo"].ToString();
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             