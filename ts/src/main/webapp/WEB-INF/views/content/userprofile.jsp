<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Content
================================================== -->
<div class="container">

	<div class="row">
		<!-- About User -->
		<div class="col-lg-4 col-md-4 margin-top-0">
			<div class="about-author">
				<img src="${contextPath}/resources/images/user-avatar.jpg" alt="" />
				<div class="about-description">
					<h4>${userprofileVO['userVO'].user_id}</h4>
					<p>${userprofileVO['userVO'].user_status}</p>
				</div>
			</div>
		</div>
		<!-- About User / End -->
	</div>

	<!-- EnrolmentLecture -->
	<section class="listings-container margin-top-30">
		<div class="row fs-switcher">
			<div class="col-md-6">
				<p class="showing-results">등록한 강좌 목록</p>
			</div>
		</div>

		<c:forEach var="lectureVO" items="${userprofileVO['enrolmentLectureVO']}">
			<div class="col fs-listings">
				<!-- EnrolmentLecture Item -->
				<div class="col-lg-6 col-md-12">
					<a href="/lecture/${lectureVO.class_id}" class="listing-item-container">
						<div class="listing-item">
							<!-- Default Img-->
							<c:if test="${empty lectureVO.class_image || lectureVO.class_image == 'local'}">
								<img class="post-img" src="${contextPath}/resources/images/slider-bg-02.jpg"
									alt="mainImage">
							</c:if>
							<!-- Default Img / End -->

							<!-- Main Image -->
							<c:if test="${not empty lectureVO.class_image || lectureVO.class_image != 'local'}">
								<img class="post-img"
									src="/file/download?image_name=${lectureVO.class_image}&class_id=${lectureVO.class_id}"
									alt="mainImage">
							</c:if>
							<!-- Main Image -->

							<div class="listing-item-content">
								<span class="tag">${lectureVO.class_maincategories}/${lectureVO.class_subcategories}</span>
								<h4>${lectureVO.class_teacher_name}</h4>
								<h3>${lectureVO.class_name}</h3>
								<span>${lectureVO.class_summary}</span>
							</div>
						</div>
					</a>
				</div>
				<!-- EnrolmentLecture Item / End -->
			</div>
		</c:forEach>
		<!-- Pagination Container / End -->
	</section>
	<!-- EnrolmentLecture / End -->
	<div class="clearfix margin-top-30"></div>

	<!-- Lectureinsert Tutor -->
	<c:if test="${userprofileVO['userVO'].user_auth == 2}">
		<div class="row">
			<p>강의 개설 목록</p>
			<!-- Lecture Container -->
			<div class="just-two-slick-carousel dots-nav">
				<c:forEach var="tutorLectureVO" items="${userprofileVO['tutorLectureVO']}">
					<div class="carousel-item col-md-6">
						<a href="/lecture/${tutorLectureVO.class_id}" class="blog-compact-item-container">
							<div class="listing-item-image">
								<c:choose>
									<c:when
										test="${empty tutorLectureVO.class_image || tutorLectureVO.class_image == 'local'}">
										<img src="${contextPath}/resources/images/blog-compact-post-01.jpg"
											alt="mainImage">
									</c:when>
									<c:otherwise>
										<img class="post-img"
											src="/file/download?image_name=${tutorLectureVO.class_image}&class_id=${tutorLectureVO.class_id}"
											alt="mainImage">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="listing-item-content">
								<div class="listing-item-inner">
									<span
										class="tag">${tutorLectureVO.class_maincategories}/${tutorLectureVO.class_subcategories}</span>
									<h3>${tutorLectureVO.class_name}</h3>
									<p>${tutorLectureVO.class_summary}</p>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>
	<!-- Lectureinsert Tutor / End-->

</div>