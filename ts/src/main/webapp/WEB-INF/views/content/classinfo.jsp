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
					<h2>${lectureVO.class_name}</h2><span>${lectureVO.class_summary}</span>
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

							<pre>${lectureVO.class_content}</pre>

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
					<div id="youTubePlayer"></div><!-- 플레이어를 불러올 영역-->
					<!-- About Author -->
					<div class="about-author">
						<img src="${contextPath}/resources/images/user-avatar.jpg" alt="" />
						<div class="about-description">
							<h4>${lectureVO.class_teacher_name}</h4>
							<input hidden class="js_user_youtube" value="${lectureVO.class_youtube}"/>
							<p>${tutorVO.user_status}</p>
						</div>
					</div>


					<!-- Related Posts -->
					<div class="clearfix"></div>
					<h4 class="headline margin-top-25">이 튜터의 다른 강좌들</h4>
					<div class="row">
					<c:forEach var="lectureListVO" items="${lectureList}">
						<c:if test="${lectureListVO.class_id != lectureVO.class_id}">
							<!-- Blog Post Item -->
							<div class="col-md-6">
								<a href="${lectureListVO.class_id}" class="blog-compact-item-container">
									<div class="blog-compact-item">
										<img src="${contextPath}/resources/images/blog-compact-post-01.jpg" alt="">
										<span class="blog-item-tag">Tips</span>
										<div class="blog-compact-item-content">
											<h3>${lectureListVO.class_name}</h3>
											<p>${lectureListVO.class_summary}</p>
										</div>
									</div>
								</a>
							</div>
							<!-- Blog post Item / End -->
						</c:if>
					</c:forEach>
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
								<h3><i class="sl sl-icon-clock"></i>Start-day<br>End-day</h3>
								<ul>
									<li>수업 시작일<span>${lectureVO.class_startday}</span></li>
									<li>수업 종료일 <span>${lectureVO.class_endday}</span></li>
								</ul>
							</div>
						</div>
						<!-- Widget / End -->

						<div class="clearfix"></div>
						<div class="margin-bottom-40"></div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4">
					<div class="sidebar right">

						<!-- Widget -->
						<div class="widget margin-top-40">
							<div class="boxed-widget opening-hours margin-top-35">
								<h3><i class="sl sl-icon-clock"></i> Opening Hours</h3>
								<ul>
									<li>Monday <span>${lectureVO.class_MON}</span></li>
									<li>Tuesday <span>${lectureVO.class_TUE}</span></li>
									<li>Wednesday <span>${lectureVO.class_WED}</span></li>
									<li>Thursday <span>${lectureVO.class_THU}</span></li>
									<li>Friday <span>${lectureVO.class_FRI}</span></li>
									<li>Saturday <span>${lectureVO.class_SAT}</span></li>
									<li>Sunday <span>${lectureVO.class_SUN}</span></li>
								</ul>
							</div>
						</div>
						<!-- Widget / End -->
					<form action="/lecture/tuteeRegister" method="POST">
						<input type="hidden" name="user_id" value="${tuteeVO.user_id}"/>
						<input type="hidden" name="enrolment_classname" value="${lectureVO.class_name}"/>
						<input type="hidden" name="enrolment_class_id" value="${lectureVO.class_id}"/>
						<i class="fa fa-arrow-circle-right"></i><input type="submit" value='강의 신청'/>
					</form>
					
						<div class="clearfix"></div>
						<div class="margin-bottom-40"></div>
					</div>
				</div>
			</div>
			<!-- Sidebar / End -->


		</div>
	</div>

</body>