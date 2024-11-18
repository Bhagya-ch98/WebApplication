<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.examp.model.FacultyModel" %>

<%
    FacultyModel ufm = (FacultyModel) request.getAttribute("editFaculty");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>EDIT FACULTY</title>
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
                position: relative;
            }
            .btn-logout {
                position: absolute;
                right: 15px;
                top: 15px;
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
                padding: 20px;
                background-color: #ffffff;
            }
            .form-container {
                max-width: 700px;
                margin: 20px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-title {
                text-align: center;
                font-weight: bold;
                margin-bottom: 20px;
                color: #2c3e50; /* Deep Navy Blue */
            }
            .form-label {
                font-weight: bold;
                color: #495057;
            }
            .form-control:focus {
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                border-color: #007bff;
            }
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
            }
            .btn-custom {
                width: 100%;
                font-size: 16px;
            }
            .btn-container .col-md-6 {
                padding-right: 0; 
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
            <a href="index.jsp" class="btn-logout">Log Out</a>
        </header>

        <div class="content">
            
            <div class="container form-container">
                <h3 class="form-title">EDIT FACULTY</h3>    
                <form class="form-group" name="facultyregistration" method="post" action="Faculty" onsubmit="return validateForm()">
                    <% if(ufm != null) { %>
                        <input type="hidden" name="FacultyId" value="<%= ufm.getFacultyId() %>">    

                        <div class="form-group">
                            <label class="form-label">*First Name:</label>
                            <input class="form-control" type="text" placeholder="*First Name" name="firstname" id="firstname" value="<%= ufm.getFirstname() %>" onkeypress="fun1(event)">
                        </div>

                        <div class="form-group">
                            <label class="form-label">Last Name:</label>
                            <input class="form-control" type="text" placeholder="Last Name" name="lastname" id="lastname" value="<%= ufm.getLastname() %>" onkeypress="fun1(event)">
                        </div>

                        <div class="form-group">
                            <label class="form-label">*Mobile Number:</label>
                            <input class="form-control" type="text" placeholder="*Mobile Number" name="mobileno" id="mobileno" value="<%= ufm.getMobileno() %>" onkeypress="onlyNumber(event)" maxlength="10">
                        </div>

                        <div class="form-group">
                            <label class="form-label">Qualification:</label>
                            <input class="form-control" type="text" placeholder="Qualification" name="qualification" id="qualification" value="<%= ufm.getQualification() %>" onkeypress="fun1(event)">
                        </div>

                        <div class="form-group">
                            <label class="form-label">*Course Id:</label>
                            <input class="form-control" type="text" placeholder="Course ID" name="courseid" id="courseid" value="<%= ufm.getCourseid() %>" onkeypress="onlyNumber(event)">
                        </div>

                        <div class="form-group">
                            <label class="form-label">*Mail Id:</label>
                            <input class="form-control" type="email" placeholder="*Mail Id" name="mailid" id="mailid" value="<%= ufm.getMailid() %>">
                        </div>

                        <div class="form-group">
                            <label class="form-label">*Year of Experience:</label>
                            <input class="form-control" type="text" placeholder="*Year of Experience" name="yearofexp" id="yearofexp" value="<%= ufm.getYearofexp() %>" onkeypress="onlyNumber(event)">
                        </div>

                        <div class="form-group">
                            <label class="form-label">*Password:</label>
                            <input class="form-control" type="password" placeholder="*Password" name="password" id="password" value="<%= ufm.getPassword() %>">
                        </div>

                    <% } else { %>
                        <p class="error-message">Error: Faculty details are missing. Please try again.</p>
                    <% } %>

                    <div class="row btn-container">
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-success btn-custom">UPDATE FACULTY</button>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-4">
                            <a href="listoffaculty" class="btn btn-secondary btn-custom">Cancel</a>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <p id="p1" class="error-message w-100"></p>
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
                var cid = document.getElementById("courseid").value;
                var yoe = document.getElementById("yearofexp").value;
                
                if (fname == "" || mobileno == "" || password == "" || mail == "" || yoe == "" || cid == "") {
                    document.getElementById("p1").innerHTML = "*Please fill all mandatory fields";
                    document.getElementById("p1").style.color = "red";
                    return false;
                }

                if (!validateEmail(mail)) {
                    document.getElementById("p1").innerHTML = "*Invalid email address";
                    document.getElementById("p1").style.color = "red";
                    return false;
                }

                if (!validateMobileNumber()) {
                    return false;
                }


                if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/)) {
                    document.getElementById("p1").innerHTML = "*Password must be strong (at least 8 characters, with uppercase, lowercase, numbers, and special characters)";
                    document.getElementById("p1").style.color = "red";
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
                    document.getElementById("p1").innerHTML = "*Invalid mobile number. Please enter a 10-digit number.";
                    document.getElementById("p1").style.color = "red";
                    return false;
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
        </script>
    </body>
</html>
