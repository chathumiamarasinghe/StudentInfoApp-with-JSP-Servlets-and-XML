<%@ page import="org.example.studentinfoapp.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[] studentData = (String[]) request.getAttribute("studentData");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Information</title>
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
            max-width: 500px;
            margin: 100px auto;
            padding: 40px 20px;
            text-align: center;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }

        h1 {
            font-size: 36px;
            color: #fff;
            margin-bottom: 20px;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #fff;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"] {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            background-color: #f9f9f9;
            color: #333;
            width: 100%;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #9610c7;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #4d285b;
        }

        a {
            text-decoration: none;
            color: #9610c7;
            font-weight: bold;
            text-align: center;
            display: block;
            margin-top: 20px;
        }

        a:hover {
            color: #4d285b;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Student Information</h1>
    <form action="student-servlet" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

        <label for="name">Student Name:</label>
        <input type="text" id="name" name="name" value="<%= studentData[0] %>" required>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="<%= studentData[1] %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= studentData[2] %>" required>

        <input type="submit" value="Update">
    </form>
    <a href="dashboard.jsp">Go back</a>
</div>
</body>
</html>
