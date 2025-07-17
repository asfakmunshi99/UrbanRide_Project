using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string username = txtunm.Text.Trim();
        string email = txtemail.Text.Trim();
        string password = txtpass.Text.Trim();
        string confirmPassword = txtcnfpass.Text.Trim();


        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Check if the username or email already exists
                string checkQuery = "SELECT COUNT(*) FROM users WHERE username = @username OR email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@username", username);
                    checkCmd.Parameters.AddWithValue("@Email", email);

                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (count > 0)
                    {
                        lblMessage.Text = "Username or Email already exists!";
                        return;
                    }
                }

                // Insert new user into the database
                string insertQuery = "INSERT INTO users (username, email, password, role) VALUES (@username, @Email, @Password, 'user')";
                using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                {
                    insertCmd.Parameters.AddWithValue("@username", username);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@Password", password);

                    int rowsAffected = insertCmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Registration successful!";
                        Response.Redirect("~/login.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Registration failed. Please try again!";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "An error occurred during registration. Please try again later.";
        }
    }
}