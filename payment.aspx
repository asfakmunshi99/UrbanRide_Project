<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Complete Your Booking</title>
    <style>
        body {
            background: linear-gradient(-45deg, white, #E5F3FD, white, #E5F3FD, white);
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .payment-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 600px;
            padding: 40px;
        }
        
        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .payment-header h2 {
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 10px;
            font-family:'Berlin Sans FB';
            font-weight:400;
        }
        
        .payment-header p {
            color: #7f8c8d;
            font-size: 16px;
        }
        
        .payment-option {
            padding: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            margin-bottom: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #f9f9f9;
        }
        
        .payment-option:hover {
            border-color: #3498db;
        }
        
        .payment-option.selected {
            border-color: black;
            background: #f0f7ff;
        }
        
        .payment-option h3 {
            margin: 0;
            display: flex;
            align-items: center;
            color: #2c3e50;
            font-size: 18px;
        }
        
        .payment-option i {
            font-size: 24px;
            margin-right: 15px;
            color: #3498db;
        }
        
        .card-form {
            margin-top: 20px;
            padding: 20px;
            border-radius: 10px;
            background: #f9f9f9;
            animation: fadeIn 0.3s ease;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
            font-size: 14px;
        }
        span {
            color:red;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s;
        }
        
        .form-group input:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
            outline: none;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .btn-confirm {
            background: black;
            color: white;
            padding: 16px;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 20px;
        }
        
        .btn-confirm:hover {
        
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(41, 128, 185, 0.3);
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Add Font Awesome for icons */
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css');
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="payment-container">
            <div class="payment-header">
                <h2><span>C</span>omplete Your Booking</h2>
                <p>Select your preferred payment method</p>
            </div>
            
            <!-- Credit Card Option -->
            <div class="payment-option selected" onclick="selectPayment('creditcard')">
                <h3><i class="far fa-credit-card"></i> Credit/Debit Card</h3>
                <div id="creditCardForm" class="card-form">
                    <div class="form-group">
                        <label>Card Number</label>
                        <input type="text" placeholder="4242 4242 4242 4242" value="4242 4242 4242 4242">
                    </div>
                    <div class="form-group">
                        <label>Cardholder Name</label>
                        <input type="text" placeholder="John Doe" value="John Doe">
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Expiry Date</label>
                            <input type="text" placeholder="MM/YY" value="12/25">
                        </div>
                        <div class="form-group">
                            <label>CVV</label>
                            <input type="text" placeholder="123" value="123">
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- PayPal Option -->
            <div class="payment-option" onclick="selectPayment('paypal')">
                <h3><i class="fab fa-paypal"></i> PayPal</h3>
            </div>
            
            <!-- Hidden field to store selected payment method -->
            <asp:HiddenField ID="hdnPaymentMode" runat="server" Value="creditcard" />
            
            <asp:Button ID="btnBookNow" runat="server" Text="Complete Booking" 
                CssClass="btn-confirm" OnClick="btnBookNow_Click" />
        </div>
    </form>
    
    <script>
        function selectPayment(method) {
            // Update UI
            document.querySelectorAll('.payment-option').forEach(el => {
                el.classList.remove('selected');
        });
        event.currentTarget.classList.add('selected');

        // Show/hide card form
            const cardForm = document.getElementById('creditCardForm');
        if (method === 'creditcard') {
            cardForm.style.display = 'block';
        } else {
            cardForm.style.display = 'none';
        }
            
        // Update hidden field value
        document.getElementById('<%= hdnPaymentMode.ClientID %>').value = method;
            }

            // Auto-select credit card by default
            window.onload = function() {
                document.querySelector('.payment-option').click();
            };
    </script>
</body>
</html>