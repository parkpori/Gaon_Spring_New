<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.email_section {
		margin: 80px auto;
		width: 800px;
		min-width: 800px;
	}
	.email_title {
		margin-bottom: 30px;
	}
	.email_span {
		display: inline-block;
		width: 125px;
	}
	.email_box {
		height: 30px;
	}
	.email_box input {
		width: 300px;
		height: 100%;
	}
</style>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	<div class="email_section">
		<h2 class="email_title">이메일 보내기</h2>
		<form method="POST" action="${path}/email/send">
			<div class="email_box">
				<span class="email_span">발신자 이름</span><input name="senderName"><br>
			</div>
			<div class="email_box">
				<span class="email_span">발신자 이메일 주소</span><input name="senderMail"><br>
			</div>
			<div class="email_box">
				<span class="email_span">수신자 이메일 주소</span><input name="receiveMail" value="pseonmi0325@gmail.com"><br>
			</div>
			<div class="email_box">
				<span class="email_span">제목</span><input name="subject"><br>
			</div>
			<div class="email_box">
				<span class="email_span">내용</span>
			</div>
			<textarea rows="5" cols="80" name="message"></textarea><br>
			<input type="submit" value="전송">
		</form>
		<span style="color:red;">${message}</span>
	</div>
	<%@include file="../include/footer.jsp" %>
</body>
</html>