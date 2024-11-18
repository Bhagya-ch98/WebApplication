<!DOCTYPE html>
<html lang="en">
<head>
    <title>Faculty Registration Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header-title {
            font-size: 1.5rem;
            margin: 0;
        }
        .btn-logout {
            background-color: #ffffff;
            color: #2c3e50;
            border: 2px solid #ffffff;
            border-radius: 5px;
            padding: 5px 10px;
            text-decoration: none;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .btn-logout:hover {
            background-color: #1a252f; /* Darker Navy Blue */
            color: #ffffff;
            border-color: #1a252f;
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
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 8px;
            background-color: #ffffff; /* White */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-heading {
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
            color: #2c3e50; /* Deep Navy Blue */
        }
        .paddingbottom {
            padding-bottom: 15px;
        }
        .paddingtop {
            padding-top: 15px;
        }
        .note-text {
            color: gray;
            font-size: 0.9em;
        }
        .form-group label {
            font-weight: bold;
        }
        .error-message {
            color: red;
            font-size: 0.9em;
        }
        .success-message {
            color: green;
            font-size: 0.9em;
        }
        .note {
            font-size: 0.8em;
            color: gray;
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
        <h1 class="header-title">Welcome to My Website</h1>
        <a href="index.jsp" class="btn-logout">Log Out</a>
    </header>

        <div class="content">
        <div class="form-container">
            <h3 class="form-heading"><b>FACULTY REGISTRATION</b></h3>
            <form name="facultyregistration" method="post" action="facultyregister" onsubmit="return validateForm()">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>*First Name:</label>
                            <input class="form-control" type="text" placeholder="First Name" name="firstname" id="firstname" onkeypress="validateText(event)">
                        </div>
                        <div class="form-group">
                            <label>Last Name:</label>
                            <input class="form-control" type="text" placeholder="Last Name" name="lastname" id="lastname" onkeypress="validateText(event)">
                        </div>
                        <div class="form-group">
                            <label>*Mobile Number:</label>
                            <input class="form-control" type="text" placeholder="Mobile Number" name="mobileno" id="mobileno" onkeypress="validateNumber(event)" maxlength="10">
                            <small class="note">Enter a 10-digit mobile number.</small>
                        </div>
                        <div class="form-group">
                            <label>Qualification:</label>
                            <input class="form-control" type="text" placeholder="Qualification" name="qualification" id="qualification" onkeypress="validateText(event)">
                        </div>
                        <div class="form-group">
                            <label>*Course Id:</label>
                            <select class="form-control" name="courseid" id="courseid">
                                <option selected disabled>Select Course Id</option>
                                <option value="1">1 - JFS</option>
                                <option value="2">2 - PFS</option>
                                <option value="3">3 - Testing</option>
                                <option value="4">4 - DevOps</option>
                                <option value="5">5 - Azure</option>
                                <option value="6">6 - Power BI</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>*Email:</label>
                            <input class="form-control" type="email" placeholder="Email" name="mailid" id="mailid">
                        </div>
                        <div class="form-group">
                            <label>*Years of Experience:</label>
                            <input class="form-control" type="text" placeholder="Years of Experience" name="yearofexp" id="yearofexp" onkeypress="validateNumber(event)">
                        </div>
                        <div class="form-group">
                            <label>*Password:</label>
                            <input class="form-control" type="password" placeholder="Password" name="password" id="password">
                            <small class="note">Must be at least 8 characters, include uppercase, lowercase, numbers, and special characters.</small>
                        </div>
                        <div class="form-group">
                            <label>*Re-enter Password:</label>
                            <input class="form-control" type="password" placeholder="Re-enter Password" name="repassword" id="repassword" onkeyup="verifyPassword()">
                            <small id="password-match-message" class="error-message"></small>
                        </div>
                        <button type="submit" class="btn btn-submit">Submit</button>
                        <small id="validation-message" class="error-message text-center"></small>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>

    <script>
        function validateForm() {
            const fname = document.getElementById("firstname").value.trim();
            const mobileno = document.getElementById("mobileno").value.trim();
            const mail = document.getElementById("mailid").value.trim();
            const password = document.getElementById("password").value.trim();
            const repassword = document.getElementById("repassword").value.trim();
            const cid = document.getElementById("courseid").value;
            const yoe = document.getElementById("yearofexp").value.trim();
            const validationMessage = document.getElementById("validation-message");

            validationMessage.innerText = "";

            if (!fname || !mobileno || !mail || !password || !repassword || cid === "Select Course Id" || !yoe) {
                validationMessage.innerText = "*Please fill all mandatory fields";
                return false;
            }

            if (!validateEmail(mail)) {
                validationMessage.innerText = "*Invalid email address";
                return false;
            }

            if (!validateMobileNumber()) {
                return false;
            }

            if (!validatePasswordStrength(password)) {
                validationMessage.innerText = "*Password must be strong (min 8 characters, uppercase, lowercase, numbers, special characters)";
                return false;
            }

            if (password !== repassword) {
                validationMessage.innerText = "*Passwords do not match";
                return false;
            }

            return true;
        }

        function validateText(event) {
            const ch = event.which;
            if (!((ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122) || ch === 32)) {
                event.preventDefault();
            }
        }

        function validateNumber(event) {
            const ch = event.which;
            if (!(ch >= 48 && ch <= 57)) {
                event.preventDefault();
            }
        }

        function validateEmail(mailid) {
            const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return re.test(mailid);
        }

        function validateMobileNumber() {
            const mobileNumber = document.getElementById("mobileno").value;
            const regex = /^\d{10}$/;
            if (!regex.test(mobileNumber)) {
                document.getElementById("validation-message").innerText = "*Invalid mobile number. Please enter a 10-digit number.";
                return false;
            }
            return true;
        }

    function validatePasswordStrength(password) {
        return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/.test(password);
    }

    function verifyPassword() {
        const password = document.getElementById("password").value;
        const repassword = document.getElementById("repassword").value;
        const passwordMatchMessage = document.getElementById("password-match-message");

        if (repassword && password !== repassword) {
            passwordMatchMessage.innerText = "*Passwords do not match";
        } else {
            passwordMatchMessage.innerText = "";
        }
    }
</script>

</body>
</html>
