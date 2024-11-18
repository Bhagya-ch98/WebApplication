<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.examp.model.StudentModel" %>
<%@ page import="com.examp.model.CourseModel" %>

<%
    StudentModel usm = (StudentModel) request.getAttribute("editStudent");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>EDIT STUDENT</title>
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
            right: 20px;
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
            background-color: #ffffff;
            padding: 20px;
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
            margin-top: 10px;
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
            <h3 class="form-title">EDIT STUDENT</h3>   
            <form class="form-group" name="studentregistration" method="post" action="Student" onsubmit="return validateForm()">
                <%if(usm != null){ %>
                    <input type="hidden" name="StudentId" value="<%= usm.getStudentId() %>">

                    <div class="form-group">
                        <label class="form-label">*First Name:</label>
                        <input class="form-control" type="text" placeholder="First Name" name="firstname" id="firstname" value="<%= usm.getFirstname() %>" onkeypress="fun1(event)">
                    </div>

                    <div class="form-group">
                        <label class="form-label">Last Name:</label>
                        <input class="form-control" type="text" placeholder="Last Name" name="lastname" id="lastname" value="<%= usm.getLastname() %>" onkeypress="fun1(event)">
                    </div>

                    <div class="form-group">
                        <label class="form-label">*Mobile Number:</label>
                        <input class="form-control" type="text" placeholder="Mobile Number" name="mobileno" id="mobileno" value="<%= usm.getMobileno() %>" onkeypress="onlyNumber(event)" maxlength="10">
                    </div>

                    <div class="form-group">
                        <label class="form-label">*Branch:</label>
                        <input class="form-control" type="text" placeholder="Branch" name="branch" id="branch" value="<%= usm.getBranch() %>" onkeypress="fun1(event)">
                    </div>

                    <div class="form-group">
                        <label class="form-label">*Course ID:</label>
                        <input class="form-control" type="text" placeholder="Course ID" name="courseid" id="courseid" value="<%= usm.getCourseid() %>" onkeypress="onlyNumber(event)">
                    </div>

                    
				
				<div class="form-group">
					<label class="form-label">*Email:</label>
					<input class="form-control" type="email" placeholder="Email" name="mailid" id="mailid" value="<%= usm.getMailid() %>">
				</div>
				
				<div class="form-group">
					<label class="form-label">*Year of Pass Out:</label>
					<input class="form-control" type="text" placeholder="Year of Pass Out" name="yearofpass" id="yearofpass" value="<%= usm.getYearofpass() %>" onkeypress="onlyNumber(event)">
				</div>
				
				<div class="form-group">
					<label class="form-label">*Password:</label>
					<input class="form-control" type="password" placeholder="Password" name="password" id="password" value="<%= usm.getPassword() %>" onmouseover="disppwd()">
					<small id="pwd" class="form-text text-muted"></small>
				</div>
				
			<% } else { %> 
				<p class="error-message">Error: Student details are missing. Please try again.</p>
            <% } %>

            <div class="row btn-container">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<button type="submit" class="btn btn-success btn-custom">UPDATE STUDENT</button>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<a href="listofcourses" class="btn btn-secondary btn-custom">Cancel</a>
				</div>
				<div class="col-md-1"></div>
				<p id="p1" class="error-message w-100"></p>
			</div>
		</form>
	</div>
	</div>

	<script>
		function validateForm() {
			var fname = document.getElementById("firstname").value;
			var mobileno = document.getElementById("mobileno").value;
			var mail = document.getElementById("mailid").value;
			var password = document.getElementById("password").value;
			var branch = document.getElementById("branch").value;
			var cid = document.getElementById("courseid").value;
			var yop = document.getElementById("yearofpass").value;
			document.getElementById("p1").innerHTML = "";

			if (fname == "" || mobileno == "" || branch == "" || password == "" || mail == "" || yop == "" || cid == "*Select Course Id:" ) {
				document.getElementById("p1").innerHTML = "*Please fill all mandatory fields";
				return false;
			}

			if (!validateEmail(mail)) {
				document.getElementById("p1").innerHTML = "*Invalid email address";
				return false;
			}

			if (!validateMobileNumber()) {
				return false;
			}

			if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/)) {
				document.getElementById("p1").innerHTML = "*Password must be strong (at least 8 characters, with uppercase, lowercase, numbers, and special characters)";
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
