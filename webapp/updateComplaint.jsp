<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Complaint</title>
    <style>
        .top-banner {
            width: 110%;
            background-color: royalblue;
            color: white;
            font-weight: bold;
            font-size: 20px;
            padding: 10px 0;
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
            position: fixed;
            top: 0;
            left: -5%;
            z-index: 1000;
        }
        .top-banner span {
            display: inline-block;
            padding-left: 100%;
            animation: scroll 15s linear infinite;
        }
        @keyframes scroll {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #bde18e;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            color: #333;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            width: 95%;
            max-width: 700px;
        }
        h2 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 16px;
            color: #006064;
        }
        label {
            display: block;
            margin-top: 6px;
            font-weight: bold;
            font-size: 12px;
            color: #004d40;
        }
        input, textarea, select {
            width: 100%;
            padding: 6px;
            margin-top: 3px;
            border-radius: 5px;
            border: 1px solid #aaa;
            outline: none;
            font-size: 12px;
            background-color: #fff;
        }
        textarea {
            resize: vertical;
            min-height: 60px;
        }
        button {
            background: #00acc1;
            color: white;
            padding: 6px;
            border: none;
            width: 100%;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            font-weight: bold;
            font-size: 12px;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #00838f;
        }
        /* Two-column layout */
        .form-row {
            display: flex;
            gap: 20px;
            justify-content: space-between;
        }
        .form-box {
            flex: 1;
            background: #f7f7f7;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .back-btn {
            display: block;
            width: 20%;
            text-align: center;
            background: #e53935;
            color: white;
            padding: 6px;
            border-radius: 5px;
            margin: 15px auto 0;
            font-size: 12px;
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s ease;
        }
        .back-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>
    <div class="top-banner">
        <span>Village - Complaint Management</span>
    </div>

    <div class="form-container">
        <div class="form-row">
            <!-- Update Complaint -->
            <div class="form-box">
                <h2>Update Complaint</h2>
                <form action="updateComplaint" method="post">
                    <label>Complaint ID:</label>
                    <input type="text" name="complaintid" required>

                    <label>New Complaint Text:</label>
                    <textarea name="complaint" placeholder="Enter new complaint only if updating"></textarea>

                    <label>Action:</label>
                    <select name="action" required>
                        <option value="update">Update</option>
                    </select>

                    <button type="submit">Submit</button>
                </form>
            </div>

            <!-- Delete Complaint -->
            <div class="form-box">
                <h2>Delete Complaint</h2>
                <form action="updateComplaint" method="post">
                    <label>Complaint ID:</label>
                    <input type="text" name="complaintid" required>
                    <label>Action:</label>
                    <select name="action" required>
                        <option value="delete">Delete</option>
                    </select>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>

        <a href="userDashboard.jsp" class="back-btn">Back to Dashboard</a>
    </div>
</body>
</html>
