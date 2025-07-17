using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization; // Needed for TextInfo

public partial class booking_confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["vehicleId"] == null)
            {
                Response.Redirect("default.aspx");
                return;
            }

            int vehicleId = Convert.ToInt32(Request.QueryString["vehicleId"]);
            DateTime pickupDate = DateTime.Parse(Request.QueryString["pickupDate"]);
            DateTime returnDate = DateTime.Parse(Request.QueryString["returnDate"]);
            string referenceNumber = Request.QueryString["referenceNumber"];

            // Display booking details
            litPickupDate.Text = pickupDate.ToString("dd MMM yyyy");
            litReturnDate.Text = returnDate.ToString("dd MMM yyyy");
            litBookingDate.Text = DateTime.Now.ToString("dd MMM yyyy");
            litReference.Text = referenceNumber;

            // Get vehicle details
            string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Brand, Model FROM vehicles WHERE VehicleID = @VehicleID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@VehicleID", vehicleId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Capitalize first letter of brand and model
                    TextInfo textInfo = CultureInfo.CurrentCulture.TextInfo;
                    string brand = textInfo.ToTitleCase(reader["Brand"].ToString().ToLower());
                    string model = textInfo.ToTitleCase(reader["Model"].ToString().ToLower());

                    litVehicle.Text = brand + " " + model;
                }
            }
        }
    }

    protected void btnBackToHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyBookings.aspx");
    }
}