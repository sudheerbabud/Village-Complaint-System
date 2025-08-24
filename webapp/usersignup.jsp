<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Signup</title>
   <style>
    .top-banner {
    width: 110%;              
    background-color: royalblue;  
    color: white;
    font-weight: bold;
    font-size: 24px;          
    padding: 12px 0;        
    overflow: hidden;
    white-space: nowrap;
    box-sizing: border-box;
    position: fixed;          
    top: 0;
    left: -5%;               
    z-index: 1000;
}

/* scrolling text animation */
.top-banner span {
    display: inline-block;
    padding-left: 100%; /* start from right */
    animation: scroll 15s linear infinite;
}

@keyframes scroll {
    0% { transform: translateX(0); }
    100% { transform: translateX(-100%); }
}
   
        body {
            font-family: Arial, sans-serif;
            background-color: #bde18e; /* lighter aqua gradient */
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            color: #333;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 320px; /* slightly smaller */
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px;
            color: #006064;
        }

        label {
            display: block;
            margin-top: 6px;
            font-weight: bold;
            font-size: 12px;
            color: #004d40;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 6px;
            margin-top: 3px;
            border-radius: 5px;
            border: 1px solid #aaa;
            outline: none;
            font-size: 12px;
            background-color: #fff;
        }

        input[type="submit"] {
            background: #00acc1;
            color: white;
            padding: 6px;              /* smaller height */
            border: none;
            width: 80%;                /* smaller width */
            border-radius: 5px;
            margin: 12px auto 0;
            display: block;
            cursor: pointer;
            font-weight: bold;
            font-size: 12px;           /* smaller text */
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #00838f;
        }

        p {
            text-align: center;
            margin-top: 10px;
            font-size: 12px;
            color: #006064;
        }

        a {
            color: #006064;
            font-weight: bold;
            text-decoration: none;
        }

        /* Button-like anchor for Home */
        .home-btn {
            display: block;
            width: 80%;                /* smaller width */
            text-align: center;
            background: #e53935;
            color: white;
            padding: 6px;              /* smaller height */
            border-radius: 5px;
            margin: 10px auto 0;
            font-size: 12px;           /* smaller text */
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .home-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>

<div class="top-banner">
    <span>Village - Complaint Management</span>
</div>
    <div class="container">
        <h2>User Signup</h2>
        
        <form action="usersignup" method="post">
 
            
            <label for="email">Email :</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password :</label>
            <input type="password" name="password" placeholder="Enter your password" required>

            <input type="submit" value="Signup">
        </form>
        <p>Already have an account? <a href="userlogin.jsp">Login</a></p>
        
         <a href="index.html" class="home-btn">Back to Home</a>
    </div>

</body>
</html>
