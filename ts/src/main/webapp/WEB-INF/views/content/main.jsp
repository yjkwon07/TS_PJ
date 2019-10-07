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

				<!-- Listing Item -->
				<div class="carousel-item">
					<a href="listings-single-page.html" class="listing-item-container">
						<div class="listing-item">
							<img src="${contextPath}/resources/images/listing-item-01.jpg" alt="">

							<div class="listing-badge now-open">Now Open</div>

							<div class="listing-item-content">
								<span class="tag">Eat & Drink</span>
								<h3>Tom's Restaurant</h3>
								<span>964 School Street, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
						<div class="star-rating" data-rating="3.5">
							<div class="rating-counter">(12 reviews)</div>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="carousel-item">
					<a href="listings-single-page.html" class="listing-item-container">
						<div class="listing-item">
							<img src="${contextPath}/resources/images/listing-item-02.jpg" alt="">
							<div class="listing-item-details">
								<ul>
									<li>Friday, August 10</li>
								</ul>
							</div>
							<div class="listing-item-content">
								<span class="tag">Events</span>
								<h3>Sticky Band</h3>
								<span>Bishop Avenue, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
						<div class="star-rating" data-rating="5.0">
							<div class="rating-counter">(23 reviews)</div>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="carousel-item">
					<a href="listings-single-page.html" class="listing-item-container">
						<div class="listing-item">
							<img src="${contextPath}/resources/images/listing-item-03.jpg" alt="">
							<div class="listing-item-details">
								<ul>
									<li>Starting from $59 per night</li>
								</ul>
							</div>
							<div class="listing-item-content">
								<span class="tag">Hotels</span>
								<h3>Hotel Govendor</h3>
								<span>778 Country Street, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
						<div class="star-rating" data-rating="2.0">
							<div class="rating-counter">(17 reviews)</div>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="carousel-item">
					<a href="listings-single-page.html" class="listing-item-container">
						<div class="listing-item">
							<img src="${contextPath}/resources/images/listing-item-04.jpg" alt="">

							<div class="listing-badge now-open">Now Open</div>

							<div class="listing-item-content">
								<span class="tag">Eat & Drink</span>
								<h3>Burger House</h3>
								<span>2726 Shinn Street, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
						<div class="star-rating" data-rating="5.0">
							<div class="rating-counter">(31 reviews)</div>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="carousel-item">
					<a href="listings-single-page.html" class="listing-item-container">
						<div class="listing-item">
							<img src="${contextPath}/resources/images/listing-item-05.jpg" alt="">
							<div class="listing-item-content">
								<span class="tag">Other</span>
								<h3>Airport</h3>
								<span>1512 Duncan Avenue, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
						<div class="star-rating" data-rating="3.5">
							<div class="rating-counter">(46 reviews)</div>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="carousel-item">
					<a href="listings-single-page.html" class="listing-item-container">
						<div class="listing-item">
							<img src="${contextPath}/resources/images/listing-item-06.jpg" alt="">

							<div class="listing-badge now-closed">Now Closed</div>

							<div class="listing-item-content">
								<span class="tag">Eat & Drink</span>
								<h3>Think Coffee</h3>
								<span>215 Terry Lane, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
						<div class="star-rating" data-rating="4.5">
							<div class="rating-counter">(15 reviews)</div>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->
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
				${userVO.user_id}님의 강좌 리스트
			</h3>
		</div>
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

