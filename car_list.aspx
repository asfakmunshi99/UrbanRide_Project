<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="car_list.aspx.cs" Inherits="car_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --dark: #1b263b;
            --light: #f8f9fa;
            --success: #4cc9f0;
            --warning: #f72585;
        }
        
        body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
        }
        
        .page-header {
            color:black;
            padding: 3  rem 0;
            margin-bottom: 2rem;
            border-radius: 10px;

            max-width:1150px;
            margin:20px auto 60px;
            margin-top:120px;            
        }
        
        .page-title {
            font-size: 2.2rem;
            font-weight: 400;
            font-family:'Berlin Sans FB';
            margin-top:50px;
        }
        .head {
            color:red;
        }
        h3 {
            font-family:'Berlin Sans FB';
        }
        
        .page-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            font-weight: 300;
        }
        
        .car-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            padding: 10px 0;
            max-width:1140px;
            margin:30px auto 60px;
        }
        
        .car-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            position: relative;
        }
        
        .car-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.12);
        }
        
        .car-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: var(--warning);
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            z-index: 2;
        }
        
        .car-image-container {
            height: 200px;
            overflow: hidden;
            position: relative;
        }
        
        .car-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .car-card:hover .car-image {
            transform: scale(1.05);
        }
        
        .car-details {
            padding: 1.5rem;
            position: relative;
        }
        
        .car-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: var(--dark);
        }
        
        .car-subtitle {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        .car-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 1.25rem;
        }
        
        .car-price span {
            font-size: 0.9rem;
            color: #6c757d;
            font-weight: 400;
        }
        
        .car-specs {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 1.5rem;
        }
        
        .spec-item {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            padding: 6px 10px;
            border-radius: 8px;
            font-size: 0.85rem;
        }
        
        .spec-icon {
            width: 16px;
            margin-right: 6px;
            opacity: 0.7;
        }
        
        .view-btn {
            display: block;
            width: 100%;
            padding: 10px;
            text-align: center;
            background: var(--primary);
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }
        
        .view-btn:hover {
            background: var(--secondary);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(67, 97, 238, 0.3);
        }
        
        .no-results {
            grid-column: 1 / -1;
            text-align: center;
            padding: 3rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }
        
        .no-results-icon {
            font-size: 3rem;
            color: #dee2e6;
            margin-bottom: 1rem;
        }
        
        @media (max-width: 768px) {
            .car-grid {
                grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            }
            
            .page-title {
                font-size: 1.8rem;
            }
        }
        
        /* Loading animation */
        .loading-shimmer {
            animation: shimmer 2s infinite linear;
            background: linear-gradient(to right, #f6f7f8 0%, #e9ebee 20%, #f6f7f8 40%, #f6f7f8 100%);
            background-size: 1000px 100%;
        }
        
        @keyframes shimmer {
            0% { background-position: -500px 0; }
            100% { background-position: 500px 0; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-header">
        <div class="container">
            <h1 class="page-title"><span class="head">A</span>vailable Vehicles in <asp:Label ID="lblCity" runat="server" /></h1>
            <p class="page-subtitle">Browse our premium selection of vehicles</p>
        </div>
    </div>
    
     
         
        
        <div class="car-grid">
            <asp:Repeater ID="rptCars" runat="server">
                <ItemTemplate>
                    <div class="car-card">
                        <%# (bool)Eval("IsAvailable") ? "" : "<span class='car-badge'>Booked</span>" %>
                        <div class="car-image-container">
                            <asp:Image ID="imgCar" runat="server" 
                                ImageUrl='<%# Eval("ImagePath1") %>' 
                                AlternateText='<%# Eval("Brand") + " " + Eval("Model") %>'
                                CssClass="car-image" />
                        </div>
                        <div class="car-details">
                            <h3 class="car-title"><%# Eval("Brand") %> <%# Eval("Model") %></h3>
                            <p class="car-subtitle"><%# Eval("Year") %> • <%# Eval("Segment") %></p>
                            
                            <div class="car-price">₹<%# Eval("Price", "{0:n0}") %> <span>/ day</span></div>
                            
                            <div class="car-specs">
                                <div class="spec-item">
                                    <img src="/images/transmission-icon.svg" class="spec-icon" />
                                    <%# Eval("TransmissionType") %>
                                </div>
                                <div class="spec-item">
                                    <img src="/images/fuel-icon.svg" class="spec-icon" />
                                    <%# Eval("FuelType") %>
                                </div>
                                <div class="spec-item">
                                    <img src="/images/capacity-icon.svg" class="spec-icon" />
                                    <%# Eval("SeatingCapacity") %> seats
                                </div>
                            </div>
                            
                            <asp:HyperLink ID="lnkDetails" runat="server" CssClass="view-btn" Text="View Details"
                                NavigateUrl='<%# "car_details.aspx?VehicleID=" + Eval("VehicleID") + 
                                "&pickup=" + Server.UrlEncode(Request.QueryString["pickup"]) + 
                                "&return=" + Server.UrlEncode(Request.QueryString["return"]) %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <asp:PlaceHolder ID="phNoResults" runat="server" Visible="false">
                <div class="no-results">
                    <div class="no-results-icon">
                        <i class="fas fa-car"></i>
                    </div>
                    <h3><span class="head">N</span>o vehicles found</h3>
                    <p>We couldn't find any vehicles matching your criteria.</p>
                    <a href="car_list.aspx" class="btn btn-primary mt-3">Reset Filters</a>
                </div>
            </asp:PlaceHolder>
        </div>
    </div>
    
    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</asp:Content>