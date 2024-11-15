# StudentInfoApp

A simple web application built using JSP, Servlets, and XML for managing student information. This project allows users to add, view, update, and delete student data, with additional features for sorting and filtering.

Repo - https://github.com/chathumiamarasinghe/StudentInfoApp-with-JSP-Servlets-and-XML.git
## Features
- Add new student information (name, age, email).
- View stored student data.
- Update existing student information.
- Delete student records.
- Filter and sort student data.
- Search for students based on name, age, or email.
- Utilizes XML for data storage.

## Features Breakdown
### Dashboard
The dashboard is the main navigation interface where users can access all features, including:
- **Add** new students
- **View** the list of students
- **Update** or **Delete** student records

### View Students
The **View Students** page displays a table with all stored student data. Each student record includes:
- Name
- Age
- Email
- **Update** and **Delete** options

#### Update
To update a student's information, click the **Update** button next to their record, which takes you to a form where you can modify the student's details. After saving the changes, the user is redirected to the list view.

#### Delete
The **Delete** button allows for the removal of a student's record. Once deleted, the list is refreshed.

### Search Students
The **View Students** page also includes a **Search** functionality, allowing users to search for students by their name, age, or email.

### Add or Update Students
Users can add new student data by filling out a form with the following fields:
- Name
- Age
- Email

If a student already exists, their information can be updated.

## Prerequisites
- Java 8+
- Apache Tomcat 9+
- Maven
- Git

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/chathumiamarasinghe/Web-Application-for-Data-Management-with-JSP-Servlets-and-XML.git
   cd Web-Application-for-Data-Management-with-JSP-Servlets-and-XML

Import into your IDE as a Maven project.

Deploy the app to Apache Tomcat:

Copy the WAR file or deploy directly from your IDE.

Access the app via:

bash
Copy code
http://localhost:8080/StudentInfoApp
Usage
Navigate to the home page to add new student information.
View and manage the list of students from the data management interface.
Sort and filter student data using the provided options.
Use the Search functionality to filter student records based on specific criteria like name, age, or email.
Screenshots
Dashboard

View Students

Update Student Information

Add New Student

Search Functionality

![image](https://github.com/user-attachments/assets/e7fd1c18-08dd-4514-a628-f6f60217652e)
![image](https://github.com/user-attachments/assets/772e5db7-9d69-4e46-bc6f-704167d1f045)
![image](https://github.com/user-attachments/assets/6e5e745c-86d9-4b79-b3bc-223169a70f3e)
![image](https://github.com/user-attachments/assets/3b1088f6-578d-4a0b-ae39-9963a5079689)


