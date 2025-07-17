using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mvForgetPassword.ActiveViewIndex = 0;
        }
    }

    protected void btnVerifyEmail_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string connectionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT COUNT(*) FROM users WHERE email = @Email";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    // Email exists, show password reset view
                    mvForgetPassword.ActiveViewIndex = 1;
                    lblEmailMessage.Text = "";

                    // In a real application, you would send a password reset email here
                    // For this example, we'll just proceed to the password reset view
                }
                else
                {
                    lblEmailMessage.Text = "Email not found in our system.";
                }
            }
        }
    }

    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text;
            string connectionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE users SET password = @Password WHERE email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Password", newPassword);
                    cmd.Parameters.AddWithValue("@Email", email);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblResetMessage.Text = "Password updated successfully!";
                        lblResetMessage.CssClass = "success-message";

                        // Redirect to login after 3 seconds
                        Response.AddHeader("REFRESH", "3;URL=Login.aspx");
                    }
                    else
                    {
                        lblResetMessage.Text = "Password update failed. Please try again.";
                    }
                }
            }
        }
    }
}