<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin danh sách cấp thẻ</title>
<link rel="shortcut icon" href="img/LogoACV.png" type="image/x-icon">
<style>
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

	// Hàm tạo và tải tệp Excel sử dụng ArrayBuffer
	function exportToExcel() {
		var indexOfEditColumn = 2; // Chỉ số của cột sửa trong bảng (0 là cột đầu tiên)
		var indexOfDeleteColumn = 3; // Chỉ số của cột xoá trong bảng

		// Lấy header từ bảng
		var header = [];
		$('#dataTable th').each(function() {
			header.push($(this).text());
		});

		// Lấy data từ bảng, loại bỏ các cột sửa và xoá
		var data = [];
		$('#dataTable tbody tr').each(
				function() {
					var rowData = [];
					$(this).find('td').each(
							function(index) {
								// Loại bỏ cột sửa và xoá (thay thế index bằng các chỉ số cột mà bạn muốn bỏ)
								if (index !== indexOfEditColumn
										&& index !== indexOfDeleteColumn) {
									rowData.push($(this).text());
								}
							});
					data.push(rowData);
				});

		// Tạo workbook Excel
		var ws = XLSX.utils.aoa_to_sheet([ header ].concat(data));
		var wb = XLSX.utils.book_new();
		XLSX.utils.book_append_sheet(wb, ws, "Data");

		// Tạo ArrayBuffer từ workbook Excel
		var arrayBuffer = XLSX.write(wb, {
			bookType : 'xlsx',
			type : 'array'
		});

		// Tạo tên tệp Excel và tải về
		var blob = new Blob(
				[ arrayBuffer ],
				{
					type : 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
				});
		var url = URL.createObjectURL(blob);

		var a = document.createElement('a');
		a.style.display = 'none';
		a.href = url;
		a.download = 'data.xlsx';
		document.body.appendChild(a);
		a.click();

		URL.revokeObjectURL(url);
	}
</script>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.4/xlsx.full.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<%
	if (request.getAttribute("successMessage") != null) {
	%>
	<div id="snackbar">${successMessage}</div>
	<%
	}
	%>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Quản lý danh sách cấp thẻ</h1>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" style="float: left;">Thẻ
					an ninh</h6>
				<div style="float: right;">
					<i class='fas fa-file-export' style='font-size: 30px'
						id="exportExcelBtn" onclick="exportToExcel()"></i>

				</div>
				<div style="clear: both;"></div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Họ và tên</th>
								<th>Năm sinh</th>
								<th>Giới tính</th>
								<th>Ngày cấp thẻ</th>
								<th>Ngày hết hạn</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listANNB}" var="c">
								<tr>
									<td scope="row">${c.id}</td>
									<td>${c.hoTen}</td>
									<td>${c.ngaySinh}</td>
									<td>${c.gioiTinh}</td>
									<td>${c.ngayCapThe}</td>
									<td>${c.ngayHetHanThe}</td>
									<td><a
										href="${pageContext.request.contextPath}/Edit-Card?id=${c.id}&name=${c.hoTen}&birthday=${c.ngaySinh}&gender=${c.gioiTinh}&ngaycap=${c.ngayCapThe}&ngayhethan=${c.ngayHetHanThe}"
										type="button" class="btn btn-primary">Sửa</a> <a href="#"
										onclick="return showDeleteConfirmation('${c.id}')"
										type="button" class="btn btn-danger">Xoá</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<script>
				function showDeleteConfirmation(id) {
					// Hiển thị dialog xác nhận khi nhấn nút "Xóa"
					var isConfirmed = confirm("Bạn có chắc muốn xóa bản ghi thẻ này?");

					// Nếu người dùng chọn OK, tiếp tục chuyển hướng đến trang xóa
					if (isConfirmed) {
						console.log(id);
						window.location.href = `${pageContext.request.contextPath}/Delete-Card?id=`
								+ id;
					}

					// Trả về false để không thực hiện hành động mặc định của thẻ <a>
					return false;
				}
			</script>
</body>
</html>
