<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Forgot Password - UrbanRide</title>
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
            top: 0px;
            left: 25px;
            font-size: 40px;
            color: black;
            cursor: pointer;
            text-decoration: none;
            z-index: 10;
        }

        .back-btn:hover {
            color: red;
            text-decoration: none;
        }

        .login-form {
            padding: 30px;
        }

        .form-group {
            position: relative;
            margin-bottom: 20px;
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

        .error-star {
            color: red;
            font-size: 18px;
            position: absolute;
            top: 8px;
            right: 10px;
        }

        .success-message {
            color: #28a745;
            font-weight: bold;
            text-align: center;
            margin: 15px 0;
        }

        .error-message {
            color: #dc3545;
            font-weight: bold;
            text-align: center;
            margin: 15px 0;
        }

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
                color: white;
            }
            .back-btn:hover {
                color: white;
                text-decoration: underline;
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
                    <a href="Default.aspx" class="back-btn">&#8592;</a>
                </div>

                <!-- Right Form Section -->
                <div class="col-md-6">
                    <div class="login-form">
                        <h3 class="text-center"><span>R</span>eset Password</h3>
                        <form id="form1" runat="server">
                            <asp:MultiView ID="mvForgetPassword" runat="server" ActiveViewIndex="0">
                                <!-- View 1: Email Verification -->
                                <asp:View ID="vwEmail" runat="server">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                            placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                            ControlToValidate="txtEmail" ErrorMessage="*" 
                                            CssClass="error-star" Display="Dynamic" />
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                            ControlToValidate="txtEmail" ErrorMessage="Invalid email format"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            CssClass="text-danger" Display="Dynamic" />
                                    </div>
                                    
                                    <asp:Button ID="btnVerifyEmail" runat="server" 
                                        CssClass="btn btn-danger btn-block" Text="Reset Password" 
                                        OnClick="btnVerifyEmail_Click" />
                                    
                                    <asp:Label ID="lblEmailMessage" runat="server" CssClass="error-message"></asp:Label>
                                    
                                    <p class="text-center mt-3">
                                        Remember your password? <a href="Login.aspx">Login</a>
                                    </p>
                                </asp:View>
                                
                                <!-- View 2: Password Reset -->
                                <asp:View ID="vwReset" runat="server">
                                    <div class="success-message">
                                        <i class="fas fa-check-circle"></i>Email Verification SuccessFull!
                                    </div>
                                    
                                    <div class="form-group">
                                        <asp:TextBox ID="txtNewPassword" runat="server" 
                                            CssClass="form-control" TextMode="Password" 
                                            placeholder="New Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" 
                                            ControlToValidate="txtNewPassword" ErrorMessage="*" 
                                            CssClass="error-star" Display="Dynamic" />
                                    </div>
                                    
                                    <div class="form-group">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" 
                                            CssClass="form-control" TextMode="Password" 
                                            placeholder="Confirm New Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                                            ControlToValidate="txtConfirmPassword" ErrorMessage="*" 
                                            CssClass="error-star" Display="Dynamic" />
                                        <asp:CompareValidator ID="cvPasswords" runat="server" 
                                            ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" 
                                            ErrorMessage="Passwords don't match" CssClass="text-danger" 
                                            Display="Dynamic" />
                                    </div>
                                    
                                    <asp:Button ID="btnResetPassword" runat="server" 
                                        CssClass="btn btn-danger btn-block" Text="Update Password" 
                                        OnClick="btnResetPassword_Click" />
                                    
                                    <asp:Label ID="lblResetMessage" runat="server" CssClass="error-message"></asp:Label>
                                </asp:View>
                            </asp:MultiView>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</body>
</html>