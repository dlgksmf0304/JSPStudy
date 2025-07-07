<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.111.101:3306/goodsDB"
	driver="com.mysql.jdbc.Driver" user="goods" password="goods1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE m_id = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>

<c:if test="${resultSet >= 1}">
	<c:import url="logoutMember.jsp" />
	<c:redirect url="resultMember.jsp?msg=3" />
</c:if>
