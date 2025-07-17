<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login - UrbanRide</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-image: url('images/map.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            position: relative;
            width: 550px; 
            max-width: 90%;
        }

        .login-img {
            background: url('images/fd.jpg') center/cover no-repeat;
            border-radius: 10px 0 0 10px;
            position: relative;
            min-height: 400px;
        }
        
        .back-btn {
            position: absolute;
            top:0px;
            left: 25px;
            font-size: 40px;
            color: black;
            cursor: pointer;
            text-decoration: none;
            z-index: 10;
        }

        .back-btn:hover {
            color: red;
            text-decoration:none;
        }

        .login-form {
            padding: 30px;
        }

        .form-group {
            position: relative;
        }

        .form-control {
            height: 45px;
            font-size: 16px;
        }

        span {
            color: red;
        }

        h3 {
            font-family: 'Berlin Sans FB';
        }

        /* Validation asterisk (*) styling */
        .error-star {
            color: red;
            font-size: 18px;
            position: absolute;
            top: 8px;
            right: 10px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .card {
                width: 90%;
                max-width: 400px;
            }

            .login-img {
                display: block;
                min-height: 250px;
            }
            .back-btn {
                color:white;
            }
            .back-btn:hover {
                color:white;
                text-decoration:underline;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="row no-gutters">
                <!-- Left Image Section -->
                <div class="col-md-6 login-img">
                    <a href="Default.aspx" class="back-btn">&#8592</a>
                </div>

                <!-- Right Form Section -->
                <div class="col-md-6">
                    <div class="login-form">
                        <h3 class="text-center"><span>L</span>ogin</h3>
                        <form id="form1" runat="server">
                            <asp:Literal ID="litLoginMessage" runat="server"></asp:Literal>

                            <div class="form-group">
                                <asp:TextBox ID="txtunm" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtunm"
                                    ErrorMessage="*" CssClass="error-star" Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass"
                                    ErrorMessage="*" CssClass="error-star" Display="Dynamic" />
                            </div>
                            

                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-danger btn-block" Text="Login" onClick="btnLogin_Click"/>
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <p class="text-center mt-3">
                                <a href="ForgetPassword.aspx">Forget Password</a>
                            </p>
                            <p class="text-center mt-3">
                                Don't have an account? <a href="Register.aspx">Register</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
