<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

				<!-- lecture Post -->
				<div class="blog-post single-post">
					<!-- Main Img -->

					<!-- slider Main + sub Img / End -->
					<div class="just-own-slick-carousel dots-nav">
						<div class="carousel-item">
							<!-- Default Img-->
							<c:if test="${empty lectureVO.class_image || lectureVO.class_image == 'local'}">
								<img class="post-img" src="${contextPath}/resources/images/slider-bg-02.jpg" alt="mainImage">
							</c:if>
							<!-- Default Img / End -->
						
							<!-- slider Main + sub Img / End -->
							<c:if test="${not empty lectureVO.class_image || lectureVO.class_image != 'local'}">
								<!-- Main Image First -->
								<img class="post-img" 
									src="/file/download?image_name=${lectureVO.class_image}&class_id=${lectureVO.class_id}"
									alt="mainImage">
								<!-- Main Image First / End -->
							</c:if>
							<!-- Main Img / End -->
						</div>

						<!-- lecture subImage -->
						<c:forEach var="imageListVO" items="${imageList}">
							<c:if test="${lectureVO.class_image ne imageListVO.image_name}">
								<div class="carousel-item">
									<img class="post-img"
										src="/file/download?image_name=${imageListVO.image_name}&class_id=${lectureVO.class_id}" 
										alt="subImage">
								</div>
							</c:if>
						</c:forEach>
						<!-- lecture subImage / End -->
					</div>
					
					<!-- slider Main + sub Img / End -->

					<!-- 상세 내용-->
					<div class="post-content">
						<h3>${lectureVO.class_name}</h3>
						<pre>${lectureVO.class_content}</pre>
					</div>
					<!-- 상세 내용 / End-->
				</div>
				<!-- lecture Post / End -->

				<!-- About Teacher -->
				<div class="about-author">
					<img src="${contextPath}/resources/images/user-avatar.jpg" alt="" />
					<div class="about-description">
						<h4>${lectureVO.class_teacher_name}</h4>
						<p>${tutorVO.user_status}</p>
					</div>
				</div>
				<!-- About Teacher / End -->

				<!-- Map Location
				================================================== -->
				<div id="listing-location" class="listing-section">
					<h3 class="listing-desc-headline margin-top-60 margin-bottom-30">강의 장소</h3>
					<div id="singleListingMap" data-latitude="${lectureVO.class_lat}" data-longitude="${lectureVO.class_lng}">
						<a href="#" id="streetView">Street View</a>
					</div>
				</div>
				<!-- Map Location / End -->

				<!-- YouTube -->
				<div class="container">
					<input hidden class="js_user_youtube" value="${lectureVO.class_youtube}" />
					<c:if test="${not empty lectureVO.class_youtube}">
						<div id="youTubePlayer"></div>
					</c:if>
				</div>
				<!-- YouTube / End -->

				<!-- Related Teacher Lecture -->
				<h4 class="headline margin-top-25">${lectureVO.class_teacher_name} 튜터의 다른 강좌들</h4>
				<div class="just-two-slick-carousel dots-nav">
					<c:forEach var="lectureListVO" items="${lectureList}">
						<c:if test="${lectureListVO.class_id != lectureVO.class_id}">
							<!-- lecture Post -->
							<div class="carousel-item col-md-6">
								<a href="${lectureListVO.class_id}" class="blog-compact-item-container">
									<div class="blog-compact-item">
										<c:choose>
											<c:when
												test="${empty lectureListVO.class_image || lectureListVO.class_image == 'local'}">
												<img src="${contextPath}/resources/images/blog-compact-post-01.jpg"
													alt="mainImage">
											</c:when>
											<c:otherwise>
												<img class="post-img"
													src="/file/download?image_name=${lectureListVO.class_image}&class_id=${lectureListVO.class_id}"
													alt="mainImage">
											</c:otherwise>
										</c:choose>
										<div class="blog-compact-item-content">
											<h3>${lectureListVO.class_name}</h3>
											<p>${lectureListVO.class_summary}</p>
										</div>
									</div>
								</a>
							</div>
							<!-- lecture post / End -->
						</c:if>
					</c:forEach>
				</div>
				<!-- Related Teacher Lecture / End -->
			</div>
			<!-- Post Content / End -->

			<!-- nav -->
			<div class="col-lg-3 col-md-4">
				<div class="sidebar right">
					<!-- 수업  시작, 종료 날짜-->
					<div class="widget margin-top-40">
						<h3>수업 세부 사항</h3>
						<div class="boxed-widget opening-hours margin-top-35">
							<div class="listing-badge now-open">Now Open</div>
							<h3><i class="sl sl-icon-clock"></i><span>Start~End-day</span></h3>
							<ul>
								<li>수업 시작일 <span>${lectureVO.class_startday}</span></li>
								<li>수업 종료일 <span>${lectureVO.class_endday}</span></li>
							</ul>
						</div>
					</div>
					<!-- 수업  시작, 종료 날짜 / End -->
				</div>
			</div>
			<div class="col-lg-3 col-md-4">
				<div class="sidebar right">
					<!-- 수업 요일별 시간 -->
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
					<!-- 수업 요일별 시간 / End -->

					<!-- 수강 등록 -->
					<form action="/lecture/tuteeRegister" method="POST">
						<input type="hidden" name="user_id" value="${tuteeVO.user_id}" />
						<input type="hidden" name="enrolment_classname" value="${lectureVO.class_name}" />
						<input type="hidden" name="enrolment_class_id" value="${lectureVO.class_id}" />
						<button type="submit" class="button medium border">강의 신청</button>
					</form>
					<!-- 수강 등록 / End-->
				</div>
			</div>
			<!-- nav -->
		</div>
	</div>
</div>