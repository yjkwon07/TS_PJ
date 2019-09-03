<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
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

	<!-- Listings -->
	<div class="container margin-top-70">
		<div class="row">

			<div class="col-md-12">
				<h3 class="headline centered margin-bottom-45">
					${userid}님의 강좌 리스트
					<span>Discover top-rated your Lectures</span>
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

	<section class="fullwidth margin-top-70 padding-top-75 padding-bottom-70" data-background-color="#f9f9f9">
		<!-- Info Section -->
		<div class="container">

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h3 class="headline centered">
						모든 강좌 리뷰
						<span class="margin-top-25">We collect reviews from our users so you can get an honest opinion
							of what an experience with our website are really like!</span>
					</h3>
				</div>
			</div>

		</div>
		<!-- Info Section / End -->

		<!-- Categories Carousel -->
		<div class="fullwidth-carousel-container margin-top-20">
			<div class="testimonial-carousel testimonials">

				<!-- Item -->
				<div class="fw-carousel-review">
					<div class="testimonial-box">
						<div class="testimonial">Bring to the table win-win survival strategies to ensure proactive
							domination. At the end of the day, going forward, a new normal that has evolved from
							generation is on the runway heading towards a streamlined cloud solution user generated
							content.</div>
					</div>
					<div class="testimonial-author">
						<img src="${contextPath}/resources/images/happy-client-01.jpg" alt="">
						<h4>Jennie Smith <span>Coffee Shop Owner</span></h4>
					</div>
				</div>

				<!-- Item -->
				<div class="fw-carousel-review">
					<div class="testimonial-box">
						<div class="testimonial">Capitalize on low hanging fruit to identify a ballpark value added
							activity to beta test. Override the digital divide with additional clickthroughs from
							DevOps. Nanotechnology immersion along the information highway will close the loop.</div>
					</div>
					<div class="testimonial-author">
						<img src="${contextPath}/resources/images/happy-client-02.jpg" alt="">
						<h4>Tom Baker <span>Clothing Store Owner</span></h4>
					</div>
				</div>

				<!-- Item -->
				<div class="fw-carousel-review">
					<div class="testimonial-box">
						<div class="testimonial">Leverage agile frameworks to provide a robust synopsis for high level
							overviews. Iterative approaches to corporate strategy foster collaborative thinking to
							further the overall value proposition. Organically grow the holistic world view.</div>
					</div>
					<div class="testimonial-author">
						<img src="${contextPath}/resources/images/happy-client-03.jpg" alt="">
						<h4>Jack Paden <span>Restaurant Owner</span></h4>
					</div>
				</div>

			</div>
		</div>
		<!-- Categories Carousel / End -->

	</section>
</body>