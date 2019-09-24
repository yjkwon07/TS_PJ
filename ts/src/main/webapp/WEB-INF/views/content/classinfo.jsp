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

					<h2>C를 아름답게</h2><span>당신의 주말을 책임져줄 우아한 코더</span>

					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li>Blog</li>
						</ul>
					</nav>

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

							<h3>The 50 Greatest Street Arts In London</h3>

							<ul class="post-meta">
								<li>August 22, 2017</li>
								<li><a href="#">Tips</a></li>
								<li><a href="#">5 Comments</a></li>
							</ul>

							<p>Nam nisl lacus, dignissim ac tristique ut, scelerisque eu massa. Vestibulum ligula nunc,
								rutrum in malesuada vitae, tempus sed augue. Curabitur quis lectus quis augue dapibus
								facilisis. Vivamus tincidunt orci est, in vehicula nisi eleifend ut. Vestibulum sagittis
								varius orci vitae.</p>

							<div class="post-quote">
								<span class="icon"></span>
								<blockquote>
									Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices
									pellentesque purus, vulputate volutpat ipsum hendrerit sed neque sed sapien rutrum.
								</blockquote>
							</div>

							<p>In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla
								eu mi magna. Etiam suscipit commodo gravida. Cras suscipit, quam vitae adipiscing
								faucibus, risus nibh laoreet odio, a porttitor metus eros ut enim. Morbi augue velit,
								tempus mattis dignissim nec, porta sed risus. Donec eget magna eu lorem tristique
								pellentesque eget eu dui. Fusce lacinia tempor malesuada. Ut lacus sapien, placerat a
								ornare nec, elementum sit amet felis. Maecenas pretium lorem hendrerit eros sagittis
								fermentum.</p>
							<p>Phasellus enim magna, varius et commodo ut, ultricies vitae velit. Ut nulla tellus,
								eleifend euismod pellentesque vel, sagittis vel justo. In libero urna, venenatis sit
								amet ornare non, suscipit nec risus. Sed consequat justo non mauris pretium at tempor
								justo sodales. Quisque tincidunt laoreet malesuada. Cum sociis natoque penatibus et
								magnis dis parturient montes, nascetur ridiculus mus. Integer vitae ante enim. Fusce sed
								elit est. Suspendisse sit amet mauris in quam pretium faucibus et aliquam odio. </p>


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
							<h4>빌 게이츠</h4>
							<a href="#">tom@example.com</a>
							<p>Nullam ultricies, velit ut varius molestie, ante metus condimentum nisi, dignissim
								facilisis turpis ex in libero. Sed porta ante tortor, a pulvinar mi facilisis nec. Proin
								finibus dolor ac convallis congue.</p>
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