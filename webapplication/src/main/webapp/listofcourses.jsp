<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.examp.model.CourseModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>List Of Courses</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
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
        .form-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
            color: #2c3e50; /* Deep Navy Blue */
        }
        .table {
            width: 100%;
            background-color: #ffffff;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table th, .table td {
            padding: 12px 15px;
            border: 1px solid #dee2e6;
            text-align: left;
            font-size: 14px;
        }
        .table th {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .btn-primary {
            background-color: #2c3e50;
            border-color: #2c3e50;
        }
        .btn-primary:hover {
            background-color: #1a252f;
            border-color: #1a252f;
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
        <h1 class="header-title">Welcome to My Website</h1>
        <a href="index.jsp" class="btn-logout">Log Out</a>
    </header>

    <div class="content">
        <div class="form-container">
            <h3 class="form-title">LIST OF COURSES</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Course Id</th>
                        <th>Course Name</th>
                        <th>Course Fee</th>
                        <th>Course Duration</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<CourseModel> listCourse = (List<CourseModel>) request.getAttribute("listCourse");
                        if (listCourse != null) {
                            for (CourseModel course : listCourse) {
                    %>
                        <tr>
                            <td><%= course.getCid() %></td>
                            <td><%= course.getCoursename() %></td>
                            <td><%= course.getCoursefee() %></td>
                            <td><%= course.getCourseduration() %></td>
                            <td><a href="Course?Cid=<%=course.getCid() %>" class="btn btn-primary btn-sm">Edit</a></td>
                        </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
            </table>
            <% 
                Integer Cidupdate = (Integer) request.getAttribute("CidUpdated");
                int Cidupdated = (Cidupdate != null) ? Cidupdate : 0;
                if (Cidupdated != 0) {
            %>
                <p style="color:green; text-align:center;">The course ID <%= Cidupdated %> has been updated successfully</p>
            <% 
                }
                String updatemessage = (String) request.getAttribute("updatemessage");
                if (updatemessage != null && updatemessage.equals("Row not updated, Something Went Wrong!!!")) {
            %>
                <p style="color:red; text-align:center;"><%= updatemessage %></p>
            <% 
                }
                String error = (String) request.getAttribute("errorMessage");
                if (error != null && error.equals("Course not found, please try again!!")) {
            %>
                <p style="color:red; text-align:center;"><%= error %></p>
            <% 
                }
            %>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>
</body>
</html>
