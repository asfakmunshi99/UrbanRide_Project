<%@ Page Language="C#" AutoEventWireup="true" CodeFile="booking_confirmation.aspx.cs"
    Inherits="booking_confirmation" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

    <style>
        body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .confirmation-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 40px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .success-icon {
            font-size: 40px;
            color: #28a745;
            margin-bottom: 15px;
        }

        h2 {
            font-weight: 700;
            font-size: 28px;
            color: #333;
        }

        p {
            color: #555;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .booking-details {
            text-align: left;
            background-color: #f9fbfd;
            padding: 20px;
            border-left: 4px solid #007bff;
            border-radius: 10px;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.03);
        }

        .booking-details h4 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #007bff;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 6px 0;
            border-bottom: 1px dashed #ccc;
        }

        .detail-label {
            font-weight: 500;
            color: #444;
        }

        .btn {
            margin-top: 30px;
            padding: 10px 25px;
            border-radius: 30px;
            font-weight: 600;
            background: linear-gradient(90deg, #007bff, #00c6ff);
            border: none;
            color: white;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(90deg, #0056b3, #00aaff);
            box-shadow: 0 8px 16px rgba(0, 123, 255, 0.3);
            transform: translateY(-2px);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="confirmation-container">
            <div class="success-icon"><i class="fas fa-check-circle"></i>
            <h2>Booking Confirmed!</h2></div>
            <p>Your payment was successful and your booking is confirmed.</p>

            <div class="booking-details">
                <h4>Booking Details</h4>
                <div class="detail-row">
                    <span class="detail-label">Reference No:</span>
                    <span><asp:Literal ID="litReference" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Vehicle:</span>
                    <span><asp:Literal ID="litVehicle" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Pickup Date:</span>
                    <span><asp:Literal ID="litPickupDate" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Return Date:</span>
                    <span><asp:Literal ID="litReturnDate" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Booking Date:</span>
                    <span><asp:Literal ID="litBookingDate" runat="server" /></span>
                </div>
            </div>

            <asp:Button ID="btnBackToHome" runat="server" Text="View My Bookings"
                CssClass="btn" OnClick="btnBackToHome_Click" />
        </div>
    </form>
</body>
</html>
