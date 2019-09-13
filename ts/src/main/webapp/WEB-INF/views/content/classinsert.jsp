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

	<!-- Container -->
	<div class="container">

		<div class="row">
			<div class="col-lg-12">

				<div id="add-listing" class="separated-form">

					<!-- Section -->
					<div class="add-listing-section">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3> <i class="sl sl-icon-doc"></i> 강의를 작성해주세요. </h3>
						</div>

						<!-- Title -->
						<div class="row with-forms">
							<div class="col-md-12">
								<h5>
									강의 명 
									<i class="tip" data-tip-content="강의를 입력해주세요. &nbsp; ex) 자바를 다루는 웹 기술"></i>
								</h5>
								<input class="search-field" type="text" value="" />
							</div>
						</div>

						<!-- Row -->
						<div class="row with-forms">

							<!-- Status -->
							<div class="col-md-6">
								<h5>Main Category</h5>
								<select class="chosen-select-no-single">
									<option label="blank">Select Main Category</option>
									<option>디자인</option>
									<option>IT</option>
									<option>뷰티</option>
									<option>영상</option>
									<option>외국어</option>
									<option>음악</option>
								</select>
							</div>

							<div class="col-md-6">
								<h5>Sub Category</h5>
								<select class="chosen-select-no-single">
									<option label="blank">Select Sub Category</option>
									<option>Eat & Drink</option>
									<option>Shops</option>
									<option>Hotels</option>
									<option>Restaurants</option>
									<option>Fitness</option>
									<option>Events</option>
								</select>
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									Teacher name
									<i class="tip" 
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" value='${login.user_name}' disabled>
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									Summary
									<i class="tip"
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" placeholder="Keywords should be separated by commas">
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									YouTube Link
									<i class="tip"
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" placeholder="Keywords should be separated by commas">
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									수강 최대 인원 수
									<i class="tip"
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" placeholder="Keywords should be separated by commas">
							</div>
						</div>
						<!-- Row / End -->

					</div>
					<!-- Section / End -->

					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-location"></i> Location</h3>
						</div>
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
													<input type="text" placeholder="What are you looking for?"
														value="" />
												</div>

												<button class="button">Search</button>

											</div>
										</div>
									</div>
								</div>

							</div>

							<!-- Scroll Enabling Button -->
							<a href="#" id="scrollEnabling" title="Enable or disable scrolling on map">Enable
								Scrolling</a>
						</div>
					</div>
					<!-- Section / End -->


					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-picture"></i> Gallery</h3>
						</div>

						<!-- Dropzone -->
						<div class="submit-section">
							<form action="/file-upload" class="dropzone"></form>
						</div>

					</div>
					<!-- Section / End -->


					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3>
								<i class="sl sl-icon-docs"></i> Details
							</h3>
						</div>

						<!-- Description -->
						<div class="form">
							<h5>상세 설명</h5>
							<textarea class="WYSIWYG" name="summary" cols="40" rows="3" id="summary"
								spellcheck="true">
							</textarea>
						</div>
					</div>
					<!-- Row / End -->
				</div>
				<!-- Section / End -->

				<!-- Section -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-clock"></i> 강의 시자일 종료일</h3>
						<!-- Switcher -->
						<label class="switch"><input type="checkbox" checked><span class="slider round"></span></label>
					</div>

					<!-- Switcher ON-OFF Content -->
					<div class="switcher-content">

						<!-- Day -->
						<div class="row opening-day">
							<div class="col-md-2">
								<h5>Date</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<option label="Opening Time"></option>
									<option>Closed</option>
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<option label="Closing Time"></option>
									<option>Closed</option>
								</select>
							</div>
						</div>
						<!-- Day / End -->
					</div>
					<!-- Switcher ON-OFF Content / End -->
				</div>
				<!-- Section / End -->

				<!-- Section -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-clock"></i> 강의 가능한 날짜</h3>
						<!-- Switcher -->
						<label class="switch"><input type="checkbox" checked><span class="slider round"></span></label>
					</div>

					<!-- Switcher ON-OFF Content -->
					<div class="switcher-content">

						<!-- Day -->
						<div class="row opening-day">
							<div class="col-md-2">
								<h5>Monday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<option label="Opening Time"></option>
									<option>Closed</option>
									<option>1 AM</option>
									<option>2 AM</option>
									<option>3 AM</option>
									<option>4 AM</option>
									<option>5 AM</option>
									<option>6 AM</option>
									<option>7 AM</option>
									<option>8 AM</option>
									<option>9 AM</option>
									<option>10 AM</option>
									<option>11 AM</option>
									<option>12 AM</option>
									<option>1 PM</option>
									<option>2 PM</option>
									<option>3 PM</option>
									<option>4 PM</option>
									<option>5 PM</option>
									<option>6 PM</option>
									<option>7 PM</option>
									<option>8 PM</option>
									<option>9 PM</option>
									<option>10 PM</option>
									<option>11 PM</option>
									<option>12 PM</option>
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<option label="Closing Time"></option>
									<option>Closed</option>
									<option>1 AM</option>
									<option>2 AM</option>
									<option>3 AM</option>
									<option>4 AM</option>
									<option>5 AM</option>
									<option>6 AM</option>
									<option>7 AM</option>
									<option>8 AM</option>
									<option>9 AM</option>
									<option>10 AM</option>
									<option>11 AM</option>
									<option>12 AM</option>
									<option>1 PM</option>
									<option>2 PM</option>
									<option>3 PM</option>
									<option>4 PM</option>
									<option>5 PM</option>
									<option>6 PM</option>
									<option>7 PM</option>
									<option>8 PM</option>
									<option>9 PM</option>
									<option>10 PM</option>
									<option>11 PM</option>
									<option>12 PM</option>
								</select>
							</div>
						</div>
						<!-- Day / End -->

						<!-- Day -->
						<div class="row opening-day js-demo-hours">
							<div class="col-md-2">
								<h5>Tuesday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
						</div>
						<!-- Day / End -->

						<!-- Day -->
						<div class="row opening-day js-demo-hours">
							<div class="col-md-2">
								<h5>Wednesday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
						</div>
						<!-- Day / End -->

						<!-- Day -->
						<div class="row opening-day js-demo-hours">
							<div class="col-md-2">
								<h5>Thursday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
						</div>
						<!-- Day / End -->

						<!-- Day -->
						<div class="row opening-day js-demo-hours">
							<div class="col-md-2">
								<h5>Friday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
						</div>
						<!-- Day / End -->

						<!-- Day -->
						<div class="row opening-day js-demo-hours">
							<div class="col-md-2">
								<h5>Saturday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
						</div>
						<!-- Day / End -->

						<!-- Day -->
						<div class="row opening-day js-demo-hours">
							<div class="col-md-2">
								<h5>Sunday</h5>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Opening Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time">
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
						</div>
						<!-- Day / End -->

					</div>
					<!-- Switcher ON-OFF Content / End -->

				</div>
				<!-- Section / End -->


				<!-- Section -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-book-open"></i> Pricing</h3>
						<!-- Switcher -->
						<label class="switch"><input type="checkbox" checked><span class="slider round"></span></label>
					</div>

					<!-- Switcher ON-OFF Content -->
					<div class="switcher-content">

						<div class="row">
							<div class="col-md-12">
								<table id="pricing-list-container">
									<tr class="pricing-list-item pattern">
										<td>
											<div class="fm-input pricing-ingredients">
												<input type="text" placeholder="가격" /></div>
										</td>
									</tr>
								</table>
							</div>
						</div>

					</div>
					<!-- Switcher ON-OFF Content / End -->

				</div>
				<!-- Section / End -->


				<a href="#" class="button preview">Preview <i class="fa fa-arrow-circle-right"></i></a>

			</div>
		</div>

	</div>
	<!-- script -->
	<!-- Opening hours added via JS (this is only for demo purpose) -->
	<script>
		$(".opening-day.js-demo-hours .chosen-select").each(function () {
			$(this).append('' +
				'<option></option>' +
				'<option>Closed</option>' +
				'<option>1 AM</option>' +
				'<option>2 AM</option>' +
				'<option>3 AM</option>' +
				'<option>4 AM</option>' +
				'<option>5 AM</option>' +
				'<option>6 AM</option>' +
				'<option>7 AM</option>' +
				'<option>8 AM</option>' +
				'<option>9 AM</option>' +
				'<option>10 AM</option>' +
				'<option>11 AM</option>' +
				'<option>12 AM</option>' +
				'<option>1 PM</option>' +
				'<option>2 PM</option>' +
				'<option>3 PM</option>' +
				'<option>4 PM</option>' +
				'<option>5 PM</option>' +
				'<option>6 PM</option>' +
				'<option>7 PM</option>' +
				'<option>8 PM</option>' +
				'<option>9 PM</option>' +
				'<option>10 PM</option>' +
				'<option>11 PM</option>' +
				'<option>12 PM</option>');
		});
	</script>

	<!-- DropZone | Documentation: http://dropzonejs.com -->
	<script type="text/javascript" src="${contextPath}/resources/scripts/dropzone.js"></script>


</body>