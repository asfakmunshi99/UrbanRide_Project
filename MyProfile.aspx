<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            height: 100vh;
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
        }

        .profile-wrapper {
            display: flex;
            max-width: 1145px;
            margin: 80px auto;
            gap: 20px;
        }

        /* Right-aligned Menu Styles */
        .profile-menu-container {
            width: 250px;
            position: sticky;
            top: 100px;
            align-self: flex-start;
            margin-top: 40px;
        }

        .profile-menu {
            display: flex;
            flex-direction: column;
            gap: 15px;
            background: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .user-profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 15px;
            display: block;
            border: 3px solid #f0f0f0;
        }

        .menu-item {
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            background: #f5f5f5;
            transition: all 0.2s;
            color: black;
            text-decoration: none;
            text-align: center;
        }

            .menu-item:hover {
                text-decoration: none;
                color: black;
                border: 1px solid black;
            }


        /* Main Content Area */
        .profile-content-container {
            margin-top: 40px;
            flex: 1;
        }

        .profile-content {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        /* Personal Details UI */
        .personal-details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }

        .detail-card {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .detail-label {
            font-weight: bold;
            color: #555;
            display: inline-block;
            width: 120px;
        }

        /* Bookings UI */
        .booking-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .booking-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .booking-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 15px;
        }

        .status {
            padding: 10px 10px;
            border-radius: 10px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-confirmed {
            background: #e8f5e9;
            color: #388e3c;
        }

        .status-pending {
            background: #fff3e0;
            color: #ffa000;
        }

        .status-cancelled {
            background: #ffebee;
            color: #d32f2f;
        }

        /* Hosting UI */
        .hosting-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .hosting-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .hosting-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 15px;
        }

        .price {
            font-weight: bold;
            color: #388e3c;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }

        .logout-btn {
            margin-top: 20px;
            padding: 8px 20px;
            background: #d32f2f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.2s;
        }

            .logout-btn:hover {
                background: #b71c1c;
            }

        .btn-outline-danger {
            color: #dc3545;
            border-color: #dc3545;
            transition: all 0.3s;
        }

            .btn-outline-danger:hover {
                background-color: #dc3545;
                color: white;
            }

        .btn-sm {
            padding: 5px 10px;
            font-size: 12px;
        }

        .text-right {
            text-align: right;
        }

        .mt-3 {
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-wrapper">
        <!-- Right-aligned Menu -->
        <div class="profile-menu-container">
            <div class="profile-menu">


                <!-- Menu Items -->
                <asp:LinkButton ID="btnPersonalMenu" runat="server" CssClass="menu-item active" OnClick="btnPersonal_Click">Personal Details</asp:LinkButton>
                <asp:LinkButton ID="btnBookingsMenu" runat="server" CssClass="menu-item" OnClick="btnBookings_Click">My Bookings</asp:LinkButton>
                <asp:LinkButton ID="btnHostingMenu" runat="server" CssClass="menu-item" OnClick="btnHosting_Click">My Listing Vehicles</asp:LinkButton>
                <asp:LinkButton ID="btnLogoutMenu" runat="server" CssClass="menu-item" OnClick="btnLogout_Click">Logout</asp:LinkButton>
            </div>
        </div>

        <!-- Main Content Area -->
        <div class="profile-content-container">
            <asp:MultiView ID="mvProfile" runat="server" ActiveViewIndex="0">
                <!-- Personal Details View -->
                <asp:View ID="vwPersonal" runat="server">
                    <div class="profile-content">
                        <h3><span>P</span>ersonal Details</h3>
                        <div class="personal-details-grid">
                            <div class="detail-card">
                                <div class="detail-row">
                                    <span class="detail-label">User Name:</span>
                                    <asp:Label ID="lblUserName" runat="server" />
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Email:</span>
                                    <asp:Label ID="lblEmail" runat="server" />
                                </div>
                            </div>

                        </div>
                    </div>
                </asp:View>

                <!-- My Bookings View -->
                <asp:View ID="vwBookings" runat="server">
                    <div class="profile-content">
                        <h3><span>M</span>y Bookings</h3>
                        <asp:Repeater ID="rptBookings" runat="server" OnItemCommand="rptBookings_ItemCommand">
                            <ItemTemplate>
                                <div class="booking-card">
                                    <div class="booking-header">
                                        <h5>Booking ID #<%# Eval("ReferenceNumber") %></h5>
                                        <span class='status status-<%# Eval("Status").ToString().ToLower() %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </div>

                                    <div class="booking-details">
                                        <div>
                                            <span class="detail-label">Vehicle:</span>
                                            <span><%# Eval("Vehicle") %></span>
                                        </div>
                                        <div>
                                            <span class="detail-label">Pickup Date:</span>
                                            <span><%# Convert.ToDateTime(Eval("PickupDate")).ToString("dd/MM/yyyy") %></span>
                                        </div>
                                        <div>
                                            <span class="detail-label">Return Date:</span>
                                            <span><%# Convert.ToDateTime(Eval("ReturnDate")).ToString("dd/MM/yyyy") %></span>
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <asp:Button ID="btnCancelBooking" runat="server"
                                            CommandName="CancelBooking"
                                            CommandArgument='<%# Eval("BookingID") %>'
                                            CssClass="btn btn-outline-danger btn-sm"
                                            Text="Cancel Booking"
                                            Visible='<%# Eval("Status").ToString() == "Confirmed" %>'
                                            OnClientClick="return confirm('Are you sure you want to cancel this booking? Your refund will be transferred back to your original payment method within 24 hours. ');" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="lblNoBookings" runat="server" CssClass="no-data" Text="You don't have any bookings yet." Visible="false" />
                    </div>
                </asp:View>

                <!-- My Hosting View -->
                <asp:View ID="vwHosting" runat="server">
                    <div class="profile-content">
                        <h3><span>M</span>y Listing</h3>
                        <asp:Repeater ID="rptHosting" runat="server">
                            <ItemTemplate>
                                <div class="hosting-card">
                                    <div class="hosting-header">
                                        <h5><%# Eval("Brand") %> <%# Eval("Model") %></h5>
                                        <span class="price">
                                            <p>Rent / Day</p>
                                            ₹<%# Eval("Price", "{0:N2}") %></span>
                                    </div>

                                    <div class="hosting-details">
                                        <div>
                                            <span class="detail-label">Reg. Number:</span>
                                            <span><%# Eval("RcNumber") %></span>
                                        </div>
                                    </div>
                                    <div class="hosting-details">
                                        <div>
                                            <span class="detail-label">Location:</span>
                                            <span><%# Eval("City") %></span>
                                        </div>
                                    </div>
                                    <div class="hosting-details">
                                        <div>
                                            <span class="detail-label">Approval:</span>
                                            <span><%# Eval("Approval") %></span>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="lblNoHosting" runat="server" CssClass="no-data" Text="You haven't listed any vehicles yet." Visible="false" />
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
