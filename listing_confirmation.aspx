<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listing_confirmation.aspx.cs" Inherits="listing_confirmation" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

    <style>
        body {
            height:100vh;
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
        }

        .confirmation-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .success-icon {
            font-size: 40px;
            color: #4CAF50;
            font-weight: bold;
        }

        .booking-details {
            text-align: left;
            margin: 20px 0;
            padding: 15px;
            background-color: whitesmoke;
            border-radius: 5px;
            text-align:center;
        }

        .detail-label {
            font-weight: bold;
            
        }

        .btn {
            background-color: white;
            border-radius: 30px;
            color: black;
            border: 2px solid black;
            padding: 8px 20px; /* Add some padding for better appearance */
            cursor: pointer; /* Changes cursor to pointer on hover */
            transition: all 0.3s ease; /* Smooth transition for hover effects */
            box-shadow: none; /* Start with no shadow */
        }

            .btn:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow appears on hover */
                transform: translateY(-2px); /* Optional: slight lift effect */
                background-color: #f8f8f8; /* Optional: slight background color change */
            }


        h4 {
            margin-bottom: 10px;
        }

        h2 {
            font-weight: 400;
            font-family:'Berlin Sans FB';
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="confirmation-container">

            <h2><span class="success-icon">✓ </span>Your Request Accepted!</h2>
            <p>Your Vehicle Listed In Our Website Shortly After Verifying Your Detals</p>

            <div class="booking-details">
                <h6>Your Request Under Process Please Wait For Confirmation</h6>
            </div>

            <asp:Button ID="btnBackToHome" runat="server" Text="Ok"
                CssClass="btn" OnClick="btnBackToHome_Click" />

        </div>
    </form>
</body>
</html>
