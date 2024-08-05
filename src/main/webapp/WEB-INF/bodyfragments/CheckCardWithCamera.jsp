<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real-time OCR with Camera</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0;
	padding: 20px;
}

video {
	border: 1px solid black;
}

#output {
	margin-top: 20px;
	font-size: 20px;
	color: blue;
}
</style>
</head>
<body>
	<h1>Real-time OCR with Camera using Azure AI Vision</h1>
	<video id="video" width="640" height="480" autoplay></video>
	<canvas id="canvas" width="640" height="480" style="display: none;"></canvas>
	<p id="output">Loading camera...</p>
	<c:if test="${not empty listANNB}">
		<script>
            var knownIds = [];
            <c:forEach var="annb" items="${listANNB}">
                knownIds.push("${annb.id}");
            </c:forEach>
        </script>
	</c:if>
	<script>
        var video = document.getElementById('video');
        var canvas = document.getElementById('canvas');
        var context = canvas.getContext('2d');
        var output = document.getElementById('output');

        var subscriptionKey = 'eb228cbab6aa4693ac9d34eb563fd0b1';
        var endpoint = 'https://dhaocrvdh1.cognitiveservices.azure.com/';
        var ocrUrl = endpoint + 'vision/v3.2/ocr';

        // Lấy quyền truy cập camera
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function (stream) {
                    video.srcObject = stream;
                    video.play();
                })
                .catch(function (err) {
                    console.error("Error accessing camera: ", err);
                    output.innerText = 'Không thể truy cập camera: ' + err.message;
                });
        }

        // Hàm để gửi ảnh đến Azure AI Vision và thực hiện OCR
        function performOCR(imageData) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", ocrUrl, true);
            xhr.setRequestHeader("Ocp-Apim-Subscription-Key", subscriptionKey);
            xhr.setRequestHeader("Content-Type", "application/octet-stream");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var data = JSON.parse(xhr.responseText);
                        var text = '';
                        var id = '';
                        data.regions.forEach(function (region) {
                            region.lines.forEach(function (line) {
                                line.words.forEach(function (word) {
                                    if (/\d/.test(word.text)) {
                                        if (word.text.includes("VDH.")) {
                                            id = word.text.split(".")[1].replace(/^0+/, ''); // Tách phần sau "VDH." và loại bỏ các số 0 đầu
                                        }
                                    }
                                });
                            });
                        });

                        if (id) {
                            output.innerText = 'ID found: ' + id;
                            // So sánh ID với danh sách ID đã biết
                            if (knownIds.indexOf(id) !== -1) {
                                output.innerText += " - ID còn hạn";
                            } else {
                                output.innerText += " - ID is not valid";
                            }
                        } else {
                            output.innerText = 'Vui lòng đưa thẻ vào khung';
                        }
                    } else {
                        console.error("Error during OCR: ", xhr.responseText);
                        output.innerText = 'Đã xảy ra lỗi khi OCR: ' + xhr.responseText;
                    }
                }
            };

            xhr.send(imageData);
        }

        // Chụp hình từ video và thực hiện OCR mỗi 7 giây
        setInterval(function () {
            context.drawImage(video, 0, 0, canvas.width, canvas.height);
            canvas.toBlob(function (blob) {
                performOCR(blob);
            }, 'image/jpeg');
        }, 500);
    </script>
</body>
</html>