<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" 
    CodeFile="car_details.aspx.cs" Inherits="car_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
            
        }
        .vehicle-details-container {
            display: flex;
            max-width: 1200px;
            margin: 90px  40px;
            padding: 20px;
            gap: 20px;
            width:92%;
        }
        .vehicle-main-content {
            flex: 0 0 70%;
        }
        .booking-sidebar {
            flex: 0 0 30%;
            position: sticky;
            top: 20px;
            height: fit-content;
            align-self: flex-start;
            background-color:whitesmoke;
        }
        .car-title {
            margin-bottom: 20px;
        }
        .car-title h2 {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .car-title .year-price {
            color: #666;
            font-size: 1.2rem;
        }
        .car-title .price {
            color: #28a745;
            font-weight: bold;
            
        }
        .specs-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 15px;
            margin: 30px 0;
        }
        .spec-item {
            background: #f8f9fa;
            padding: 15px;
            border-radius:5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .features-container {
            margin: 30px 0;
        }
        .feature-item {
            display: inline-block;
            margin-right: 15px;
            margin-bottom: 10px;
        }
        .feature-item i {
            color: #28a745;
            margin-right: 5px;
        }
        .booking-summary {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height:400px;
        }
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            
        }
        .summary-item.total-price {
            font-weight: bold;
            font-size: 1.1rem;
            border-top: 2px solid #ddd;
            padding-top: 10px;
            margin-top: 80px;
        }
        .carousel-inner img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 8px;
        }
        h3 {
                text-align:center;
                margin:10px;
                font-weight:bold;
            }
        @media (max-width: 768px) {
            .vehicle-details-container {
                flex-direction: column;
            }
            .vehicle-main-content,
            .booking-sidebar {
                flex: 0 0 100%;
            }
            .booking-sidebar {
                position: static;
                margin-top: 30px;

            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="vehicle-details-container">
        <div class="vehicle-main-content">
            <!-- Image Slider -->
            <div id="carImageSlider" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <asp:Image ID="imgMain" runat="server" CssClass="d-block w-100" />
                    </div>
                    <asp:Panel ID="pnlImage2" runat="server" Visible="false">
                        <div class="carousel-item">
                            <asp:Image ID="imgSlide2" runat="server" CssClass="d-block w-100" />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlImage3" runat="server" Visible="false">
                        <div class="carousel-item">
                            <asp:Image ID="imgSlide3" runat="server" CssClass="d-block w-100" />
                        </div>
                    </asp:Panel>
                </div>
                <a class="carousel-control-prev" href="#carImageSlider" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carImageSlider" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <!-- Vehicle Title and Basic Info -->
            <div class="car-title mt-3">
                <h2><asp:Literal ID="ltBrand" runat="server" /> - 
                    <asp:Literal ID="ltModel" runat="server" /></h2> 
                <h4><asp:Literal ID="ltYear" runat="server" /></h4>
                <div class="year-price">
                    <span class="price">₹ <asp:Literal ID="ltPrice" runat="server" /> Per-Day</span>
                </div>
            </div>

            <!-- Key Specifications -->
            <div class="specs-container">
                <div class="spec-item">
                    <strong>Transmission</strong>
                    <asp:Literal ID="ltTransmission" runat="server" />
                </div>
                <div class="spec-item">
                    <strong>Fuel Type</strong>
                    <asp:Literal ID="ltFuelType" runat="server" />
                </div>
                <div class="spec-item">
                    <strong>Seating Capacity</strong>
                    <asp:Literal ID="ltSeatingCapacity" runat="server" />
                </div>
            </div>

            <!-- Additional Features -->
            <h4>Features</h4>
            <div class="features-container">
                <asp:Panel ID="pnlSunroof" runat="server" CssClass="feature-item">
                    <i class="fas fa-check-circle"></i> Sunroof
                </asp:Panel>
                <asp:Panel ID="pnlAirbags" runat="server" CssClass="feature-item">
                    <i class="fas fa-check-circle"></i> Airbags
                </asp:Panel>
                <asp:Panel ID="pnlABS" runat="server" CssClass="feature-item">
                    <i class="fas fa-check-circle"></i> ABS
                </asp:Panel>
                <asp:Panel ID="pnlChildSeat" runat="server" CssClass="feature-item">
                    <i class="fas fa-check-circle"></i> Child Seat
                </asp:Panel>
                <asp:Panel ID="pnlReverseCamera" runat="server" CssClass="feature-item">
                    <i class="fas fa-check-circle"></i> Reverse Camera
                </asp:Panel>
                <asp:Panel ID="pnlSpareWheel" runat="server" CssClass="feature-item">
                    <i class="fas fa-check-circle"></i> Spare Wheel
                </asp:Panel>
            </div>
        </div>

        <!-- Booking Summary Sidebar -->
        <div class="booking-sidebar">
            <div class="booking-summary">
                <h3>Booking Summary</h3>
                
                <div class="summary-item">
                    <span>Pickup Date:</span>
                    <span><asp:Label ID="lblPickupDate" runat="server" /></span>
                </div>
                
                <div class="summary-item">
                    <span>Return Date:</span>
                    <span><asp:Label ID="lblReturnDate" runat="server" /></span>
                </div>
                
                <div class="summary-item">
                    <span>Daily Rate:</span>
                    <span>₹<asp:Label ID="lblDailyRate" runat="server" /></span>
                </div>
                
                <div class="summary-item">
                    <span>Rental Days:</span>
                    <span><asp:Label ID="lblRentalDays" runat="server" /></span>
                </div>
                
                <div class="summary-item total-price">
                    <span>Total Price:</span>
                    <span>₹<asp:Label ID="lblTotalPrice" runat="server" /></span>
                </div>
                <div>
                    <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm Booking" 
                        CssClass="btn btn-success mt-3 w-100" OnClick="btnConfirmBooking_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>