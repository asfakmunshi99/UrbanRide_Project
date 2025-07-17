<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyBookings.aspx.cs" Inherits="MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
        }
        .bookings-container {
            max-width: 1000px;
            margin: 30px auto;
            margin-top:80px;
            padding: 20px;
        }
        .booking-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        .booking-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .booking-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .booking-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .detail-item {
            margin-bottom: 8px;
        }
        .detail-label {
            font-weight: bold;
            color: #555;
        }
        .status-confirmed {
            color: #28a745;
            font-weight: bold;
        }
        .status-pending {
            color: #ffc107;
            font-weight: bold;
        }
        .status-cancelled {
            color: #dc3545;
            font-weight: bold;
        }
        .no-bookings {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 18px;
        }
        .head {
            color:red;
        }
        h2 {
            font-family:'Berlin Sans FB';
            font-weight:400;
        }
        .btn {
            border-radius:30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bookings-container">
        <h2><span class="head">M</span>y Bookings</h2>
        
        <asp:Repeater ID="rptBookings" runat="server">
            <ItemTemplate>
                <div class="booking-card">
                    <div class="booking-header">
                        <h5>Reference Id #<%# Eval("ReferenceNumber") %></h5>
                        <span class='status-<%# Eval("Status").ToString().ToLower() %>'>
                            <%# Eval("Status") %>
                        </span>
                    </div>
                    
                    <div class="booking-details">
                        <div class="detail-item">
                            <span class="detail-label">Vehicle:</span>
                            <span><%# Eval("Brand") %> <%# Eval("Model") %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Pickup Date:</span>
                            <span><%# Convert.ToDateTime(Eval("PickupDate")).ToString("dd MMM yyyy") %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Return Date:</span>
                            <span><%# Convert.ToDateTime(Eval("ReturnDate")).ToString("dd MMM yyyy") %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Booking Date:</span>
                            <span><%# Convert.ToDateTime(Eval("BookingDate")).ToString("dd MMM yyyy") %></span>
                        </div>
                         <div class="detail-item">
                            <span class="detail-label">Location:</span>
                            <span><%# Eval("City") %></span>
                        </div>
                         <div class="detail-item">
                            <span class="detail-label">Reg Number</span>
                            <span><%# Eval("RcNumber") %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Rent/Day:</span>
                            <span>₹<%# Convert.ToDecimal(Eval("Price")).ToString("N2") %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Total Amount:</span>
                            <span>₹<%# Convert.ToDecimal(Eval("TotalAmount")).ToString("N2") %></span>
                        </div>
                        <%--<div class="detail-item">
                             <asp:Button ID="btnCancel" runat="server" Text="Cancel-Booking"
                CssClass="btn btn-danger" OnClick="btnCancel_Click" />
                        </div>--%>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        
        <asp:Panel ID="pnlNoBookings" runat="server" CssClass="no-bookings" Visible="false">
            <p>You don't have any bookings yet.</p>
            <asp:HyperLink ID="hlBrowseVehicles" runat="server" NavigateUrl="~/default.aspx" CssClass="btn btn-secondary">
                Browse Vehicles
            </asp:HyperLink>
        </asp:Panel>
    </div>
</asp:Content>