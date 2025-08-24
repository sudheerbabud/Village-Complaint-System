<%@ page session="true"%>
<%
String successMsg = (String) session.getAttribute("successMessage");
String errorMsg = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Complaint</title>
<style>
/* Top banner */
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

/* Page background */
body {
    font-family: Arial, sans-serif;
    background-color: #bde18e;   /* light green */
    margin: 0;
    padding: 0;
    display: flex;
    height: 100vh;
    align-items: center;
    justify-content: center;
    color: #333;
}

/* Form container */
.form-container {
    background: rgba(255, 255, 255, 0.9);
    padding: 25px 30px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    width: 90%;
    max-width: 320px;
    margin-top: 60px; /* to avoid banner overlap */
}

h2 {
    text-align: center;
    margin-bottom: 15px;
    font-size: 18px;
    color: #006064;
}

/* Labels and inputs */
label {
    display: block;
    margin-top: 6px;
    font-weight: bold;
    font-size: 12px;
    color: #004d40;
}

input, textarea {
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

/* Buttons */
button {
    background: #00acc1;
    color: white;
    padding: 6px;
    border: none;
    width: 80%;
    border-radius: 5px;
    margin: 12px auto 0;
    display: block;
    cursor: pointer;
    font-weight: bold;
    font-size: 12px;
    transition: background 0.3s ease;
}
button:hover {
    background: #00838f;
}

/* Back button */
.back-btn {
    display: block;
    width: 80%;
    text-align: center;
    background: #e53935;
    color: white;
    padding: 6px;
    border-radius: 5px;
    margin: 10px auto 0;
    font-size: 12px;
    font-weight: bold;
    text-decoration: none;
    transition: background 0.3s ease;
}
.back-btn:hover {
    background: #b71c1c;
}

/* Messages */
.message-success {
    color: green;
    text-align: center;
    font-weight: bold;
    margin-bottom: 10px;
}
.message-error {
    color: red;
    text-align: center;
    font-weight: bold;
    margin-bottom: 10px;
}
</style>
</head>
<body>

<div class="top-banner">
    <span>Village - Complaint Management</span>
</div>

<div class="form-container">
    <h2>Complaint Form</h2>

    <% if (successMsg != null) { %>
        <div class="message-success"><%= successMsg %></div>
        <% session.removeAttribute("successMessage"); %>
    <% } %>

    <% if (errorMsg != null) { %>
        <div class="message-error"><%= errorMsg %></div>
    <% } %>

    <form action="submitComplaint" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="flatNumber">Flat Number:</label>
        <input type="number" id="flatNumber" name="flatNumber" required>

        <label for="complaint">Complaint:</label>
        <textarea id="complaint" name="complaint" required></textarea>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>

        <button type="submit">Submit</button>
    </form>

    <a href="userDashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>

</body>
</html>
