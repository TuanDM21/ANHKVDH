<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm thẻ mới</title>
<link rel="shortcut icon" href="img/LogoACV.png" type="image/x-icon">
<style>
/* CSS cho popup snackbar */
#snackbar {
	visibility: hidden;
	min-width: 250px;
	margin-left: 0px;
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
-webkit-keyframes fadein {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {from { bottom:30px;
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
	<%
	if (request.getAttribute("errorMessage") != null) {
	%>
	<div id="snackbar">${errorMessage}</div>
	<%
	}
	%>
	<div class="container-fluid">
		<h1>Thêm thẻ an ninh</h1>
		<form action="add-category" method="post" id="form-add-annb">
			<div class="mb-3">
				<label for="ID" class="form-label">ID</label> <input type="text"
					class="form-control" id="ID" name="ID" placeholder="Nhập ID: ">
				<span class="form-message" style="color: red"></span>
			</div>

			<div class="mb-3">
				<label for="ID" class="form-label">Họ tên</label> <input type="text"
					class="form-control" id="name" name="name"
					placeholder="Nhập họ tên: "> <span class="form-message"
					style="color: red"></span>
			</div>
			<div class="mb-3">
				<label for="ID" class="form-label">Ngày tháng năm sinh: </label> <input
					type="date" class="form-control" id="birthday" name="birthday"
					placeholder="Nhập ngày tháng năm sinh: "> <span
					class="form-message" style="color: red"></span>
			</div>
			<div class="mb-3">
				<label for="ID" class="form-label">Giới tính</label> <input
					type="text" class="form-control" id="gender" name="gender"
					placeholder="Nhập giới tính: "> <span class="form-message"
					style="color: red"></span>
			</div>
			<div class="mb-3">
				<label for="ID" class="form-label">Ngày cấp thẻ: </label> <input
					type="date" class="form-control" id="ngaycap" name="ngaycap">
				<span class="form-message" style="color: red"></span>
			</div>
			<div class="mb-3">
				<label for="ID" class="form-label">Ngày hết hạn thẻ: </label> <input
					type="date" class="form-control" id="ngayhethan" name="ngayhethan">
				<span class="form-message" style="color: red"></span>
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<script src="js/Validator.js"></script>
	<script type="text/javascript">
		Validator({
			form : '#form-add-annb',
			errorSelector : '.form-message',
			rules : [ Validator.isRequired('#ID'),
					Validator.isRequired('#name'),
					Validator.isRequired('#birthday'),
					Validator.isRequired('#name'),
					Validator.isRequired('#gender'),
					Validator.isRequired('#ngaycap'),
					Validator.isRequired('#ngayhethan'), ],
		});
	</script>

</body>
</html>
