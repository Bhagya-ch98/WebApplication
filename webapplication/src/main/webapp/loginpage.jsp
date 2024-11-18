<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            background-color: #d3d3d3; /* Light Grey */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-heading {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
            color: #2c3e50; /* Deep Navy Blue */
        }
        .error-text {
            color: red;
            font-size: 0.9em;
        }
        .info-text {
            font-size: 0.9em;
            color: #6c757d;
        }
        .btn-submit {
            width: 100%;
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-submit:hover {
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
        <div class="form-container">
            <h3 class="form-heading">LOGIN PAGE</h3>
            <form name="registration" method="post" action="loginpage" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="userid">*USER ID:</label>
                    <input type="text" class="form-control" name="userid" id="userid" placeholder="Enter your User ID" onkeypress="onlyNumber(event)">
                </div>
                <div class="form-group">
                    <label for="password">*PASSWORD:</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter your Password" onfocus="showPasswordInfo()">
                    <small id="passwordHint" class="info-text"></small>
                </div>
                <div class="form-group">
                    <label for="role">*ROLE:</label>
                    <select class="form-control" name="role" id="role">
                        <option>Select your role:</option>
                        <option>ADMIN</option>
                        <option>FACULTY</option>
                        <option>STUDENT</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-submit">SUBMIT</button>
                <p id="errorMessage" class="error-text mt-3"></p>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>

    <script>
        function showPasswordInfo() {
            document.getElementById("passwordHint").innerText = "*Password must be strong (at least 8 characters, with uppercase, lowercase, numbers, and special characters)";
        }

        function validateForm() {
            var uid = document.getElementById("userid").value;
            var password = document.getElementById("password").value;
            var role = document.getElementById("role").value;

            document.getElementById("errorMessage").innerText = "";

            if (uid === "" || password === "" || role === "Select your role:") {
                document.getElementById("errorMessage").innerText = "*Please fill in all mandatory fields";
                return false;
            }

            if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/)) {
                document.getElementById("errorMessage").innerText = "*Password must be strong (at least 8 characters, with uppercase, lowercase, numbers, and special characters)";
                return false;
            }

            return true;
        }

        function onlyNumber(event) {
            var ch = event.which;
            if (!(ch >= 48 && ch <= 57)) {
                event.preventDefault();
            }
        }
    </script>
</body>
</html>

