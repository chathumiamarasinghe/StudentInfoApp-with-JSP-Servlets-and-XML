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
            background: url('https://cdnvb4.haiper.ai/jobs/670e6c20a34ea7ad88a4b270/672a087b9a435b4a95383a9f/2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 100px auto;
            padding: 30px 20px;
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        h1 {
            font-size: 32px;
            color: #fff;
            margin-bottom: 20px;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 8px;
            margin-left: 80px;
            font-weight: bold;
            color: #fff;
            text-align: left;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"] {
            width: 75%;
            padding: 12px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.8);
            color: #333;
            box-sizing: border-box;
            margin-left: auto;
            margin-right: auto;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="email"]:focus {
            outline: none;
            background: rgba(255, 255, 255, 1);
        }

        input[type="submit"] {
            background-color: #4d285b;
            color: white;
            border: none;
            padding: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            width: 50%;
            margin: 0 auto;
            display: block;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #9610c7;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #fff;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            font-size: 16px;
            color: #fff;
            text-decoration: none;
            background-color: #4d285b;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        .back-link:hover {
            background-color: #9610c7;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Submit Student Information</h1>
    <form action="student-servlet" method="post">
        <label for="name">Student Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter full name" required aria-label="Student Name">

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" placeholder="Enter age" required aria-label="Age" min="18" max="30">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter email address" required aria-label="Email">

        <input type="submit" value="Submit">
    </form>

    <div class="footer">
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
