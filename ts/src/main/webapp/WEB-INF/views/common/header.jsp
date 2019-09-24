<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
<!-- Header Container
================================================== -->
<header id="header-container">

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

						<li><a href="#">User Board</a>
						</li>

						<li><a href="#">User Profile</a>
						</li>
						
					</ul>
				</nav>
				<div class="clearfix"></div>
				<!-- Main Navigation / End -->
				
			</div>
			<!-- Left Side Content / End -->

		<c:if test="${empty login}">
			<!-- Right Side Content / End -->
			<div class="right-side">
				<div class="header-widget">
					<a href="#sign-in-dialog" class="sign-in popup-with-zoom-anim" id="sign-in"><i class="sl sl-icon-login"></i> Sign In</a>
				</div>
			</div>
			<!-- Right Side Content / End -->
			
			<!-- Sign In Popup -->
			<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
				<div class="small-dialog-header">
					<h3>로그인</h3>
				</div>
				<!--Tabs -->
				<div class="sign-in-form style-1">

					<ul class="tabs-nav">
						<li class=""><a href="#tab1">Log In</a></li>
						<li><a href="#tab2">Register</a></li>
					</ul>

					<div class="tabs-container alt">

						<!-- Login -->
						<div class="tab-content" id="tab1" style="display: none;">
							<form action="/user/loginPost" method="POST">
								<p class="form-row form-row-wide">
									<label for="username">Username:
										<i class="im im-icon-Male"></i>
										<input type="text" class="input-text" name="user_id" id="user_id" value="" />
									</label>
								</p>

								<p class="form-row form-row-wide">
									<label for="password">Password:
										<i class="im im-icon-Lock-2"></i>
										<input class="input-text" type="password" name="user_pw" id="user_pw"/>
									</label>
									<span class="lost_password">
										<a href="#" >Lost Your Password?</a>
									</span>
								</p>

								<div class="form-row">
									<input type="submit" class="button border margin-top-5" value="Login" id="login"/>
									<div class="checkboxes margin-top-10">
										<input id="remember-me" type="checkbox" name="useCookie">
										<label for="remember-me">Remember Me</label>
									</div>
								</div>
							</form>
						</div>
						

						<!-- Register -->
						<div class="tab-content" id="tab2" style="display: none;">

							<form method="post" class="register">
								
							<p class="form-row form-row-wide">
								<label for="username2">Username:
									<i class="im im-icon-Male"></i>
									<input type="text" class="input-text" name="username" id="username2" value="" />
								</label>
							</p>
								
							<p class="form-row form-row-wide">
								<label for="email2">Email Address:
									<i class="im im-icon-Mail"></i>
									<input type="text" class="input-text" name="email" id="email2" value="" />
								</label>
							</p>

							<p class="form-row form-row-wide">
								<label for="password1">Password:
									<i class="im im-icon-Lock-2"></i>
									<input class="input-text" type="password" name="password1" id="password1"/>
								</label>
							</p>

							<p class="form-row form-row-wide">
								<label for="password2">Repeat Password:
									<i class="im im-icon-Lock-2"></i>
									<input class="input-text" type="password" name="password2" id="password2"/>
								</label>
							</p>

							<input type="submit" class="button border fw margin-top-10" name="register" value="Register" />
	
							</form>
						</div>

					</div>
				</div>
			</div>
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
</body>
<script>
	var msg = "${msg}";
	if(msg.length > 0){
		window.alert(msg);
	}
		
</script>