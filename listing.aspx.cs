using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;


public partial class listing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void btnNext1_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            // Redirect the user to the login page
            Response.Redirect("login.aspx");
            return;
        }
        MultiView1.ActiveViewIndex = 1; // Move to View2 (Personal Info)
    }

    protected void btnNext2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2; // Move to View3 (Vehicle Details)
    }

    protected void btnNext3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3; // Move to View4 (Technical Details)
    }

    protected void btnNext4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4; // Move to View5 (Additional Features)
    }

    protected void btnNext5_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 5; // Move to View6 (Upload Images)
    }

    // Previous Button Click Handlers
    protected void btnPrev1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0; // Go back to View1
    }

    protected void btnPrev2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1; // Go back to View2
    }

    protected void btnPrev3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2; // Go back to View3
    }

    protected void btnPrev4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3; // Go back to View4
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            int price = GetPriceBySegment(ddlSegment.SelectedValue);

            // Connection string from Web.config
            string connString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                // SQL query to insert vehicle details along with image paths
                string query = @"INSERT INTO Vehicles 
                        (UserId, OwnerName, Address, Mobile, City, Brand, Model, Year, RcNumber, 
                        TransmissionType, FuelType, SeatingCapacity, Segment, Sunroof, Airbags, ABS, 
                        ChildSeat, ReverseCamera, SpareWheel, Price, ImagePath1, ImagePath2, ImagePath3) 
                        VALUES 
                        (@UserId, @OwnerName, @Address, @Mobile, @City, @Brand, @Model, @Year, @RcNumber, 
                        @TransmissionType, @FuelType, @SeatingCapacity, @Segment, @Sunroof, @Airbags, @ABS, 
                        @ChildSeat, @ReverseCamera, @SpareWheel, @Price, @ImagePath1, @ImagePath2, @ImagePath3)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add all parameters as before...
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@OwnerName", txtOwnerName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@Brand", txtBrand.Text.Trim());
                    cmd.Parameters.AddWithValue("@Model", txtModel.Text.Trim());
                    cmd.Parameters.AddWithValue("@Year", txtYear.Text.Trim());
                    cmd.Parameters.AddWithValue("@RcNumber", txtRcNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@TransmissionType", ddlTransmission.SelectedValue);
                    cmd.Parameters.AddWithValue("@FuelType", ddlFuelType.SelectedValue);
                    cmd.Parameters.AddWithValue("@SeatingCapacity", ddlSeatingCapacity.SelectedValue);
                    cmd.Parameters.AddWithValue("@Segment", ddlSegment.SelectedValue);
                    cmd.Parameters.AddWithValue("@Sunroof", chkSunroof.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@Airbags", chkAirbags.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@ABS", chkABS.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@ChildSeat", chkChildSeat.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@ReverseCamera", chkReverseCamera.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@SpareWheel", chkSpareWheel.Checked ? 1 : 0);
                    cmd.Parameters.AddWithValue("@Price", price);

                   
                    string imagePath1 = SaveImage(fuImage1);
                    string imagePath2 = SaveImage(fuImage2);
                    string imagePath3 = SaveImage(fuImage3);

                    cmd.Parameters.AddWithValue("@ImagePath1", imagePath1 ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@ImagePath2", imagePath2 ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@ImagePath3", imagePath3 ?? (object)DBNull.Value);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("listing_confirmation.aspx");
                        
                    }
                    else
                    {
                        lblStatus.Text = "Failed to add vehicle listing. Please try again.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "An error occurred: " + ex.Message;
            lblStatus.ForeColor = System.Drawing.Color.Red;
        }
    }

    private string SaveImage(FileUpload fileUpload)
    {
        if (fileUpload.HasFile)
        {
            try
            {
                // Ensure the file is an image
                string extension = Path.GetExtension(fileUpload.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg"};
                if (allowedExtensions.Contains(extension))
                {
                    // Generate a unique filename to prevent overwriting
                    string filename = Guid.NewGuid().ToString() + extension;
                    string savePath = Server.MapPath("~/UploadedImages/" + filename);
                    fileUpload.SaveAs(savePath);
                    return "~/UploadedImages/" + filename;
                }
                else
                {
                    // Handle invalid file type
                    lblStatus.Text = "Invalid file type. Only JPG, JPEG, PNG, and GIF files are allowed.";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                // Handle any errors
                lblStatus.Text = "Error uploading file: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
        return null;
    }


    private int GetPriceBySegment(string segment)
    {
        switch (segment.ToLower())
        {
            case "hatchback":
                return 1200;
            case "sedan":
                return 1600;
            case "suv":
                return 2200;
            default:
                throw new ArgumentException("Invalid vehicle segment");
        }
    }
 

}
