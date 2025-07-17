<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listing.aspx.cs" Inherits="listing" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

    <style>
        body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
        }

        .container {
            max-width: 900px;
            margin: 90px auto 100px auto;
            padding: 20px;
            background: none;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .headline {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .image-grid {
            display: flex;
            justify-content: space-between;
            padding: 10px;
        }

        .image-item {
            text-align: center;
        }

            .image-item img {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                object-fit: cover;
                box-shadow: 0 0 35px skyblue;
            }

        .image-item1 img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
        }

        .next-button {
            display: block;
            width: 100%;
            background: red;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 25px;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            cursor: pointer;
        }

        .exit-button {
            position: absolute;
            top: 0px;
            right: 25px;
            font-size: 40px;
            color: red;
            cursor: pointer;
        }

        form-container {
            width: 50%;
            max-width: 500px;
            background: none;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        h3 {
            font-family: 'Berlin Sans FB';
            margin-top: 40px;
            text-align: center;
        }

        .info-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-top: 30px;
        }


        span {
            color: red;
        }


        .form-container h3 {
            color: black;
            text-align: center;
        }

     
        .form-content {
            min-height: 250px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-control {
            background: none;
            border-radius: 10px;
            border-spacing: 35px;
            appearance: none;
            margin: 10px;
        }

       
        .button-container {
            display: flex;
            margin-top: 10px;
            justify-content: center;
        }

        .btn {
            width: 175px;
            margin: 4px;
            border-radius: 30px;
        }

   
        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }

            .checkbox-group .checkbox-label {
                display: flex;
                align-items: center;
                width: 30%;
            }

        .image-upload {
            width: 100px;
            height: 100px;
            border: 2px dashed black;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            cursor: pointer;
            margin: 10px;
        }

            .image-upload img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: none;
            }

        .checkbox-label {
            display: flex;
            align-items: center;
            font-size: 16px;
            font-weight: 500;
            color: #333;
            cursor: pointer;
            gap: 10px;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }

        .head-p {
            font-weight: bold;
            margin-top: 10px;
        }

        .container-a {
            text-align: center;
        }

        .input-container {
            position: relative;
            display: inline-block;
        }

        .validator-asterisk {
            position: absolute;
            top: 10px;
            right: 0px;
            color: red;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="exit-button" onclick="window.location.href='default.aspx'">&#x292C;</div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <!-- View 1: Introduction -->
                <asp:View ID="View1" runat="server">
                    <div class="headline">
                        <h3><span>L</span>ist Your Car & Earn with UrbanRide</h3>
                    </div>
                    <p class="text-center">Follow the steps below to list your car.</p>
                    <div class="image-grid">
                        <div class="image-item">
                            <img src="images/step1.jpg" alt="Personal Info">
                            <p class="head-p">Personal Details</p>
                        </div>
                        <div class="image-item">
                            <img src="images/step2.jpg" alt="Vehicle Info">
                            <p class="head-p">Vehicle Details</p>
                        </div>
                        <div class="image-item">
                            <img src="images/step3.jpg" alt="Technical Info">
                            <p class="head-p">Technical Details</p>
                        </div>
                        <div class="image-item">
                            <img src="images/step4.jpg" alt="Additional Features">
                            <p class="head-p">Additional Details</p>
                        </div>
                        <div class="image-item">
                            <img src="images/step5.jpg" alt="Upload Images">
                            <p class="head-p">Upload Images</p>
                        </div>
                    </div>
                    <hr />
                    <h3><span>H</span>ow It Works?</h3>
                    <p>Renting out your car with UrbanRide is simple, secure, and rewarding. Whether you have a spare vehicle or want to maximize your car’s value when not in use, our platform allows you to list your car and start earning effortlessly.</p>


                    <h3>Vehicle Categories and Pricing</h3>
                    <div class="container-a">
                        <p>Our rental rates vary based on the vehicle category:</p>
                        <strong>( Hatchbacks:</strong> ₹1200 per day )
                        <strong>( Sedans:</strong> ₹1600 per day )
                        <strong>( SUVs:</strong> ₹2200 per day )
                    </div>

                    <!-- Terms and Conditions Checkbox -->
                    <div class="container-a mt-2">
                        <asp:CheckBox ID="chkTerms" runat="server" />
                        <label for="<%= chkTerms.ClientID %>">
                            I agree to the <a href="terms_and_condition.aspx" target="_blank">Terms and Conditions</a>
                        </label>

                    </div>


                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="btnNext1" runat="server" CssClass="btn btn-danger" Text="List Your Car" OnClientClick="return validateUserSessionAndTerms();" OnClick="btnNext1_Click" />
                    </div>


                </asp:View>

                <!-- View 2 Personal info -->
                <asp:View ID="View2" runat="server">
                    <div class="form-content">
                        <div class="info-container">
                            <img src="images/step1.jpg" alt="Personal Info" class="info-image">
                            <h3><span>P</span>ersonal Details</h3>
                        </div>
                        <div class="input-container">
                            <asp:TextBox ID="txtOwnerName" runat="server" CssClass="form-control mb-3" Placeholder="Name As Per RC"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvOwnerName" runat="server" ControlToValidate="txtOwnerName" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control mb-3" Placeholder="Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control mb-3" Placeholder="Mobile Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control mb-3" Placeholder="Enter City"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="button-container">
                        <span></span>
                        <!-- Empty span for alignment -->
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-secondary" Text="Previous" OnClick="btnPrev1_Click" />
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Next" OnClick="btnNext2_Click" />
                    </div>
                </asp:View>

                <!-- View 2: Vehicle Basic Details -->
                <asp:View ID="View3" runat="server">
                    <div class="form-content">
                        <div class="info-container">
                            <img src="images/step2.jpg" alt="Personal Info" class="info-image">
                            <h3><span>V</span>ehicle Details</h3>
                        </div>
                        <div class="input-container">
                            <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control mb-3" Placeholder="Car Company"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBrand" runat="server" ControlToValidate="txtBrand" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:TextBox ID="txtModel" runat="server" CssClass="form-control mb-3" Placeholder="Model"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvModel" runat="server" ControlToValidate="txtModel" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:TextBox ID="txtYear" runat="server" CssClass="form-control mb-3" Placeholder="Model Year"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtYear" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:TextBox ID="txtRcNumber" runat="server" CssClass="form-control mb-3" Placeholder="Registration Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRcNumber" runat="server" ControlToValidate="txtRcNumber" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="button-container">
                        <asp:Button ID="btnPrev1" runat="server" CssClass="btn btn-secondary" Text="Previous" OnClick="btnPrev1_Click" />
                        <asp:Button ID="btnNext2" runat="server" CssClass="btn btn-danger" Text="Next" OnClick="btnNext3_Click" />
                    </div>
                </asp:View>

                <!-- View 3: Fuel Type, Transmission, Seating Capacity, City -->
                <asp:View ID="View4" runat="server">
                    <div class="form-content">
                        <div class="info-container">
                            <img src="images/step3.jpg" alt="Personal Info" class="info-image">
                            <h3><span>T</span>echnical Details</h3>
                        </div>
                        <div class="input-container">
                            <asp:DropDownList ID="ddlFuelType" runat="server" CssClass="form-control mb-3">
                                <asp:ListItem Text="Select Fuel Type" Value="" />
                                <asp:ListItem Text="Petrol" Value="Petrol" />
                                <asp:ListItem Text="Diesel" Value="Diesel" />
                                <asp:ListItem Text="CNG" Value="CNG" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvFuelType" runat="server" ControlToValidate="ddlFuelType" InitialValue="" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:DropDownList ID="ddlTransmission" runat="server" CssClass="form-control mb-3">
                                <asp:ListItem Text="Select Transmission" Value="" />
                                <asp:ListItem Text="Manual" Value="Manual" />
                                <asp:ListItem Text="Automatic" Value="Automatic" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvTransmission" runat="server" ControlToValidate="ddlTransmission" InitialValue="" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:DropDownList ID="ddlSeatingCapacity" runat="server" CssClass="form-control mb-3">
                                <asp:ListItem Text="Select Seating Capacity" Value="" />
                                <asp:ListItem Text="5" Value="5" />
                                <asp:ListItem Text="7" Value="7" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSeatingCapacity" runat="server" ControlToValidate="ddlSeatingCapacity" InitialValue="" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                        <div class="input-container">
                            <asp:DropDownList ID="ddlSegment" runat="server" CssClass="form-control mb-3">
                                <asp:ListItem Text="Select Segment" Value="" />
                                <asp:ListItem Text="Suv" Value="suv" />
                                <asp:ListItem Text="Sedan" Value="sedan" />
                                <asp:ListItem Text="HatchBack" Value="hatchback" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSegment" runat="server" ControlToValidate="ddlSegment" InitialValue="" Text="*" CssClass="validator-asterisk" Display="Dynamic" />
                        </div>

                    </div>
                    <div class="button-container">
                        <asp:Button ID="btnPrev2" runat="server" CssClass="btn btn-secondary" Text="Previous" OnClick="btnPrev2_Click" />
                        <asp:Button ID="btnNext3" runat="server" CssClass="btn btn-danger" Text="Next" OnClick="btnNext4_Click" />
                    </div>

                </asp:View>

                <!-- View 4: Additional Features -->
                <asp:View ID="View5" runat="server">
                    <div class="form-content">
                        <div class="info-container">
                            <img src="images/step4.jpg" alt="Personal Info" class="info-image">
                            <h3><span>A</span>dditional Features</h3>
                        </div>
                        <br />
                        <div class="checkbox-group">
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkSpareWheel" runat="server" />
                                Spare Tyre
                            </label>
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkChildSeat" runat="server" />
                                Child Seat
                            </label>
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkReverseCamera" runat="server" />
                                Reverse Camera
                            </label>
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkSunroof" runat="server" />
                                Sunroof
                            </label>
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkAirbags" runat="server" />
                                Airbag
                            </label>
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkABS" runat="server" />
                                ABS
                            </label>
                        </div>
                    </div>
                    <div class="button-container">
                        <asp:Button ID="btnPrev3" runat="server" CssClass="btn btn-secondary" Text="Previous" OnClick="btnPrev3_Click" />
                        <asp:Button ID="btnNext4" runat="server" CssClass="btn btn-danger" Text="Next" OnClick="btnNext5_Click" />
                    </div>
                </asp:View>

                <!-- View 5: Upload Images -->
                <asp:View ID="View6" runat="server">
                    <div class="form-content">
                        <div class="info-container">
                            <img src="images/step5.jpg" alt="Personal Info" class="info-image">
                            <h3><span>U</span>pload Car Images</h3>
                        </div>
                        <br />
                        <div class="d-flex justify-content-center">
                            <label class="image-upload" aria-required="True" aria-selected="true">
                                <span>+</span>
                                <asp:FileUpload ID="fuImage1" runat="server" CssClass="d-none" onchange="previewImage(this, 'imgPreview1')" />
                                <img id="imgPreview1" />
                            </label>
                            <label class="image-upload">
                                <span>+</span>
                                <asp:FileUpload ID="fuImage2" runat="server" CssClass="d-none" onchange="previewImage(this, 'imgPreview2')" />
                                <img id="imgPreview2" />
                            </label>
                            <label class="image-upload">
                                <span>+</span>
                                <asp:FileUpload ID="fuImage3" runat="server" CssClass="d-none" onchange="previewImage(this, 'imgPreview3')" />
                                <img id="imgPreview3" />
                            </label>
                            <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>

                        </div>
                    </div>
                    <div class="button-container">
                        <asp:Button ID="btnPrev4" runat="server" CssClass="btn btn-secondary" Text="Previous" OnClick="btnPrev4_Click" />
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-danger" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </asp:View>

            </asp:MultiView>
        </div>
        </div>



    <script type="text/javascript">
        var isUserAuthenticated = '<%= Session["UserId"] != null ? "true" : "false" %>';
    </script>

        <script>
            function previewImage(input, imgId) {
                if (input.files && input.files[0]) {
                    let reader = new FileReader();
                    reader.onload = function(e) {
                        document.getElementById(imgId).src = e.target.result;
                        document.getElementById(imgId).style.display = 'block';
                        input.previousElementSibling.style.display = 'none';
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
        <script type="text/javascript">
            function validateUserSessionAndTerms() {
                // Check if the user is authenticated
                if (isUserAuthenticated === 'false') {
                    alert('Please log in first to list your vehicle.');
                    window.location.href = 'login.aspx';
                    return false;
                }

                // Validate terms and conditions checkbox
                var chkBox = document.getElementById('<%= chkTerms.ClientID %>');
            if (!chkBox.checked) {
                alert('You must agree to the Terms and Conditions before proceeding.');
                return false;
            }

            return true;
        }
        </script>


    </form>
</body>
</html>

    
