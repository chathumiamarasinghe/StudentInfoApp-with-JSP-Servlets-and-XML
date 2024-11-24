package org.example.studentinfoapp;

import org.w3c.dom.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.regex.Pattern;

@WebServlet(name = "studentServlet", value = "/student-servlet")
public class StudentServlet extends HttpServlet {

    //for adding or updating student data
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve parameters from the form
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String email = request.getParameter("email");


        //validations
        String validationError = validateInput(name, age, email);
        if (!validationError.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, validationError);
            return;
        }

        if (id != null && !id.isEmpty()) {
            deleteStudent(id);  // Remove the old student record by ID
        }

        saveToXML(id, name, age, email);


        response.sendRedirect("viewStudents.jsp");
    }

    private String validateInput(String name, String age, String email) {
        if (name == null || age == null || email == null || name.isEmpty() || age.isEmpty() || email.isEmpty()) {
            return "All fields are required.";
        }


        if (!Pattern.matches("^[A-Za-z ]+$", name)) {
            return "Name can only contain alphabetic characters.";
        }


        try {
            int ageValue = Integer.parseInt(age);
            if (ageValue < 1 || ageValue > 30) {
                return "Age must be a number between 1 and 30.";
            }
        } catch (NumberFormatException e) {
            return "Age must be a valid number.";
        }


        if (!Pattern.matches("^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$", email)) {
            return "Invalid email format.";
        }

        return "";
    }

    private void saveToXML(String id, String name, String age, String email) throws IOException {
        try {
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc;

            File xmlFile = new File(getServletContext().getRealPath("/WEB-INF/students.xml"));
            if (xmlFile.exists()) {
                doc = dBuilder.parse(xmlFile);
                doc.getDocumentElement().normalize();
            } else {
                doc = dBuilder.newDocument();
                Element rootElement = doc.createElement("students");
                doc.appendChild(rootElement);
            }

            Element student = doc.createElement("student");


            if (id == null || id.isEmpty()) {
                id = String.valueOf(System.currentTimeMillis());
            }
            student.setAttribute("id", id); // Unique identifier

            Element nameElement = doc.createElement("name");
            nameElement.appendChild(doc.createTextNode(name));
            student.appendChild(nameElement);

            Element ageElement = doc.createElement("age");
            ageElement.appendChild(doc.createTextNode(age));
            student.appendChild(ageElement);

            Element emailElement = doc.createElement("email");
            emailElement.appendChild(doc.createTextNode(email));
            student.appendChild(emailElement);

            doc.getDocumentElement().appendChild(student);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(xmlFile);
            transformer.transform(source, result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //GET requests for viewing, deleting, or updating student data
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("view".equals(action)) {
            displayData(response);
        } else if ("delete".equals(action)) {
            String id = request.getParameter("id");
            deleteStudent(id);
            response.sendRedirect("viewStudents.jsp");
        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            request.setAttribute("studentData", getStudentById(id));
            request.getRequestDispatcher("updateStudent.jsp").forward(request, response);
        } else {
            displayData(response);
        }
    }

    private void displayData(HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            File xmlFile = new File(getServletContext().getRealPath("/WEB-INF/students.xml"));
            if (!xmlFile.exists()) {
                out.println("<h2>No data available</h2>");
                return;
            }

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("student");

            /*out.println("<html><head><title>Student Information</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; }");
            out.println("h1 { color: #4d285b; }");
            out.println("table { width: 100%; border-collapse: collapse; margin: 20px 0; }");
            out.println("th, td { padding: 12px; text-align: left; border: 1px solid #ddd; }");
            out.println("th { background-color: #4d285b; color: white; }");
            out.println("tr:hover { background-color: #f1f1f1; }");
            out.println("a { text-decoration: none; color: #4d285b; }");
            out.println("a:hover { text-decoration: underline; }");
            out.println("</style></head><body>");
            out.println("<h1>Student Information</h1>");
            out.println("<table><tr><th>Name</th><th>Age</th><th>Email</th><th>Actions</th></tr>");*/

            /*for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    String studentId = eElement.getAttribute("id");
                    String name = eElement.getElementsByTagName("name").item(0).getTextContent();
                    String age = eElement.getElementsByTagName("age").item(0).getTextContent();
                    String email = eElement.getElementsByTagName("email").item(0).getTextContent();
                    out.println("<tr><td>" + name + "</td><td>" + age + "</td><td>" + email + "</td>" +
                            "<td><a href='student-servlet?action=update&id=" + studentId + "'>Update</a> " +
                            "<a href='student-servlet?action=delete&id=" + studentId + "'>Delete</a></td></tr>");
                }
            }
            out.println("</table></body></html>");*/
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteStudent(String id) {
        try {
            File xmlFile = new File(getServletContext().getRealPath("/WEB-INF/students.xml"));
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("student");
            for (int i = 0; i < nList.getLength(); i++) {
                Element student = (Element) nList.item(i);
                if (student.getAttribute("id").equals(id)) {
                    student.getParentNode().removeChild(student);
                    break;
                }
            }

            // Save the updated document back to the XML file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(xmlFile);
            transformer.transform(source, result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //retrieves the data
    private String[] getStudentById(String id) {
        String[] studentData = new String[3]; // [name, age, email]
        try {
            File xmlFile = new File(getServletContext().getRealPath("/WEB-INF/students.xml"));
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("student");
            for (int i = 0; i < nList.getLength(); i++) {
                Element student = (Element) nList.item(i);
                if (student.getAttribute("id").equals(id)) {
                    studentData[0] = student.getElementsByTagName("name").item(0).getTextContent();
                    studentData[1] = student.getElementsByTagName("age").item(0).getTextContent();
                    studentData[2] = student.getElementsByTagName("email").item(0).getTextContent();
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentData;
    }
}
