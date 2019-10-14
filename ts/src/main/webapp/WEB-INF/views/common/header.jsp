<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<!-- Header Container
================================================== -->

<!-- Sign In Popup 
================================================== -->
<%@include file="/WEB-INF/views/common/loginpop.jsp"%>

<header id="header-container">	
	<!-- Header -->
	<div id="header">
		<div class="container">
			
			<!-- Left Side Content -->
			<div class="left-side">

				<!-- Logo -->
				<div id="logo">
					<a href="/main"><img src="${contextPath}/resources/images/logo.png" alt=""></a>
				</div>

				<!-- Mobile Navigation -->
				<div class="mmenu-trigger">
					<button class="hamburger hamburger--collapse" type="button">
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</button>
				</div>

				<!-- Main Navigation -->
				<nav id="navigation" class="style-1">
					<ul id="responsive">
						<!-- Categories -->

						<!-- <li><a href="#">Categories</a>
							<ul>
								<li><a href="#">프로그래밍</a>
									<ul>
										<li><a href="#">웹/앱</a></li>
										<li><a href="#">클라우드</a></li>
										<li><a href="#">코딩</a></li>
									</ul>
								</li>
								<li><a href="#">뷰티</a>
									<ul>
										<li><a href="#">뷰티</a></li>
										<li><a href="#">커스텀</a></li>
										<li><a href="#">의류</a></li>
									</ul>
								</li>
							</ul>
						</li> -->
						<!--- Categories / End -->

						<!-- only login view -->
						<c:if test="${not empty login}">
							<!-- user Profile -->
							<li><a href="/user/profile/${login.user_id}">User Profile</a></li>
							<!-- user Profile / End -->

						</c:if>
						<!-- only login view -->
						
					</ul>
				</nav>
				<div class="clearfix"></div>
				<!-- Main Navigation / End -->

			</div>
			<!-- Left Side Content / End -->
	
			<!-- login Form -->
			<c:choose>
				<c:when test="${empty login}">
					<div class="right-side">
						<div class="header-widget">
							<a href="#sign-in-dialog" class="sign-in popup-with-zoom-anim"><i class="sl sl-icon-login"></i>Sign In</a>
						</div>
					</div>
				</c:when>
				<c:when test="${not empty login}">
					<form action="/user/logout" method="post">
						<div class="main-right-side margin-top-15">
							<button class="button medium border"><i class="sl sl-icon-logout"></i>logout</a></button>
						</div>
					</form>
				</c:when>
			</c:choose>
			<!-- login Form / End -->
			<c:if test="${userVO.user_auth == 2}">
				<!-- 강의 등록 -->
				<form action="/lecture/insert" method="POST">
					<input hidden name="user_id" value="${userVO.user_id}" />
					<div class="main-right-side">
						<button class="button medium border"><i class="sl sl-icon-pencil"></i>강의 등록</a></button>
					</div>
				</form>
				<!-- 강의 등록/  End -->
			</c:if>
		</div>
	</div>
	<!-- Header / End -->
</header>
<!-- Header Container / End -->
