<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập hệ thống</title>
<link rel="shortcut icon" href="img/LogoACV.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/LoginCss.css" rel="stylesheet" type="text/css">
<style>
#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #4CAF50;
    color: white;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
    color: white;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {
    from {bottom: 0;
    opacity: 0;
}

to {
    bottom: 30px;
    opacity: 1;
}

}
@
keyframes fadein {
    from {bottom: 0;
    opacity: 0;
}

to {
    bottom: 30px;
    opacity: 1;
}

}
@
-webkit-keyframes fadeout {
    from {bottom: 30px;
    opacity: 1;
}

to {
    bottom: 0;
    opacity: 0;
}

}
@
keyframes fadeout {
    from {bottom: 30px;
    opacity: 1;
}

to {
    bottom: 0;
    opacity: 0;
}
}
</style>
<script>
    // Hiển thị pop-up khi trang được load
    window.onload = function() {
        var x = document.getElementById("snackbar");
        x.className = "show";
        setTimeout(function() {
            x.className = x.className.replace("show", "");
        }, 3000);
    };
</script>
</head>
<body>
    <c:if test="${not empty errorMessage}">
        <div id="snackbar">${errorMessage}</div>
    </c:if>
    <div class="wrapper">
        <div class="logo">
            <img src="img/LogoACV.png" alt="LogoACV">
        </div>
        <div class="text-center mt-4 name">Đồng Hới Airport</div>
        <form class="p-3 mt-3" action="login" method="post">
            <div class="form-field d-flex align-items-center">
                <span class="far fa-user"></span> <input type="text" name="userName"
                    id="userName" placeholder="UserName" required>
            </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span> <input type="password"
                    name="password" id="pwd" placeholder="Password" required>
            </div>
            <button class="btn mt-3">Login</button>
        </form>
    </div>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="js/Validator.js"></script>
</body>
</html>
