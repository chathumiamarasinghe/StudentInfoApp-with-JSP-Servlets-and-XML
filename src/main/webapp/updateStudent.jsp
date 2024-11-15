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
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            color: #4d285b;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
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
