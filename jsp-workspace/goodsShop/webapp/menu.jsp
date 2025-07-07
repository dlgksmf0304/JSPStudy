<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>

<header class="pb-3 mb-4 border-bottom">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-between">
			<a href="${pageContext.request.contextPath}/index.jsp"
				class="d-flex align-items-center mb-3 mb-md-0 text-dark text-decoration-none">
				<svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
					<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
				</svg>
				<span class="fs-4 ms-2">Home</span>
			</a>

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
						data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="#!">All Products</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="#!">Popular Items</a></li>
									<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
								</ul>
							</li>
						</ul>

						<!-- 로그인/회원 메뉴 + 카트 -->
						<div class="d-flex align-items-center gap-3">
							<ul class="navbar-nav d-flex align-items-center mb-2 mb-lg-0">
								<c:choose>
									<c:when test="${empty sessionId}">
										<li class="nav-item">
											<a class="nav-link" href="<c:url value='/member/loginMember.jsp'/>">로그인</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="<c:url value='/member/addMember.jsp'/>">회원가입</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="nav-item">
											<span class="nav-link">[<%=sessionId%>님]</span>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="<c:url value='/member/logoutMember.jsp'/>">로그아웃</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="<c:url value='/member/updateMember.jsp'/>">회원수정</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>

							<!-- 🛒 Cart 버튼 -->
							<form class="d-flex">
								<button class="btn btn-outline-dark" type="submit">
									<i class="bi-cart-fill me-1"></i>
									Cart
									<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
								</button>
							</form>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
</header>
