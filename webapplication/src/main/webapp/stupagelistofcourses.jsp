<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.examp.model.CourseModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List Of Courses</title>
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
            padding: 20px;
            background-color: #ffffff;
        }
        .header-title {
            text-align: center;
            margin-top: 30px;
            font-size: 1.5rem;
            color: #2c3e50; /* Deep Navy Blue */
        }
        .header-title1 {
            text-align: center;
            margin-top: 30px;
            font-size: 1.5rem;
            color: white; 
        }
        .table {
            margin-top: 20px;
        }
        .table thead th {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
            text-align: center;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2; /* Light Grey */
        }
        .table tbody tr:nth-child(even) {
            background-color: #ffffff; /* White */
        }
        .table tbody td {
            text-align: center;
        }
        .footer {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
            padding: 10px;
            text-align: center;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <header class="header">
        <h1 class="header-title1">Welcome to My Website</h1>
        <a href="index.jsp" class="btn-logout">Log Out</a>
    </header>

    <div class="content">
        <h3 class="header-title"><b>LIST OF COURSES</b></h3>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Course Id</th>
                                <th>Course Name</th>
                                <th>Course Fee</th>
                                <th>Course Duration</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%List<CourseModel> listCourse = (List<CourseModel>) request.getAttribute("slistCourse");
                            if (listCourse != null) {
                                for (CourseModel course : listCourse) {
                            %>
                            <tr>
                                <td><%= course.getCid() %></td>
                                <td><%= course.getCoursename() %></td>
                                <td><%= course.getCoursefee() %></td>
                                <td><%= course.getCourseduration() %></td>
                            </tr>
                            <% 
                                }
                            }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>
</body>
</html>
