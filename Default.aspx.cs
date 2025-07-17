using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set minimum date for pickers
            txtTripStart.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
            txtTripEnd.Attributes["min"] = DateTime.Today.ToString("yyyy-MM-dd");
        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Response.Redirect(string.Format("car_list.aspx?city={0}&pickup={1}&return={2}",
            Server.UrlEncode(txtPickup.Text),
            Server.UrlEncode(txtTripStart.Text),
            Server.UrlEncode(txtTripEnd.Text)));
        }
    }
    protected void btnSubmitFeedback_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtFeedbackName.Text) || string.IsNullOrEmpty(txtFeedbackEmail.Text) ||
        string.IsNullOrEmpty(txtFeedbackMessage.Text))
        {
            // This should never be reached because of client-side validation
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill all fields!');", true);
            return;
        }
        try
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = @"INSERT INTO Feedback 
                          (Name, Email, Message) 
                          VALUES 
                          (@Name, @Email, @Message)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtFeedbackName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtFeedbackEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Message", txtFeedbackMessage.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            // Clear fields and show success message
            txtFeedbackName.Text = "";
            txtFeedbackEmail.Text = "";
            txtFeedbackMessage.Text = "";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
            "alert('Thank you for your feedback!');", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
           "alert('Error submitting feedback. Please try again later.');", true);
        }
    }
}