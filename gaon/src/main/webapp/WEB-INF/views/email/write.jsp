<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	<h2>이메일 보내기</h2>
	<form method="POST" action="${path}/email/send">
		발신자 이름 : <input name="senderName"><br>
		발신자 이메일 주소 : <input name="senderMail"><br>
		수신자 이메일 주소 : <input name="receiveMail" value="pseonmi0325@gmail.com"><br>
		제목 : <input name="subject"><br>
		내용 : <textarea rows="5" cols="80" name="message"></textarea><br>
		<input type="submit" value="전송">
	</form>
	<span style="color:red;">${message}</span>
	<%@include file="../include/footer.jsp" %>
</body>
</html>