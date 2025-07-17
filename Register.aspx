<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Register - UrbanRide</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('images/map.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        span {
            color:red;
        }

        h3 {
            font-family: 'Berlin Sans FB';
        }

        .container {
            min-height: 100vh;
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

        .register-img {
            background: url('images/fd.jpg') center/cover no-repeat;
            border-radius: 10px 0 0 10px;
            min-height: 400px;
            position: relative;
        }

        .back-btn {
            position: absolute;
            top: 10px;
            left: 30px;
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

        .register-form {
            padding: 30px;
        }

        .form-group {
            position: relative;
        }

        .form-control {
            height: 45px;
            font-size: 16px;
        }

        /* Validation asterisk (*) styling */
        .error-star {
            color: red;
            font-size: 18px;
            position: absolute;
            top: 8px;
            right: 10px;
        }

        /* Fix for small screens */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                align-items: flex-start;
                overflow-y: auto;
            }

            .card {
                width: 90%;
                max-width: 400px;
            }

            .register-img {
                display: block;
                min-height: 250px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="row no-gutters">
                <!-- Left Image Section -->
                <div class="col-md-6 register-img">
                    <a href="Default.aspx" class="back-btn">&#8592;</a>
                </div>

                <!-- Right Form Section -->
                <div class="col-md-6">
                    <div class="register-form">
                        <h3 class="text-center"><span>R</span>egister</h3>
                        <form id="form1" runat="server">
                            <asp:Literal ID="litRegisterMessage" runat="server"></asp:Literal>

                            <div class="form-group">
                                <asp:TextBox ID="txtunm" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtunm"
                                    ErrorMessage="*" CssClass="error-star" Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtemail"
                                    ErrorMessage="*" CssClass="error-star" Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpass"
                                    ErrorMessage="*" CssClass="error-star" Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtcnfpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtcnfpass"
                                    ErrorMessage="*" CssClass="error-star" Display="Dynamic" />
                            </div>

                            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-danger btn-block" Text="Register" OnClick="btnRegister_Click" />
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <p class="text-center mt-3">
                                Already have an account? <a href="Login.aspx">Login</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
