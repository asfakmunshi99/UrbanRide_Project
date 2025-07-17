using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfile : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            LoadPersonalDetails();
            LoadBookings();
            LoadHosting();
        }
    }

    

    private void LoadPersonalDetails()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT username, email FROM users WHERE id = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblUserName.Text = reader["username"].ToString();
                        lblEmail.Text = reader["email"].ToString();
                     
                    }
                    reader.Close();
                }
            }
        }
        catch (Exception ex)
        {
            // Handle error
            Response.Write("<script>alert('Error loading personal details');</script>");
        }
    }

    private void LoadBookings()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                 string query = @"SELECT b.BookingID, v.Brand + ' ' + v.Model AS Vehicle, 
                           b.PickupDate, b.ReturnDate, b.Status, b.ReferenceNumber 
                           FROM Bookings b
                           INNER JOIN Vehicles v ON b.VehicleID = v.VehicleID
                           WHERE b.UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptBookings.DataSource = dt;
                        rptBookings.DataBind();
                        lblNoBookings.Visible = false;
                    }
                    else
                    {
                        lblNoBookings.Visible = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Handle error
            Response.Write("<script>alert('Error loading bookings');</script>");
        }
    }

    private void LoadHosting()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Brand, Model, RcNumber, Price, City, Approval FROM vehicles WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptHosting.DataSource = dt;
                        rptHosting.DataBind();
                        lblNoHosting.Visible = false;
                    }
                    else
                    {
                        lblNoHosting.Visible = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Handle error
            Response.Write("<script>alert('Error loading Listing vehicles');</script>");
        }
    }

    protected void btnPersonal_Click(object sender, EventArgs e)
    {
        mvProfile.ActiveViewIndex = 0;
    }

    protected void btnBookings_Click(object sender, EventArgs e)
    {
        mvProfile.ActiveViewIndex = 1;
    }

    protected void btnHosting_Click(object sender, EventArgs e)
    {
        mvProfile.ActiveViewIndex = 2;
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Write("<script>alert('Logged out successfully');window.location='Login.aspx';</script>");
    }
    protected void rptBookings_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "CancelBooking")
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);
            CancelBooking(bookingId);
        }
    }

    private void CancelBooking(int bookingId)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Bookings SET Status = 'Cancelled' WHERE BookingID = @BookingID AND UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingId);
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Reload bookings
                        LoadBookings();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Booking cancelled successfully.');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert",
                            "alert('Failed to cancel booking.');", true);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Error cancelling booking: " + ex.Message + "');", true);
        }
    }
}