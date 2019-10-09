<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Map
================================================== -->
<div id="map-container" class="fullwidth-home-map">

	<div id="map" data-map-zoom="9">
		<!-- map goes here -->
	</div>

	<div class="main-search-inner">

		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="main-search-input">

						<div class="main-search-input-item">
							<input type="text" placeholder="What are you looking for?" value="" />
						</div>

						<button class="button">Search</button>

					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Scroll Enabling Button -->
	<a href="#" id="scrollEnabling" title="Enable or disable scrolling on map">Enable Scrolling</a>
	<!-- current button Button -->
	<a href="#" id="geoLocation" title="Enable or disable scrolling on map">현재 위치</a>
</div>


<!-- Content
================================================== -->

<!-- Listings -->
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
					<!-- Listing Item -->
					<div class="carousel-item">
						<a href="lecture/${latetestLectureVO.class_id}" class="listing-item-container">
							<div class="listing-item">
								<img src="/file/download?image_name=${latetestLectureVO.class_image}&class_id=${latetestLectureVO.class_id}" alt="">
	
								<div class="listing-badge now-open">Now Open</div>
	
								<div class="listing-item-content">
									<span class="tag">${latetestLectureVO.class_maincategories}/${latetestLectureVO.class_subcategories}</span>
									<h3>${latetestLectureVO.class_name}</h3>
									<span>${latetestLectureVO.class_summary}</span>
								</div>
							</div>
						</a>
					</div>
					<!-- Listing Item / End -->
				</c:forEach>
			</div>
		</div>

	</div>
</div>
<!-- Listings / End -->

<c:if test="${userprofileVO != null}">
<!-- Listings -->
<div class="container margin-top-70">
	<div class="row">
		<div class="col-md-12">
			<h3 class="headline centered margin-bottom-45">
				${userVO.user_id}님의 강의 리스트
			</h3>
		</div>
		<c:choose>
			<c:when test="${userprofileVO['enrolmentLectureVO'][0].user_id == null}">
				<h2 class="headline centered margin-bottom-30">등록 강의가 없습니다! 강의를 등록해주세요</h2>
			</c:when>
			<c:otherwise>
			<div class="col-md-12">
			<div class="simple-slick-carousel dots-nav">
				<c:forEach var="enrolmentLectureVO" items="${userprofileVO['enrolmentLectureVO']}">
							<!-- Listing Item -->
							<div class="carousel-item">
							<a href="lecture/${enrolmentLectureVO.class_id}" class="listing-item-container">
								<div class="listing-item">
									<img src="/file/download?image_name=${enrolmentLectureVO.class_image}&class_id=${enrolmentLectureVO.class_id}" alt="">
			
									<div class="listing-badge now-closed">${enrolmentLectureVO.class_endday}</div>
			
									<div class="listing-item-content">
										<span class="tag">${enrolmentLectureVO.class_maincategories}/${enrolmentLectureVO.class_subcategories}</span>
										<h3>${enrolmentLectureVO.class_name}</h3>
										<span>${enrolmentLectureVO.class_summary}</span>
									</div>
								</div>
							</a>
							</div>
							<!-- Listing Item / End -->
				</c:forEach>
			</div>
			</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- Listings / End -->
</c:if>
<script>
	var msg = "${msg}";
	if(msg.length > 0){
		window.alert(msg);
	}
		
</script>

