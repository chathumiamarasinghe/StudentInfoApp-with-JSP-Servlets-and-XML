<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1, h2 {
            color: #4d285b; /* Your preferred color */
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            text-align: left;
        }
        input[type="text"],
        input[type="number"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #9610c7; /* Your preferred color */
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #4d285b; /* Hover effect */
        }
        .link-container {
            margin-top: 20px;
        }
        a {
            text-decoration: none;
            color: #4d285b;
            font-weight: bold;
            margin: 5px;
            display: inline-block;
        }
        a:hover {
            color: #9610c7;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Submit Student Information</h1>
    <form action="student-servlet" method="post">
        <label for="name">Student Name:</label>
        <input type="text" id="name" name="name" required aria-label="Student Name">

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required aria-label="Age">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required aria-label="Email">

        <input type="submit" value="Submit">
    </form>

    <h2>View Stored Data</h2>
    <div class="link-container">
        <a href="student-servlet?action=view">View Student Data</a><br>
    </div>
</div>
</body>
</html>
