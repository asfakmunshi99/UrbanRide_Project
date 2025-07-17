using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class car_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["city"] != null)
            {
                string city = Request.QueryString["city"];
                lblCity.Text = city;

                // Store dates in session
                if (Request.QueryString["pickup"] != null && Request.QueryString["return"] != null)
                {
                    DateTime pickupDate;
                    DateTime returnDate;

                    if (DateTime.TryParse(Request.QueryString["pickup"], out pickupDate) &&
                        DateTime.TryParse(Request.QueryString["return"], out returnDate))
                    {
                        Session["PickupDate"] = pickupDate;
                        Session["ReturnDate"] = returnDate;
                    }
                }

                BindCars(city);
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }
    }

    private void BindCars(string city)
    {
        string connStr = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"SELECT VehicleID, Brand, Model, Year, TransmissionType, Segment,
                            FuelType, SeatingCapacity, Price, ImagePath1, IsAvailable
                            FROM vehicles 
                            WHERE City = @City AND Approval = 'Approved'";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@City", city);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptCars.DataSource = dt;
            rptCars.DataBind();
        }
    }

}