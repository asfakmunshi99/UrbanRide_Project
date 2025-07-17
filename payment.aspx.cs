using System;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

public partial class payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["userId"] == null ||
                Request.QueryString["vehicleId"] == null)
            {
                Response.Redirect("default.aspx");
            }
        }
    }

    private string GenerateReferenceNumber()
    {
        Random random = new Random();
        string referenceNumber = "";

        for (int i = 0; i < 10; i++)
        {
            referenceNumber += random.Next(0, 10).ToString();
        }

        return referenceNumber;
    }

    protected void btnBookNow_Click(object sender, EventArgs e)
    {
        try
        {
            int userId = Convert.ToInt32(Request.QueryString["userId"]);
            int vehicleId = Convert.ToInt32(Request.QueryString["vehicleId"]);
            DateTime pickupDate = DateTime.Parse(Request.QueryString["pickupDate"]);
            DateTime returnDate = DateTime.Parse(Request.QueryString["returnDate"]);
            decimal totalPrice = Convert.ToDecimal(Request.QueryString["totalPrice"]);
            string referenceNumber = GenerateReferenceNumber();
            string paymentMode = hdnPaymentMode.Value; // Get selected payment mode

            string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = @"INSERT INTO Bookings 
                               (UserID, VehicleID, PickupDate, ReturnDate, TotalAmount, 
                                Status, ReferenceNumber, PaymentMode)
                               VALUES (@UserID, @VehicleID, @PickupDate, @ReturnDate, 
                                       @TotalAmount, 'Confirmed', @ReferenceNumber, @PaymentMode)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@VehicleID", vehicleId);
                    cmd.Parameters.AddWithValue("@PickupDate", pickupDate);
                    cmd.Parameters.AddWithValue("@ReturnDate", returnDate);
                    cmd.Parameters.AddWithValue("@TotalAmount", totalPrice);
                    cmd.Parameters.AddWithValue("@ReferenceNumber", referenceNumber);
                    cmd.Parameters.AddWithValue("@PaymentMode", paymentMode);

                    cmd.ExecuteNonQuery();

                    Response.Redirect("booking_confirmation.aspx?vehicleId=" + vehicleId +
                                     "&pickupDate=" + pickupDate.ToString("yyyy-MM-dd") +
                                     "&returnDate=" + returnDate.ToString("yyyy-MM-dd") +
                                     "&referenceNumber=" + referenceNumber +
                                     "&paymentMode=" + paymentMode);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Booking failed. Please try again.');", true);
        }
    }
}