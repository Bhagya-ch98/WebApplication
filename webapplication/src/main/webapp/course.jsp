<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
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
        <div class="form-container">
            <h3 class="form-heading"><b>COURSE REGISTRATION</b></h3>
            <form class="form-group" name="course" method="post" action="courseregister" onsubmit="return validateForm()">
                <div class="row paddingbottom">
                    <div class="col-md-12">
                        <label>*Course Name:</label>
                        <select class="form-control" name="coursename" id="coursename">
                            <option>*Select Course:</option>
                            <option>Java Full Stack</option>
                            <option>Python Full Stack</option>
                            <option>Testing</option>
                            <option>DevOps</option>
                            <option>Azure</option>
                            <option>Power BI</option>
                        </select>
                    </div>
                </div>
                <div class="row paddingbottom">
                    <div class="col-md-12">
                        <label>*Course Fee:</label>
                        <input class="form-control" type="text" placeholder="*Course Fee" name="coursefee" id="coursefee" onkeypress="onlyNumber(event)">
                    </div>
                </div>
                <div class="row paddingbottom">
                    <div class="col-md-12">
                        <label>*Course Duration (in Months):</label>
                        <select class="form-control" name="courseduration" id="courseduration">
                            <option>*Select Course Duration:</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                        </select>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-submit">SUBMIT</button>
                    <p id="p1" class="text-danger paddingtop"></p>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>DEVELOPED BY --> K.Tanuja, K.Jyotshna, Ch.BhagyaLaxmi, G.Poojitha</p>
    </footer>

    <script>
        function validateForm() {
            var cname = document.getElementById("coursename").value;
            var cfee = document.getElementById("coursefee").value;
            var cduration = document.getElementById("courseduration").value;

            document.getElementById("p1").innerHTML = "";

            if (cname === "*Select Course:" || cfee === "" || cduration === "*Select Course Duration:") {
                document.getElementById("p1").innerHTML = "*Please fill all mandatory fields";
                return false;
            }

            return true;
        }

        function onlyNumber(event) {
            var ch = event.which;
            if (!((ch >= 48 && ch <= 57) || ch === 8 || ch === 0)) {
                event.preventDefault();
            }
        }
    </script>
</body>
</html>
