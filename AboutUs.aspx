<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>About UrbanRide</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }
        
        .about-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 40px 20px;
            text-align: center;
            position: relative;
        }
        
        .back-arrow {
            position: absolute;
            top: 20px;
            left: 50px;
            font-size: 44px;
            color: #e74c3c;
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        .back-arrow:hover {
            transform: translateX(-5px);
        }
        
        .logo-circle {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 5px;
            display: block;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #2c3e50;
            font-size: 2.5rem;
            position: relative;
            display: inline-block;
        }
        
        .about-text {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.05);
            text-align: left;
            margin-top: 5px;
        }
        
        .highlight {
            color: #e74c3c;
            font-weight: 600;
        }
        
        .mission {
            font-style: italic;
            margin: 30px 0;
            padding: 20px;
            background-color: #f8f9fa;
            border-left: 4px solid #e74c3c;
        }
        
        @media (max-width: 768px) {
            .about-container {
                padding: 30px 15px;
            }
            
            .logo-circle {
                width: 120px;
                height: 120px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .back-arrow {
                top: 15px;
                left: 15px;
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="about-container">
            <!-- Back Arrow Button -->
            <div class="back-arrow" onclick="window.location.href='Default.aspx'">
                &#8592; <!-- Left arrow HTML entity -->
            </div>
            
            <!-- Replace "logo.png" with your actual logo path -->
            <img src="images/logo.png" alt="UrbanRide Logo" class="logo-circle" />
            
            <h1>AboutUs</h1>
            
            <div class="about-text">
                <p>Welcome to <span class="highlight">UrbanRide</span>, your premier car rental and sharing platform that's revolutionizing urban mobility. Founded in 2023, we've quickly become the go-to solution for convenient, affordable, and sustainable transportation in cities across India.</p>
                
                <p>At UrbanRide, we believe in <span class="highlight">simplicity</span> and <span class="highlight">accessibility</span>. Our platform connects car owners with trusted renters, creating a community where vehicles are utilized efficiently rather than sitting idle.</p>
                
                <div class="mission">
                    <p>"Our mission is to transform urban transportation by making car sharing effortless, affordable, and environmentally friendly. We're not just a rental service - we're building a movement towards smarter city living."</p>
                </div>
                
                <p>What sets us apart:</p>
                <ul>
                    <li><span class="highlight">Verified users</span> for safe and secure transactions</li>
                    <li><span class="highlight">Flexible rental options</span> from hourly to monthly</li>
                    <li><span class="highlight">Eco-friendly initiative</span> reducing cars on the road</li>
                </ul>
                
                <p>Whether you need a car for a quick errand, a weekend getaway, or want to earn money from your idle vehicle, UrbanRide provides the perfect platform. Join thousands of satisfied users who are experiencing the future of urban mobility today!</p>
            </div>
        </div>
    </form>
</body>
</html>