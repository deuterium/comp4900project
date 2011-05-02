<%@ Application Language="C#" %>

<script runat="server">
    ///Global.asax
    ///BCCA Cancer Research Centre
    ///Safety Training Database and Website
    ///Authors: BCIT COMP4900 2011
    ///Chris Wood - chriswood.ca@gmail.com
    ///Daisy Yuen - yuen.daisy@gmail.com
    ///Kalen Wessel - kalen.wessel@gmail.com
    ///Lindsay Fester - lindsay_f@live.com
    ///Michael Anderson - anderson.michael23@gmail.com
    
    ///Not Used
    void Application_Start(object sender, EventArgs e) {}
    ///Not Used
    void Application_End(object sender, EventArgs e) {}
    ///Not Used
    void Application_Error(object sender, EventArgs e) {}

    /// <summary>
    /// Creates an "AuthenticatedUser" session value to be used
    /// to store the username of a user once they are authenticated.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    void Session_Start(object sender, EventArgs e) 
    {
        Session["AuthenticatedUser"] = String.Empty;
        Session["AuthenticationHash"] = String.Empty;

    }
    ///Not Used
    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    /// <summary>
    /// Function to check if user is authenticated
    /// Redirects to login if user has not logged in yet
    /// TODO: This is possibly unsecure to cookie editing, look into something around this
    /// MAKE SESSION VALUE HASHED word constant
    /// </summary>
    public static void Session_Authentication() {
        if (!HttpContext.Current.Session["AuthenticationHash"].ToString()
            .Equals(FormsAuthentication.HashPasswordForStoringInConfigFile("&U74U53R", "MD5"))) 
        {
            HttpContext.Current.Response.Redirect("~/Login.aspx");
        }
    }
       
</script>
