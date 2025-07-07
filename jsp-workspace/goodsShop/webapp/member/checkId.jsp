<%@ page contentType="text/plain; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
    String checkId = request.getParameter("m_id");
%>

<sql:setDataSource var="dataSource"
    url="jdbc:mysql://192.168.111.101:3306/goodsDB"
    driver="com.mysql.jdbc.Driver" user="goods" password="goods1234" />

<sql:query dataSource="${dataSource}" var="result">
    SELECT COUNT(*) AS cnt FROM member WHERE m_id = ?
    <sql:param value="${param.m_id}" />
</sql:query>

<c:choose>
    <c:when test="${result.rows[0].cnt > 0}">
        이미 사용중인 아이디 입니다.
    </c:when>
    <c:otherwise>
        사용 가능한 아이디 입니다.
    </c:otherwise>
</c:choose>
