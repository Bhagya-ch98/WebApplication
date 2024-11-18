<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home Page</title>
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
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #ffffff;
        }
        .header-title1 {
            font-size: 1.5rem;
            color: #2c3e50; /* Deep Navy Blue */
            margin-bottom: 20px;
        }
        .header-title {
        font-size: 1.5rem;
            color: white; /* Deep Navy Blue */
            margin-bottom: 20px;
        }
        .button-list {
            text-align: center;
            margin-top: 20px;
        }
        .btn-custom {
            background-color: #2c3e50; /* Deep Navy Blue */
            color: #ffffff;
            width: 200px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #1a252f; /* Darker Navy Blue */
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
        <h3 class="header-title1"><b>Welcome To Student Home Page</b></h3>
        <div class="button-list">
            <a href="ulistofcourses" class="btn btn-custom btn-sm">List of Courses</a><br>
            <a href="ulistoffaculty" class="btn btn-custom btn-sm">List of Faculty</a><br>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>
</body>
</html>
