<%@ Page Title="Welcome to UrbanRide" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- jQuery References -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />

    

    <style>
        body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
        }

        .reviews-card {
            text-align: center;
        }

            .reviews-card img {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 20px;
            }

        .car-card {
            text-align: center;
            margin-bottom: 20px;
        }

            .car-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s;
            }

                .car-card img:hover {
                    transform: scale(1.05);
                }

        .brand-name span {
            color: red;
            font-size: 2.2rem;
        }

        .brand-name {
            padding-top: 20px;
        }

        .headline {
            font-weight: bold;
            font-family: 'High Tower Text';
        }

        h6 {
        }

        /* Booking Form */
        .booking-form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            background: rgba(255, 255, 255, 0.7);
            padding: 15px;
            border-radius: 40px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.8);
            max-width: 90%;
            flex-wrap: nowrap;
        }

            .booking-form label {
                font-weight: bold;
                font-size: 14px;
                margin-right: 8px;
                white-space: nowrap;
            }

            .booking-form input {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 30px;
                font-size: 14px;
                flex: 1;
                min-width: 150px;
            }

        .required-symbol {
            color: red;
            font-weight: bold;
            margin-left: 3px;
        }

        .booking-form button:hover {
            background-color: #00378A;
        }

        .booking-text {
            font-size: 30px;
            text-align: center;
            font-family: 'Berlin Sans FB';
            margin-top: 10%;
        }

        .review-text {
            text-align: center;
            font-family: 'Berlin Sans FB';
            margin-top: 30px;
            margin-bottom: 50px;
        }

        .booking-text span {
            color: red;
        }

        .car {
            margin-top: 180px;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .booking-container {
                padding: 30px 30px;
                margin-left: 10%;
            }

            .booking-text {
                margin-top: 20%;
            }

            .car {
                margin-top: 0px;
            }

            .booking-form {
                flex-wrap: wrap;
                flex-direction: column;
                position: static;
                transform: none;
                width: 100%;
            }

                .booking-form input,
                .booking-form label,
                .booking-form button {
                    width: 100%;
                    text-align: center;
                }

                .booking-form button {
                    margin-top: 10px;
                }
        }

        /* Autocomplete styling */
        .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            overflow-x: hidden;
            padding: 5px;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .ui-menu-item {
            padding: 8px 10px;
            border-bottom: 1px solid #eee;
        }

            .ui-menu-item:hover {
                background-color: #f5f5f5;
                cursor: pointer;
            }
        /* Feedback Section Styles */
        .feedback-form-container {
            background:none;
            padding: 30px 0;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }

        .feedback-form-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .feedback-input {
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 30px;
            margin: 5px 10px;
            flex-grow: 1;
            max-width: 100%;
            outline: none;
            transition: all 0.3s;
        }

            .feedback-input:focus {
                border-color: #007bff;
                box-shadow: 0 0 0 2px rgba(0,123,255,.1);
            }

        .btn {
            background-color: black;
            color: white;
            border: none;
            font-weight:bold;
            padding: 12px 25px;
            border-radius: 30px;
            margin: 5px 10px;
            cursor: pointer;
            transition: all 0.3s;
            white-space: nowrap;
        }

            .btn:hover {
                background-color: #0069d9;
                transform: translateY(-2px);
            }

        .feedback-status {
            text-align: center;
            margin-top: 15px;
            display: block;
            font-size: 14px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .feedback-form-inner .d-flex {
                flex-direction: column;
            }

            .feedback-input,
            .btn {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="booking-text">
        <p><span>B</span>ook Your Ride Today – <span>E</span>asy, Fast, And Reliable!</p>
        <h5>"Seamless Rentals, Effortless Listing – Join UrbanRide Now !"</h5>
    </div>

    <!-- Booking Section with Image Background -->
    <div class="booking-container">
        <div id="Form1" class="booking-form" runat="server">
            <asp:TextBox ID="txtPickup" runat="server" placeholder="📍Pick-up Location" CssClass="autocomplete-input"></asp:TextBox>
            <span class="required-symbol">*</span>

            <label for="txtTripStart">Trip Start:</label>
            <asp:TextBox ID="txtTripStart" runat="server" TextMode="Date" CssClass="input"></asp:TextBox>
            <span class="required-symbol">*</span>

            <label for="txtTripEnd">Trip End:</label>
            <asp:TextBox ID="txtTripEnd" runat="server" TextMode="Date" CssClass="input"></asp:TextBox>
            <span class="required-symbol">*</span>

            <asp:Button ID="btnBook" runat="server" Text="Find" CssClass="btn btn-dark" OnClick="btnFind_Click" />
        </div>
    </div>

    <!-- Featured Cars -->
    <div class="container car">
        <h2 class="booking-text"><span>T</span>op Picks for Your Next Ride</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="car-card">
                    <a href="car-details.aspx?car=lux-sedan">
                        <img src="images/sedan.jpg" alt="Luxury Sedan">
                    </a>
                    <br />
                    <h5 class="text-center brand-name"><span>L</span>uxury Sedan</h5>
                    <h6>Elegance Meets Performance – Glide in Luxury The Ultimate Sedan Experience!</h6>
                </div>
            </div>
            <div class="col-md-4">
                <div class="car-card">
                    <a href="car-details.aspx?car=suv">
                        <img src="images/tsuv.jpg" alt="SUV Comfort">
                    </a>
                    <br />
                    <h5 class="text-center brand-name"><span>S</span>UV Comfort</h5>
                    <h6>Power, Space, and Comfort – Drive Beyond Limits!</h6>
                </div>
            </div>
            <div class="col-md-4">
                <div class="car-card">
                    <a href="car-details.aspx?car=hatchback">
                        <img src="images/hback.jpg" alt="HatchBack">
                    </a>
                    <br />
                    <h5 class="text-center brand-name"><span>H</span>atchBack</h5>
                    <h6>Compact, Stylish, and Efficient – The Perfect City Companion!</h6>
                </div>
            </div>
        </div>
    </div>
    <hr />

    <!-- Customer Reviews -->
    <div class="container">
        <h2 class="review-text">What Our Customers Say</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="reviews-card">
                    <img src="images/c1.jpg" alt="Rahul S.">
                    <div class="reviews-content">
                        <h6>"Great experience! The booking process was smooth, and the car was in excellent condition."</h6>
                        <h5>Rahul</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="reviews-card">
                    <img src="images/c2.jpg" alt="Priya K.">
                    <div class="reviews-content">
                        <h6>"UrbanRide made my trip stress-free. Highly recommend their service. Seamless Experience!"</h6>
                        <h5>Priya</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="reviews-card">
                    <img src="images/c3.jpg" alt="Aman G.">
                    <div class="reviews-content">
                        <h6>"Affordable and convenient. Listing my car was a great way to earn extra income!"</h6>
                        <h5>Aman</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Feedback Section -->
    <div class="container-fluid mt-5 px-0">
        <div class="feedback-form-container">
            <div class="feedback-form-inner">
                <h3 class="text-center mb-4" style="font-family: 'Berlin Sans FB'; color: #333;">
                    <span style="color: red;">S</span>hare Your Thoughts
                </h3>

                <div class="d-flex flex-wrap justify-content-center align-items-center">
                    <asp:TextBox ID="txtFeedbackName" runat="server"
                        CssClass="feedback-input"
                        placeholder="Your Name"
                        Style="min-width: 200px;"></asp:TextBox>

                    <asp:TextBox ID="txtFeedbackEmail" runat="server"
                        TextMode="Email"
                        CssClass="feedback-input"
                        placeholder="Your Email"
                        Style="min-width: 250px;"></asp:TextBox>

                    <asp:TextBox ID="txtFeedbackMessage" runat="server"
                        CssClass="feedback-input"
                        placeholder="Your Feedback"
                        Style="min-width: 300px;"></asp:TextBox>

                    <asp:Button ID="btnSubmitFeedback" runat="server"
                        Text="Submit"
                        CssClass="btn btn-secondary"
                        OnClick="btnSubmitFeedback_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Date Picker Script -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var today = new Date().toISOString().split('T')[0];
            var tripStartInput = document.getElementById('<%= txtTripStart.ClientID %>');
            var tripEndInput = document.getElementById('<%= txtTripEnd.ClientID %>');

            // Set the minimum selectable date for trip start to today
            tripStartInput.setAttribute('min', today);

            // Update the minimum selectable date for trip end based on trip start date
            tripStartInput.addEventListener('change', function () {
                tripEndInput.value = ''; // Clear the current trip end date
                tripEndInput.setAttribute('min', this.value);
            });

            // Optional: Prevent selecting a trip end date before today if trip start date is not set
            tripEndInput.setAttribute('min', today);
        });
    </script>

    <script type="text/javascript">
        // SAFEST initialization method
        function loadjQueryUI(callback) {
            if (typeof jQuery.ui === 'undefined') {
                var script = document.createElement('script');
                script.src = 'https://code.jquery.com/ui/1.13.2/jquery-ui.min.js';
                script.onload = callback;
                document.head.appendChild(script);
            } else {
                callback();
            }
        }

        $(window).on('load', function () {
            loadjQueryUI(function () {
                $('.autocomplete-input').autocomplete({
                    source: ["Ahmedabad",
     "Bengaluru",
     "Chennai",
     "Delhi",
     "Hyderabad",
     "Kolkata",
     "Mumbai",
     "Pune",
     "Surat",
     "Jaipur",
     "Junagadh",
     "Rajkot",
     "Vadodra",
     "Veraval",
     "Porbandar",
     "Sasan_Gir"]
                });
            });
        });
    </script>

</asp:Content>
