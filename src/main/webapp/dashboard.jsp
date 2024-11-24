<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://cdnvb4.haiper.ai/jobs/670e6c20a34ea7ad88a4b270/672a087b9a435b4a95383a9f/0.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 100px auto;
            padding: 50px 20px;
            text-align: center;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }

        .header img {
            width: 60px;
            height: 60px;
            margin-right: 15px;
        }

        .header h1 {
            font-size: 28px;
            color: #fff;
            font-weight: bold;
        }

        h1.welcome {
            font-size: 36px;
            color: #fff;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .card-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 30px;
        }

        .card {
            background-color: #4d285b;
            padding: 30px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            font-weight: bold;
            display: block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #4d285b;
            border-radius: 5px;
        }

        .card a:hover {
            background-color: #9610c7;
        }

        .footer {
            margin-top: 50px;
            font-size: 14px;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="header">
        <img src="https://cdnvb4.haiper.ai/jobs/670e6c20a34ea7ad88a4b270/672a097a98a5d5efd5dd00aa/0.jpg" alt="JavaEE Green University Logo">
        <h1>JavaEE Green University</h1>
    </div>


    <h1 class="welcome">Welcome to the Student Information Dashboard</h1>


    <div class="card-container">
        <div class="card">
            <h2>Add New Student</h2>
            <a href="index.jsp">Add Student</a>
        </div>

        <div class="card">
            <h2>View Student Data</h2>
            <a href="viewStudents.jsp">View Data</a>
        </div>

        <div class="card">
            <h2>Update Student Data</h2>
            <a href="student-servlet?action=update">Update Data</a>
        </div>
    </div>


    <div class="footer">
        <p>&copy; 2024 JavaEE Green University Student Info System. All rights reserved</p>
    </div>
</div>
</body>
</html>
