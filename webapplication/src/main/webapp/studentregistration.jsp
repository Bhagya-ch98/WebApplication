<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STUDENT REGISTRATION FORM</title>
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
            max-width: 800px;
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
            <h3 class="form-heading"><b>STUDENT REGISTRATION</b></h3>
            <form name="studentregistration" method="post" action="studentregister" onsubmit="return validateForm()">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>*First Name:</label>
                            <input type="text" class="form-control" placeholder="*First Name" name="firstname" id="firstname" onkeypress="fun1(event)">
                        </div>
                        

                        <div class="form-group">
                            <label>Last Name:</label>
                            <input type="text" class="form-control" placeholder="Last Name" name="lastname" id="lastname" onkeypress="fun1(event)">
                        </div>
                        <div class="form-group">
                            <label>*Mobile Number:</label>
                            <input type="text" class="form-control" placeholder="*Mobile Number" name="mobileno" id="mobileno" onkeypress="onlyNumber(event)" maxlength="10">
                        </div>
                        <div class="form-group">
                            <label>*Branch:</label>
                            <input type="text" class="form-control" placeholder="*Branch" name="branch" id="branch" onkeypress="fun1(event)">
                        </div>
                        <div class="form-group">
                            <label>*Course Id:</label>
                            <select class="form-control" name="courseid" id="courseid" onmouseover="showcid()">
                                <option>*Select Course Id:</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                            </select>
                            <p id="scid" class="note-text"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>*Mail Id:</label>
                            <input type="email" class="form-control" placeholder="*Mail Id" name="mailid" id="mailid">
                        </div>
                        <div class="form-group">
                            <label>*Year of Pass Out:</label>
                            <input type="text" class="form-control" placeholder="*Year of Pass Out" name="yearofpass" id="yearofpass" onkeypress="onlyNumber(event)">
                        </div>
                        <div class="form-group">
                            <label>*Password:</label>
                            <input type="password" class="form-control" placeholder="*Password" name="password" id="password" onmouseover="disppwd()">
                            <p id="pwd" class="note-text"></p>
                        </div>
                        <div class="form-group">
                            <label>*Re-enter Password:</label>
                            <input type="password" class="form-control" placeholder="*Re-enter Password" name="repassword" id="repassword" onmouseover="disppwd()" onkeyup="verifypwd()">
                            <p id="repwd" class="note-text"></p>
                        </div>
                        <div class="text-center paddingtop">
                            <button type="submit" class="btn btn-submit">SUBMIT</button>
                            <p id="p1" class="error-message paddingtop"></p>
                        </div>
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
            var fname = document.getElementById("firstname").value;
            var mobileno = document.getElementById("mobileno").value;
            var mail = document.getElementById("mailid").value;
            var password = document.getElementById("password").value;
            var repassword = document.getElementById("repassword").value;
            var branch = document.getElementById("branch").value;
            var cid = document.getElementById("courseid").value;
            var yop = document.getElementById("yearofpass").value;
            
            document.getElementById("p1").innerHTML = "";

            if (fname === "" || mobileno === "" || branch === "" || password === "" || repassword === "" || mail === "" || yop === "" || cid === "*Select Course Id:") {
                document.getElementById("p1").innerHTML = "*Please fill all mandatory fields";
                return false;
            }

            if (!validateEmail(mail)) {
                document.getElementById("p1").innerHTML = "*Invalid email address";
                return false;
            }

            if (!validateMobileNumber()) return false;

            if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/)) {
                document.getElementById("p1").innerHTML = "*Password must be strong (at least 8 characters, with uppercase, lowercase, numbers, and special characters)";
                return false;
            }

            if (password !== repassword) {
                document.getElementById("p1").innerHTML = "*Passwords do not match";
                return false;
            }

            return true;
        }

        function validateEmail(mailid) {
            var re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return re.test(mailid);
        }

        function validateMobileNumber() {
            var mobileNumber = document.getElementById("mobileno").value;
            var regex = /^\d{10}$/;
            if (regex.test(mobileNumber)) {
                return true;
            } else {
                document.getElementById("p1").innerHTML = "Invalid mobile number. Please enter a 10-digit number.";
                return false;
            }
        }

        function disppwd() {
            document.getElementById("pwd").innerHTML = "Password must be strong (at least 8 characters, with uppercase, lowercase, numbers, and special characters)";
        }


        function verifypwd() {
            var password = document.getElementById("password").value;
            var repassword = document.getElementById("repassword").value;

            if (password && password !== repassword) {
                document.getElementById("repwd").innerHTML = "Password does not match";
                document.getElementById("repwd").style.color = "red";
            } else {
                document.getElementById("repwd").innerHTML = "Password matches";
                document.getElementById("repwd").style.color = "green";
            }
        }

        function fun1(event) {
            var ch = event.which;
            if (!((ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122) || (ch == 32) || (ch == 8) || (ch == 0))) {
                event.preventDefault();
            }
        }

        function onlyNumber(event) {
            var ch = event.which;
            if (!((ch >= 48 && ch <= 57) || (ch == 8) || (ch == 0))) {
                event.preventDefault();
            }
        }
        
        function showcid() {
            document.getElementById("scid").innerHTML = "1=JFS 2=PFS 3=Testing 4=DevOps 5=Azure 6=Power BI";
        }
    </script>
</body>
</html>
