<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Map
================================================== -->
<div id="map-container" class="fullwidth-home-map">
		<div class="js_maps" id="map" data-map-zoom="8">
			<!-- map goes here -->
		</div>

		<!-- place search -->
		<div class="main-search-inner">

			<div class="container">

				<div class="row">

					<div class="col-md-11">

						<div class="main-search-input">

							<div class="main-search-input-item">
								<input class="js_LectureName" type="text" placeholder="원하는 강의명을 입력해보세요." value="" />

								<div class="dashboard-list-box margin-top-0">
									<ul id="search-list"></ul>
								</div>
							</div>

							<button class="js_PlaceSearch button">Search</button>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Scroll Enabling Button -->
		<a href="#" id="scrollEnabling" title="Enable or disable scrolling on map">Enable Scrolling</a>
		<!-- current button Button -->
		<a href="#" id="geoLocation" title="Enable or disable scrolling on map">현재 위치</a>
		
		<!-- Strret View -->
		<a style="visibility: hidden" href="#" id="streetView">Street View</a>

		<!-- get lecture Button -->
		<a href="#" class ="button  medium border" id="start" title="현재 위치에서 강의 찾기">현재 위치에서 강의 찾기</a>
		
		<!-- current Button -->
		<a style="visibility: hidden" href="#" class ="button  medium border" id="gps" title="길찾기">현재 위치에서 길찾기</a>
		
		<!-- current Button -->
		<a style="visibility: hidden" href="#" class ="button  medium border" id="gps_end" title="길찾기 종료">길찾기 종료</a>
</div>

<div class="margin-top-120 "></div>

<!-- Content
================================================== -->

<!-- LatetestLecture Container -->
<div class="container margin-top-70">
	<div class="row">
		<div class="col-md-12">
			<h3 class="headline centered margin-bottom-45">
				최신 강좌
				<span>Discover top-rated Lectures</span>
			</h3>
		</div>

		<div class="col-md-12">
			<div class="simple-slick-carousel dots-nav">
				<c:forEach var="latetestLectureVO" items="${latestLectureList}">
					<!-- latetestLecture Item -->
					<div class="carousel-item">
						<a href="lecture/${latetestLectureVO.class_id}" class="listing-item-container">
							<div class="listing-item">
								<!-- Default Img-->
								<c:if test="${empty latetestLectureVO.class_image || latetestLectureVO.class_image == 'local'}">
									<img class="post-img" src="${contextPath}/resources/images/slider-bg-02.jpg"
										alt="mainImage">
								</c:if>
								<!-- Default Img / End -->
							
								<!-- Main Image -->
								<c:if test="${not empty latetestLectureVO.class_image && latetestLectureVO.class_image != 'local'}">
									<img class="post-img"
										src="/file/download?image_name=${latetestLectureVO.class_image}&class_id=${latetestLectureVO.class_id}"
										alt="mainImage">
								</c:if>
								<!-- Main Image / End -->
							
								<div class="listing-badge now-open">Now Open</div>
							
								<div class="listing-item-content">
									<span class="tag">${latetestLectureVO.class_maincategories}/${latetestLectureVO.class_subcategories}</span>
									<h3>${latetestLectureVO.class_name}</h3>
									<span>${latetestLectureVO.class_summary}</span>
								</div>
							</div>
						</a>
					</div>
					<!-- latetestLecture Item / End -->
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- LatetestLecture Container / End -->

<!-- EnrolmentLecture Container -->
<c:if test="${userprofileVO != null}">
	<div class="container margin-top-70">
		<div class="row">
			
			<c:choose>
				<c:when test="${userprofileVO['enrolmentLectureVO'][0].user_id == null}">
					<div class="col-md-12">
						<h3 class="headline centered margin-bottom-30">등록된 강의가 없습니다! 강의를 등록해주세요</h3>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="col-md-12">
						<h3 class="headline centered margin-bottom-45">
							${userVO.user_id}님의 강의 리스트
							<i class="tip" data-tip-content='해당 빨간 리본은 강의 종료 날짜입니다''></i>
						</h3>
					</div>
					
					<div class="col-md-12">
						<div class="simple-slick-carousel dots-nav">
							<c:forEach var="enrolmentLectureVO" items="${userprofileVO['enrolmentLectureVO']}">
								<!-- EnrolmentLecture Item -->
								<div class="carousel-item">
									<a href="lecture/${enrolmentLectureVO.class_id}" class="listing-item-container">
										<div class="listing-item">
											<!-- Default Img-->
											<c:if test="${empty enrolmentLectureVO.class_image || enrolmentLectureVO.class_image == 'local'}">
												<img class="post-img" src="${contextPath}/resources/images/slider-bg-02.jpg" alt="mainImage">
											</c:if>
											<!-- Default Img / End -->
								
											<!-- Main Image -->
											<c:if test="${not empty enrolmentLectureVO.class_image && enrolmentLectureVO.class_image != 'local'}">
												<img src="/file/download?image_name=${enrolmentLectureVO.class_image}&class_id=${enrolmentLectureVO.class_id}" alt="">
											</c:if>

											<div class="listing-badge now-closed">${fn:split(enrolmentLectureVO.class_endday, ' ')[0]}</div>
											<div class="listing-item-content">
												<span class="tag">${enrolmentLectureVO.class_maincategories}/${enrolmentLectureVO.class_subcategories}</span>
												<h3>${enrolmentLectureVO.class_name}</h3>
												<span>${enrolmentLectureVO.class_summary}</span>
											</div>
										</div>
									</a>
								</div>
								<!-- EnrolmentLecture Item / End -->
							</c:forEach>
						</div>
					</div>
					
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</c:if>
<!-- EnrolmentLecture Container / End -->

