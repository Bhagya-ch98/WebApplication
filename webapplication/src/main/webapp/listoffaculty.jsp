<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.examp.model.FacultyModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List Of Faculty</title>
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
        .form-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
            color: #2c3e50; /* Deep Navy Blue */
        }
        .table thead th {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #f2f2f2; /* Light Grey */
        }
        .table tbody tr:nth-child(even) {
            background-color: #ffffff; /* White */
        }
        .table td, .table th {
            text-align: center;
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
        <h3 class="form-title"><b>LIST OF FACULTY</b></h3>
        <div class="container">
            <div class="row">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Faculty Id</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Mobile No</th>
                            <th>G-Mail</th>
                            <th>Password</th>
                            <th>Qualification</th>
                            <th>Years of Experience</th>
                            <th>Cid</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<FacultyModel> listFaculty = (List<FacultyModel>) request.getAttribute("listFaculty");
                            if (listFaculty != null) {
                                for (FacultyModel faculty : listFaculty) {
                        %>
                        <tr>
                            <td><%= faculty.getFacultyId() %></td>
                            <td><%= faculty.getFirstname() %></td>
                            <td><%= faculty.getLastname() %></td>
                            <td><%= faculty.getMobileno() %></td>
                            <td><%= faculty.getMailid() %></td>
                            <td><%= faculty.getPassword() %></td>
                            <td><%= faculty.getQualification() %></td>
                            <td><%= faculty.getYearofexp() %></td>
                            <td><%= faculty.getCourseid() %></td>
                            <td><a href="Faculty?FacultyId=<%=faculty.getFacultyId() %>" class="btn btn-primary btn-sm">Edit</a></td>
                            <td><a href="deletefac?FacultyId=<%=faculty.getFacultyId() %>" class="btn btn-danger btn-sm">Delete</a></td>
                        </tr>
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <%
        Integer Fidupdate = (Integer) request.getAttribute("FidUpdated");
        int Fidupdated = (Fidupdate != null) ? Fidupdate : 0;
        if (Fidupdated != 0) {
        %>
        <p style="color:green; text-align:center;">The course ID <%= Fidupdated %> has been updated successfully</p>
        <%
        }
        %>
        <%
        String updatemessage = (String) request.getAttribute("updatemessage");
        if (updatemessage != null && updatemessage.equals("Row not updated, Something Went Wrong!!!")) {
        %>
        <p style="color:red; text-align:center;"><%= updatemessage %></p>
        <%
        }
        %>
        <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null && error.equals("Faculty not found, please try again!!")) {
        %>
        
        <p style="color:red; text-align:center;"><%= error %></p>
        <%
        }
        %>
        <%
        Integer Fiddelete = (Integer) request.getAttribute("Fiddeleted");
        int Fiddeleted = (Fiddelete != null) ? Fiddelete : 0;
        if (Fiddeleted != 0) {
        %>
        <p style="color:red; text-align:center;">The course ID <%= Fiddeleted %> has been deleted successfully</p>
        <%
        }
        %>
        <%
        String deletemessage = (String) request.getAttribute("deletemessage");
        if (deletemessage != null && deletemessage.equals("Row not deleted, Something Went Wrong!!!")) {
        %>
        <p style="color:red; text-align:center;"><%= deletemessage %></p>
        <%
        } 
        %>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>
</body>
</html>
