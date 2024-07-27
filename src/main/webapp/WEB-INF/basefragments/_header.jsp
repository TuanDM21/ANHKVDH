<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
    type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
    rel="stylesheet">
<style>
body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
}

.topnav {
    overflow: hidden;
    background-color: #333;
}

.topnav a {
    float: left;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

.topnav a:hover {
    background-color: #ddd;
    color: black;
}

.topnav a.active {
    background-color: #04AA6D;
    color: white;
}

.topnav .right {
    float: right;
}

.topnav .right span, .topnav .right a {
    float: none;
    display: inline-block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

.topnav .right a:hover {
    background-color: #ddd;
    color: black;
}
</style>
</head>
<body>
    <c:if test="${not empty sessionScope.loggedInUser}">
        <div class="topnav">
            <a href="home-page">Home</a>
            <a href="Add-New-Card">Add New Card</a>
            <a href="View-All-Card">All Card</a>
            <a href="Check-Card">Check Card</a>
            <div class="right">
                <span id="welcomeMessage">Hello, ${sessionScope.loggedInUser}</span>
                <a href="logout">Logout</a>
            </div>
        </div>
    </c:if>

    <script>
    document.querySelectorAll('.topnav a').forEach(link => {
        link.addEventListener('click', function(event) {
            document.querySelectorAll('.topnav a').forEach(item => {
                item.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
    </script>
</body>
</html>
