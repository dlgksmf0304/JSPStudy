<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="loginForm" action="j_security_check" method="post">
		<p> 사용자명 : <input type="text" name="j_username">
		<p> 사용자명 : <input type="password" name="j_password">
		<p> <input type="submit" value="전송">
	
	</form>


</body>
</html>