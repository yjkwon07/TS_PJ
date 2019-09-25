<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<body>

	<!-- Titlebar
================================================== -->
	<div id="titlebar" class="gradient">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>${lectureVO.class_name}</h2><span>${lectureVO.class_content}</span>
				</div>
			</div>
		</div>
	</div>


	<!-- Content
================================================== -->
	<div class="container">

		<!-- Blog Posts -->
		<div class="blog-page">
			<div class="row">


				<!-- Post Content -->
				<div class="col-lg-9 col-md-8 padding-right-30">


					<!-- Blog Post -->
					<div class="blog-post single-post">

						<!-- Img -->
						<img class="post-img" src="${contextPath}/resources/images/blog-post-02.jpg" alt="">


						<!-- Content -->
						<div class="post-content">

							<h3>${lectureVO.class_name}</h3>

							<p>${lectureVO.class_content}</p>

							<!-- Share Buttons -->
							<ul class="share-buttons margin-top-40 margin-bottom-0">
								<li><a class="fb-share" href="#"><i class="fa fa-facebook"></i> Share</a></li>
								<li><a class="twitter-share" href="#"><i class="fa fa-twitter"></i> Tweet</a></li>
								<li><a class="gplus-share" href="#"><i class="fa fa-google-plus"></i> Share</a></li>
								<li><a class="pinterest-share" href="#"><i class="fa fa-pinterest-p"></i> Pin</a></li>
							</ul>
							<div class="clearfix"></div>

						</div>
					</div>
					<!-- Blog Post / End -->

					<!-- Map
================================================== -->
					<div id="map-container" class="fullwidth-home-map">

						<div id="map" data-map-zoom="9">
							<!-- map goes here -->
						</div>

						<div class="main-search-inner">

							<div class="container">

							</div>

						</div>

						<!-- Scroll Enabling Button -->
						<a href="#" id="scrollEnabling" title="Enable or disable scrolling on map">Enable Scrolling</a>
					</div>
					<!-- About Author -->
					<div class="about-author">
						<img src="${contextPath}/resources/images/user-avatar.jpg" alt="" />
						<div class="about-description">
							<h4>${lectureVO.class_teacher_name}</h4>
							<a href="${userVO.user_youtube}">${userVO.user_youtube}</a>
							<p>${userVO.user_status}</p>
						</div>
					</div>


					<!-- Related Posts -->
					<div class="clearfix"></div>
					<h4 class="headline margin-top-25">다른 강좌들</h4>
					<div class="row">

						<!-- Blog Post Item -->
						<div class="col-md-6">
							<a href="#" class="blog-compact-item-container">
								<div class="blog-compact-item">
									<img src="${contextPath}/resources/images/blog-compact-post-01.jpg" alt="">
									<span class="blog-item-tag">Tips</span>
									<div class="blog-compact-item-content">
										<ul class="blog-post-tags">
											<li>22 August 2017</li>
										</ul>
										<h3>케라스 뿌시기</h3>
										<p>Sed sed tristique nibh iam porta volutpat finibus. Donec in aliquet urneget
											mattis lorem. Pellentesque pellentesque.</p>
									</div>
								</div>
							</a>
						</div>
						<!-- Blog post Item / End -->

						<!-- Blog Post Item -->
						<div class="col-md-6">
							<a href="#" class="blog-compact-item-container">
								<div class="blog-compact-item">
									<img src="${contextPath}/resources/images/blog-compact-post-03.jpg" alt="">
									<span class="blog-item-tag">Tips</span>
									<div class="blog-compact-item-content">
										<ul class="blog-post-tags">
											<li>10 August 2017</li>
										</ul>
										<h3>마이크로소프트 창업하기</h3>
										<p>Sed sed tristique nibh iam porta volutpat finibus. Donec in aliquet urneget
											mattis lorem. Pellentesque pellentesque.</p>
									</div>
								</div>
							</a>
						</div>
						<!-- Blog post Item / End -->

					</div>
					<!-- Related Posts / End -->


					<div class="margin-top-50"></div>
				</div>
				<!-- Content / End -->



				<!-- Widgets -->
				<div class="col-lg-3 col-md-4">
					<div class="sidebar right">

						<!-- Widget -->
						<div class="widget margin-top-40">
							<h3>수업 세부 사항</h3>
							<div class="boxed-widget opening-hours margin-top-35">
								<div class="listing-badge now-open">Now Open</div>
								<h3><i class="sl sl-icon-clock"></i> Opening Hours</h3>
								<ul>
									<li>Monday <span>9 AM - 5 PM</span></li>
									<li>Tuesday <span>9 AM - 5 PM</span></li>
									<li>Wednesday <span>9 AM - 5 PM</span></li>
									<li>Thursday <span>9 AM - 5 PM</span></li>
									<li>Friday <span>9 AM - 5 PM</span></li>
									<li>Saturday <span>9 AM - 3 PM</span></li>
									<li>Sunday <span>Closed</span></li>
								</ul>
							</div>
						</div>
						<!-- Widget / End -->

						<div class="clearfix"></div>
						<div class="margin-bottom-40"></div>
					</div>
				</div>
			</div>
			<!-- Sidebar / End -->


		</div>
	</div>

</body>