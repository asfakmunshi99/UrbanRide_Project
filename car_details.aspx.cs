using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

public partial class car_details : System.Web.UI.Page
{
    private decimal _dailyRate;
    private DateTime _pickupDate;
    private DateTime _returnDate;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check for required parameters
            if (Request.QueryString["VehicleID"] != null &&
                Request.QueryString["pickup"] != null &&
                Request.QueryString["return"] != null)
            {
                int vehicleId = Convert.ToInt32(Request.QueryString["VehicleID"]);

                // Get dates directly from query string
                _pickupDate = DateTime.Parse(Request.QueryString["pickup"]);
                _returnDate = DateTime.Parse(Request.QueryString["return"]);

                if (LoadVehicleDetails(vehicleId))
                {
                    LoadBookingDetails(_pickupDate, _returnDate);
                }
                else
                {
                    Response.Redirect("car_list.aspx");
                }
            }
            else
            {
                // Redirect back to search if any parameter is missing
                Response.Redirect("default.aspx");
            }
        }
    }

    private string CapitalizeFirstLetter(string input)
    {
        if (string.IsNullOrEmpty(input))
            return input;

        return char.ToUpper(input[0]) + input.Substring(1).ToLower();
    }

    private bool LoadVehicleDetails(int vehicleId)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query = @"SELECT VehicleID, Brand, Model, Year, TransmissionType, 
                    FuelType, SeatingCapacity, Price, ImagePath1, ImagePath2, ImagePath3,
                    Sunroof, Airbags, ABS, ChildSeat, ReverseCamera, SpareWheel
                    FROM vehicles WHERE VehicleID = @VehicleID";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@VehicleID", vehicleId);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // Set images directly from database paths
                        imgMain.ImageUrl = reader["ImagePath1"].ToString();

                        if (!string.IsNullOrEmpty(reader["ImagePath2"].ToString()))
                        {
                            imgSlide2.ImageUrl = reader["ImagePath2"].ToString();
                            pnlImage2.Visible = true;
                        }

                        if (!string.IsNullOrEmpty(reader["ImagePath3"].ToString()))
                        {
                            imgSlide3.ImageUrl = reader["ImagePath3"].ToString();
                            pnlImage3.Visible = true;
                        }

                        _dailyRate = Convert.ToDecimal(reader["Price"]);
                        ltBrand.Text = CapitalizeFirstLetter(reader["Brand"].ToString());
                        ltModel.Text = CapitalizeFirstLetter(reader["Model"].ToString());
                        ltYear.Text = reader["Year"].ToString();
                        ltPrice.Text = _dailyRate.ToString("0.00");
                        ltTransmission.Text = reader["TransmissionType"].ToString();
                        ltFuelType.Text = reader["FuelType"].ToString();
                        ltSeatingCapacity.Text = reader["SeatingCapacity"].ToString();

                        // 3. FEATURES - All your existing feature toggles
                        pnlSunroof.Visible = Convert.ToBoolean(reader["Sunroof"]);
                        pnlAirbags.Visible = Convert.ToBoolean(reader["Airbags"]);
                        pnlABS.Visible = Convert.ToBoolean(reader["ABS"]);
                        pnlChildSeat.Visible = Convert.ToBoolean(reader["ChildSeat"]);
                        pnlReverseCamera.Visible = Convert.ToBoolean(reader["ReverseCamera"]);
                        pnlSpareWheel.Visible = Convert.ToBoolean(reader["SpareWheel"]);

                        return true;
                    }
                }
            }
        }
        return false;
    }

    private void LoadBookingDetails(DateTime pickupDate, DateTime returnDate)
    {
        // Validate dates
        if (returnDate < pickupDate)
        {
            // If return date is before pickup, adjust it to 1 day after pickup
            returnDate = pickupDate.AddDays(1);
        }

        lblPickupDate.Text = pickupDate.ToString("dd MMM yyyy");
        lblReturnDate.Text = returnDate.ToString("dd MMM yyyy");

        // Calculate rental days and total price
        TimeSpan rentalPeriod = returnDate - pickupDate;
        int rentalDays = rentalPeriod.Days;

        lblDailyRate.Text = _dailyRate.ToString("0.00");
        decimal totalPrice = rentalDays * _dailyRate;

        lblRentalDays.Text = rentalDays.ToString();
        lblTotalPrice.Text = totalPrice.ToString("0.00");

        // Store values for booking confirmation
        ViewState["TotalPrice"] = totalPrice;
        ViewState["RentalDays"] = rentalDays;
        ViewState["PickupDate"] = pickupDate;
        ViewState["ReturnDate"] = returnDate;
    }

    protected void btnConfirmBooking_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx?returnUrl=" + HttpUtility.UrlEncode(Request.Url.PathAndQuery));
            return;
        }

        // Replace string interpolation with string concatenation
        string queryString = "?userId=" + Session["UserID"].ToString() +
                            "&vehicleId=" + Request.QueryString["VehicleID"] +
                            "&pickupDate=" + ((DateTime)ViewState["PickupDate"]).ToString("yyyy-MM-dd") +
                            "&returnDate=" + ((DateTime)ViewState["ReturnDate"]).ToString("yyyy-MM-dd") +
                            "&totalPrice=" + ((decimal)ViewState["TotalPrice"]).ToString("0.00");

        Response.Redirect("payment.aspx" + queryString);
    }
}