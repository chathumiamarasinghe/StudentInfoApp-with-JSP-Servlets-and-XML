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
</head>
<body>
<h1>Update Student Information</h1>
<form action="student-servlet" method="post">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <label for="name">Student Name:</label>
    <input type="text" id="name" name="name" value="<%= studentData[0] %>" required><br><br>

    <label for="age">Age:</label>
    <input type="number" id="age" name="age" value="<%= studentData[1] %>" required><br><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= studentData[2] %>" required><br><br>

    <input type="submit" value="Update">
</form>
<a href="index.jsp">Go back</a>
</body>
</html>
