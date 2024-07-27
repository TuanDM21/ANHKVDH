<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kiểm tra thẻ</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<h2>Kiểm tra thẻ</h2>
		<form action="Check-Card" method="post" class="form-inline">
			<div class="form-group mb-2">
				<label for="id" class="sr-only">ID Thẻ</label> <input type="number"
					class="form-control" id="id" name="id" placeholder="Nhập ID thẻ"
					required>
			</div>
			<button type="submit" class="btn btn-primary mb-2">Kiểm tra</button>
		</form>
		<c:if test="${not empty message}">
			<div class="alert alert-info mt-3">${message}</div>
		</c:if>
		<c:if test="${not empty annb}">
			<div class="mt-3">
				<h3>Thông tin thẻ</h3>
				<p>ID: ${annb.id}</p>
				<p>Họ tên: ${annb.hoTen}</p>
				<p>Ngày sinh: ${annb.ngaySinh}</p>
				<p>Giới tính: ${annb.gioiTinh}</p>
				<p>Ngày cấp thẻ: ${annb.ngayCapThe}</p>
				<p>Ngày hết hạn thẻ: ${annb.ngayHetHanThe}</p>
			</div>
		</c:if>
	</div>
</body>
</html>
