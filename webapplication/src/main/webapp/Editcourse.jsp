<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.examp.model.CourseModel"%>
<%
    CourseModel ucm = (CourseModel) request.getAttribute("editCourse");
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <title>EDIT COURSE</title>
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
        .header h1 {
            margin: 0;
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
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff; /* White */
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
    </style>
</head>
<body>
    <header class="header">
        <h1>Welcome to My Website</h1>
        <a href="index.jsp" class="btn-logout">Log Out</a>
    </header>

    <div class="content">
        <div class="container form-container">
            <form class="form-group" name="Registration" method="post" action="Course" onsubmit="return show()">
                <h3 class="form-title">EDIT COURSE</h3>
                <% if(ucm != null) { %>
                <input type="hidden" name="Cid" value="<%= ucm.getCid() %>">
                <div class="form-group">
                    <label class="form-label">*Course Name:</label>
                    <input class="form-control" type="text" name="coursename" id="coursename" placeholder="COURSE NAME" value="<%= ucm.getCoursename() %>" onkeypress="onlyLetters(event)">
                </div>
                <div class="form-group">
                    <label class="form-label">*Course Fee:</label>
                    <input class="form-control" type="text" name="coursefee" id="coursefee" placeholder="COURSE FEE" value="<%= ucm.getCoursefee() %>" onkeypress="onlyNumber(event)" maxlength="5">
                </div>
                <div class="form-group">
                    <label class="form-label">*Course Duration (Months):</label>
                    <input class="form-control" type="text" name="courseduration" id="courseduration" placeholder="COURSE DURATION" value="<%= ucm.getCourseduration() %>" onkeypress="onlyNumber(event)" maxlength="1">
                </div>
                <% } else { %>
                <p class="error-message">Error: Course details are missing. Please try again.</p>
                <% } %>
                <div class="row btn-container">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-success btn-custom">UPDATE COURSE</button>
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

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>

    <script>
        function show() {
            var cn = document.getElementById("coursename").value;
            var cf = document.getElementById("coursefee").value;
            var cd = document.getElementById("courseduration").value;
            
            if (cn == "" || cf == "" || cd == "") {
                document.getElementById("p1").innerHTML = "*Enter Mandatory Fields";
                document.getElementById("p1").style.color = "red";
                return false;
            } else {
                return true;
            }
        }

        function onlyLetters(event) {
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
