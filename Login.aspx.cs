using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Any initialization code can go here
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtunm.Text.Trim();
        string password = txtpass.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                // Adjusted SQL query to select 'Id' instead of 'UserId'
                string query = "SELECT Id, role, email FROM users WHERE username = @username AND password = @password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read()) // Using Read() instead of HasRows and Read()
                        {
                            int userId = Convert.ToInt32(reader["Id"]);
                            string role = reader["role"].ToString();
                            string email = reader["email"].ToString();

                            // Store Id, username, role, and email in session
                            Session["UserId"] = userId;
                            Session["username"] = username;
                            Session["role"] = role;
                            Session["email"] = email;

                            // Role-based redirection
                            if (role.Equals("admin", StringComparison.OrdinalIgnoreCase))
                            {
                                Response.Redirect("~/admin/Dashboard.aspx");
                            }
                            else if (role.Equals("user", StringComparison.OrdinalIgnoreCase))
                            {
                                Response.Redirect("~/Default.aspx");
                            }
                            else
                            {
                                // Handle unexpected roles
                                lblMessage.Text = "Unauthorized role.";
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Invalid Username or Password!";
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception details for debugging
            lblMessage.Text = "An error occurred. Please try again later.";
        }
    }
}
