<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean04.jsp</title>
</head>
<body>

	<jsp:useBean id = "person" class = "dao.Person" scope = "request"/>
	<p> 아이디 : <%=person.getId()%>
	<p> 이 름 : <%=person.getName() %>
	<%
	
		person.setId(20230824);
		person.setName("홍길동");
	
	%>
	
	<jsp:include page = "useBean03.jsp"/>



</body>
</html>