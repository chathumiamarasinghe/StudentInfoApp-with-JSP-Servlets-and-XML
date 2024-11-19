<%@ page import="java.io.File" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
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
            margin: 150px auto;
            padding: 50px 20px;
            text-align: center;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }

        h1 {
            font-size: 36px;
            color: #fff;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .search-bar {
            margin-bottom: 20px;
            padding: 10px;
            width: 80%;
            max-width: 400px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .dashboard-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .dashboard-table th, .dashboard-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .dashboard-table th {
            background-color: #4d285b;
            color: white;
        }

        .actions a {
            padding: 8px 12px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            text-align: center;
            margin-right: 10px;
        }

        .actions .update-btn {
            background-color: #28a745;
        }

        .actions .update-btn:hover {
            background-color: #218838;
        }

        .actions .delete-btn {
            background-color: #dc3545;
        }

        .actions .delete-btn:hover {
            background-color: #c82333;
        }

        .footer {
            margin-top: 50px;
            font-size: 14px;
            color: #fff;
            text-align: center;
        }
        a {
            text-decoration: none;
            color: #fff;
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
    <h1>View Students</h1>

    <!-- Search Bar -->
    <form action="viewStudents.jsp" method="get">
        <input type="text" class="search-bar" name="search" placeholder="Search by name..." value="<%= request.getParameter("search") %>">
    </form>

    <%-- Display data in a table --%>
    <%
        File xmlFile = new File(application.getRealPath("/WEB-INF/students.xml"));
        if (xmlFile.exists()) {
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("student");
            String searchQuery = request.getParameter("search") != null ? request.getParameter("search").toLowerCase() : "";
    %>

    <table class="dashboard-table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (nList != null && nList.getLength() > 0) {
                for (int temp = 0; temp < nList.getLength(); temp++) {
                    Node nNode = nList.item(temp);
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        String studentId = eElement.getAttribute("id");
                        String name = eElement.getElementsByTagName("name").item(0).getTextContent();
                        String age = eElement.getElementsByTagName("age").item(0).getTextContent();
                        String email = eElement.getElementsByTagName("email").item(0).getTextContent();

                        // Filter based on search query
                        if (searchQuery.isEmpty() || name.toLowerCase().contains(searchQuery)) {
        %>
        <tr>
            <td><%= name %></td>
            <td><%= age %></td>
            <td><%= email %></td>
            <td class="actions">
                <a href="student-servlet?action=update&id=<%= studentId %>" class="update-btn">Update</a>
                <a href="student-servlet?action=delete&id=<%= studentId %>" class="delete-btn">Delete</a>
            </td>
        </tr>
        <%
                        }
                    }
                }
            }
        %>
        </tbody>
    </table>

    <% } else { %>
    <p>No student data available.</p>
    <% } %>

    <div class="footer">
        <a href="dashboard.jsp">Go back</a>
        <p>&copy; 2024 Student Info App. All rights reserved.</p>
    </div>

</div>

</body>
</html>
