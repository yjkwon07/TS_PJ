<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>

<!-- Header Container
================================================== -->
<header id="header-container">
	<!-- Sign In Popup -->
	<%@include file="/WEB-INF/views/common/loginpop.jsp"%>

	<!-- Header -->
	<div id="header">
		<div class="container">

			<!-- Left Side Content -->
			<div class="left-side">

				<!-- Logo -->
				<div id="logo">
					<a href="/"><img src="${contextPath}/resources/images/logo.png" alt=""></a>
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

						<li><a href="#">Categories</a>
							<ul>
								<li><a href="#">프로그래밍</a>
									<ul>
										<li><a href="listings-list-with-sidebar.html">웹/앱</a></li>
										<li><a href="listings-list-full-width.html">클라우드</a></li>
										<li><a href="listings-list-full-width-with-map.html">코딩</a></li>
									</ul>
								</li>
								<li><a href="#">뷰티</a>
									<ul>
										<li><a href="listings-grid-with-sidebar-1.html">뷰티</a></li>
										<li><a href="listings-grid-with-sidebar-2.html">커스텀</a></li>
										<li><a href="listings-grid-full-width.html">의류</a></li>
									</ul>
								</li>
								<li><a href="#">Half Screen Map</a>
									<ul>
										<li><a href="listings-half-screen-map-list.html">List Layout</a></li>
										<li><a href="listings-half-screen-map-grid-1.html">Grid Layout 1</a></li>
										<li><a href="listings-half-screen-map-grid-2.html">Grid Layout 2</a></li>
									</ul>
								</li>
								<li><a href="listings-single-page.html">Single Listing 1</a></li>
								<li><a href="listings-single-page-2.html">Single Listing 2</a></li>
							</ul>
						</li>

						<li><a href="#">User Profile</a>
						</li>

					</ul>
				</nav>
				<div class="clearfix"></div>
				<!-- Main Navigation / End -->

			</div>
			<!-- Left Side Content / End -->

			<form action="/test/classinsert" method="POST">
				<input hidden name="user_id" value="${userVO.user_id}" />
				<input type="submit" value="강의 등록 ">
				
			</form>
			<c:if test="${empty login}">
				<!-- Right Side Content / End -->
				<div class="right-side">
					<div class="header-widget">
						<a href="#sign-in-dialog" class="sign-in popup-with-zoom-anim"><i class="sl sl-icon-login"></i>
							Sign In</a>
					</div>
				</div>
				<!-- Right Side Content / End -->


			</c:if>

			<c:if test="${not empty login}">
				<form action="/user/logout" method="post">
					<div class="right-side">
						<div class="header-widget">
							<button type="submit"><i class="sl sl-icon-login"></i>로그아웃</button>
						</div>
					</div>
				</form>
			</c:if>
			<!-- Sign In Popup / End -->

		</div>
	</div>
	<!-- Header / End -->
</header>
<div class="clearfix"></div>
<!-- Header Container / End -->
