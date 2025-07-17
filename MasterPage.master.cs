using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] != null && Session["role"] != null && Session["role"].ToString() == "user")
            {
                // Show 'Profile' link and hide 'Login' link when user is logged in
                profileLink.Visible = true;
                loginLink.Visible = false;
            }
            else
            {
                // Show 'Login' link and hide 'Profile' link when user is not logged in
                profileLink.Visible = false;
                loginLink.Visible = true;
            }
        }
    }

}
