using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class MyBookings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=MyBookings.aspx");
                return;
            }

            LoadUserBookings();
        }
    }

    private void LoadUserBookings()
    {
        int userId = Convert.ToInt32(Session["UserId"]);
        string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        string query = @"
            SELECT b.BookingID, b.ReferenceNumber, b.PickupDate, b.ReturnDate, 
                   b.BookingDate, b.TotalAmount, b.Status,
                   v.Brand, v.Model, v.RcNumber, v.City, v.Price
            FROM Bookings b
            INNER JOIN Vehicles v ON b.VehicleID = v.VehicleID
            WHERE b.UserID = @UserId
            ORDER BY b.BookingDate DESC";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);

                try
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptBookings.DataSource = dt;
                        rptBookings.DataBind();
                    }
                    else
                    {
                        pnlNoBookings.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    // Log error
                    Response.Write("<script>alert('Error loading bookings. Please try again later.');</script>");
                }
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}