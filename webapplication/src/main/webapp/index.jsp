<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #e8f4f8; /* Soft Blue */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .header {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
            padding: 15px;
            text-align: center;
        }
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ffffff;
            padding: 20px;
        }
        .welcome-container {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: #d3d3d3; /* Light Grey */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            color: #2c3e50; /* Deep Navy Blue */
            max-width: 400px;
        }
        .welcome-message {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .login-button {
            padding: 10px 20px;
            font-size: 1.1em;
            color: #ffffff;
            background-color: #2c3e50; /* Deep Navy Blue */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .login-button:hover {
            background-color: #1a252f; /* Darker Navy Blue */
            color: #ffffff;
        }
        .footer {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>Welcome to My Website</h1>
    </header>

    <div class="content">
        <div class="welcome-container">
            <p class="welcome-message">WELCOME TO THE HOME PAGE</p>
            <button onclick="goToLoginPage()" class="login-button">Go to Login Page</button>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>

    <script>
        function goToLoginPage() {
            window.location.href = "loginpage.jsp";
        }
    </script>
</body>
</html>
