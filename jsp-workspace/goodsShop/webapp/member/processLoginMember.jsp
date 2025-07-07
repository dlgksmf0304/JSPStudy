<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String m_id = request.getParameter("m_id");
	String m_password = request.getParameter("m_password");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.111.101:3306/goodsdb"
	driver="com.mysql.jdbc.Driver" user="goods" password="goods1234" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE m_id=? and m_password=?  
   <sql:param value="<%=m_id%>" />
	<sql:param value="<%=m_password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", m_id);
	%>
	<c:redirect url="resultMember.jsp?msg=2" />
</c:forEach>

<c:redirect url="loginMember.jsp?error=1" />