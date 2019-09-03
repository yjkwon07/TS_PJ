<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
	<!-- Content
================================================== -->
	<div class="fs-container">

		<div class="fs-inner-container content">
			<div class="fs-content">

				<!--Start sub categories-->
				<div>
					Hello World!!!
				</div>
				<!--End sub categories-->


				<section class="listings-container margin-top-30">

					<!-- Sorting / Layout Switcher -->
					<div class="row fs-switcher">

						<div class="col-md-6">
							<!-- Showing Results -->
							<p class="showing-results">14 Results Found </p>
						</div>

					</div>


					<!-- Listings -->
					<div class="row fs-listings">

						<!-- Listing Item -->
						<div class="col-lg-6 col-md-6">
							<a href="listings-single-page.html" class="listing-item-container compact"
								data-marker-id="1">
								<div class="listing-item">
									<img src="images/listing-item-01.jpg" alt="">

									<div class="listing-badge now-open">Now Open</div>

									<div class="listing-item-content">
										<div class="numerical-rating" data-rating="3.5"></div>
										<h3>Tom's Restaurant <i class="verified-icon"></i></h3>
										<span>964 School Street, New York</span>
									</div>
									<span class="like-icon"></span>
								</div>
							</a>
						</div>
						<!-- Listing Item / End -->

						<!-- Listing Item -->
						<div class="col-lg-6 col-md-6">
							<a href="listings-single-page.html" class="listing-item-container compact"
								data-marker-id="2">
								<div class="listing-item">
									<img src="images/listing-item-02.jpg" alt="">
									<div class="listing-item-details">
										<ul>
											<li>Friday, August 10</li>
										</ul>
									</div>
									<div class="listing-item-content">
										<div class="numerical-rating" data-rating="5.0"></div>
										<h3>Sticky Band</h3>
										<span>Bishop Avenue, New York</span>
									</div>
									<span class="like-icon"></span>
								</div>
							</a>
						</div>
						<!-- Listing Item / End -->

						<!-- Listing Item -->
						<div class="col-lg-6 col-md-12">
							<a href="listings-single-page.html" class="listing-item-container compact"
								data-marker-id="3">
								<div class="listing-item">
									<img src="images/listing-item-03.jpg" alt="">
									<div class="listing-item-details">
										<ul>
											<li>Starting from $59 per night</li>
										</ul>
									</div>
									<div class="listing-item-content">
										<div class="numerical-rating" data-rating="2.0"></div>
										<h3>Hotel Govendor</h3>
										<span>778 Country Street, New York</span>
									</div>
									<span class="like-icon"></span>
								</div>

							</a>
						</div>
						<!-- Listing Item / End -->

						<!-- Listing Item -->
						<div class="col-lg-6 col-md-12">
							<a href="listings-single-page.html" class="listing-item-container compact"
								data-marker-id="4">
								<div class="listing-item">
									<img src="images/listing-item-04.jpg" alt="">

									<div class="listing-badge now-open">Now Open</div>

									<div class="listing-item-content">
										<div class="numerical-rating" data-rating="5.0"></div>
										<h3>Burger House <i class="verified-icon"></i></h3>
										<span>2726 Shinn Street, New York</span>
									</div>
									<span class="like-icon"></span>
								</div>
							</a>
						</div>
						<!-- Listing Item / End -->

						<!-- Listing Item -->
						<div class="col-lg-6 col-md-12">
							<a href="listings-single-page.html" class="listing-item-container compact"
								data-marker-id="5">
								<div class="listing-item">
									<img src="images/listing-item-05.jpg" alt="">
									<div class="listing-item-content">
										<div class="numerical-rating" data-rating="3.5"></div>
										<h3>Airport</h3>
										<span>1512 Duncan Avenue, New York</span>
									</div>
									<span class="like-icon"></span>
								</div>
							</a>
						</div>
						<!-- Listing Item / End -->

						<!-- Listing Item -->
						<div class="col-lg-6 col-md-12">
							<a href="listings-single-page.html" class="listing-item-container compact"
								data-marker-id="6">
								<div class="listing-item">
									<img src="images/listing-item-06.jpg" alt="">

									<div class="listing-badge now-closed">Now Closed</div>

									<div class="listing-item-content">
										<div class="numerical-rating" data-rating="4.5"></div>
										<h3>Think Coffee</h3>
										<span>215 Terry Lane, New York</span>
									</div>
									<span class="like-icon"></span>
								</div>
							</a>
						</div>
						<!-- Listing Item / End -->

					</div>
					<!-- Listings Container / End -->


					<!-- Pagination Container -->
					<div class="row fs-listings">
						<div class="col-md-12">

							<!-- Pagination -->
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-md-12">
									<!-- Pagination -->
									<div class="pagination-container margin-top-15 margin-bottom-40">
										<nav class="pagination">
											<ul>
												<li><a href="#" class="current-page">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<!-- Pagination / End -->

							<!-- Copyrights -->
							<div class="copyrights margin-top-0">© 2017 Listeo. All Rights Reserved.</div>

						</div>
					</div>
					<!-- Pagination Container / End -->
				</section>

			</div>
		</div>
		<div class="fs-inner-container map-fixed">

			<!-- Map -->
			<div id="map-container">
				<div id="map" data-map-zoom="9" data-map-scroll="true">
					<!-- map goes here -->
				</div>
			</div>

		</div>
	</div>

</body>