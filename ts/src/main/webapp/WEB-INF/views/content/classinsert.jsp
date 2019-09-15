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

<form action="/lecture/regist" method="POST">
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
								<input class="search-field" type="text" value="" name="class_name"/>
							</div>
						</div>

						<!-- Row -->
						<div class="row with-forms">

							<!-- Status -->
							<div class="col-md-6">
								<h5>Main Category</h5>
								<select class="mainCateoreies_Litener" name="class_maincategories" id="class_maincategories">
									<option label="blank">Select Main Category</option>
									<option value="design">디자인</option>
									<option value="it">IT</option>
									<option value="beauty">뷰티</option>
									<option value="video">영상</option>
									<option value="forLanguage">외국어</option>
									<option value="music">음악</option>
								</select>
							</div>
							
							<div class="col-md-6">
									<h5>Sub Category</h5>
									<select class="subCateoreies_Litener" name="class_subcategories" id="class_subcategories">
									</select>
							</div>
							<!-- Type -->
							<div class="col-md-6">
								<h5>
									Teacher name
									<i class="tip" 
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" value='${login.user_name}' name="class_teacher_name" disabled>
								<input type="hidden" value='${login.user_name}' name="class_teacher_name"/>
								<input type="hidden" value='${login.user_id}' name="user_id"/>
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									Summary
									<i class="tip"
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" placeholder="Keywords should be separated by commas" name="class_summary">
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									YouTube Link
									<i class="tip"
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" placeholder="Keywords should be separated by commas" name="class_youtube">
							</div>

							<!-- Type -->
							<div class="col-md-6">
								<h5>
									수강 최대 인원 수
									<i class="tip"
										data-tip-content="Maximum of 15 keywords related with your business"></i>
								</h5>
								<input type="text" placeholder="Keywords should be separated by commas" name="class_student_cnt">
							</div>
						</div>
						<!-- Row / End -->

					</div>
					<!-- Section / End -->

					<!-- Section -->

					<input type="hidden" value="30.2" name="class_lat"> 
					<input type="hidden" value="122.2" name="class_lng">

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
													<input id="search" type="text" placeholder="What are you looking for?"
														value="" />
												</div>
												<ul id="search-list"></ul>
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
							<img alt="" src="">
							<input type="hidden" value="image.png" name="class_image">
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
							<textarea class="WYSIWYG" name="class_content" cols="40" rows="3" id="class_content"
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
								<select class="chosen-select" data-placeholder="Opening Time" >
									<option label="Opening Time"></option>
									<option value="">Closed</option>
									<option value="1AM">1 AM</option>
									<option value="2AM</">2 AM</option>
									<option value="3AM">3 AM</option>
									<option value="4AM">4 AM</option>
									<option value="5AM">5 AM</option>
									<option value="6AM">6 AM</option>
									<option value="7AM">7 AM</option>
									<option value="8AM">8 AM</option>
									<option value="9AM">9 AM</option>
									<option value="10AM">10 AM</option>
									<option value="11AM">11 AM</option>
									<option value="12AM">12 AM</option>
									<option value="1PM">1 PM</option>
									<option value="2PM">2 PM</option>
									<option value="3PM">3 PM</option>
									<option value="4PM">4 PM</option>
									<option value="5PM">5 PM</option>
									<option value="6PM">6 PM</option>
									<option value="7PM">7 PM</option>
									<option value="8PM">8 PM</option>
									<option value="9PM">9 PM</option>
									<option value="10PM">10 PM</option>
									<option value="11PM">11 PM</option>
									<option value="12PM">12 PM</option>
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time" >
									<option label="Closing Time"></option>
									<option value="">Closed</option>
									<option value="1AM">1 AM</option>
									<option value="2AM</">2 AM</option>
									<option value="3AM">3 AM</option>
									<option value="4AM">4 AM</option>
									<option value="5AM">5 AM</option>
									<option value="6AM">6 AM</option>
									<option value="7AM">7 AM</option>
									<option value="8AM">8 AM</option>
									<option value="9AM">9 AM</option>
									<option value="10AM">10 AM</option>
									<option value="11AM">11 AM</option>
									<option value="12AM">12 AM</option>
									<option value="1PM">1 PM</option>
									<option value="2PM">2 PM</option>
									<option value="3PM">3 PM</option>
									<option value="4PM">4 PM</option>
									<option value="5PM">5 PM</option>
									<option value="6PM">6 PM</option>
									<option value="7PM">7 PM</option>
									<option value="8PM">8 PM</option>
									<option value="9PM">9 PM</option>
									<option value="10PM">10 PM</option>
									<option value="11PM">11 PM</option>
									<option value="12PM">12 PM</option>
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
								<select class="chosen-select" data-placeholder="Opening Time" >
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
								<select class="chosen-select" data-placeholder="Opening Time" >
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time" >
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
								<select class="chosen-select" data-placeholder="Opening Time" >
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time" >
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
								<select class="chosen-select" data-placeholder="Opening Time" >
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time" >
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
								<select class="chosen-select" data-placeholder="Opening Time" >
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time" >
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
								<select class="chosen-select" data-placeholder="Opening Time" >
									<!-- Hours added via JS (this is only for demo purpose) -->
								</select>
							</div>
							<div class="col-md-5">
								<select class="chosen-select" data-placeholder="Closing Time" >
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
												<input type="text" placeholder="가격" name="class_price" /></div>
										</td>
									</tr>
								</table>
							</div>
						</div>

					</div>
					<!-- Switcher ON-OFF Content / End -->

				</div>
				<!-- Section / End -->
				<input type="submit" value="제출"/><i class="fa fa-arrow-circle-right"></i>
		
			</div>
		</div>

	</div>
</form>
</body>

<script>
	var categories_dict = ${categories_dict};
	var mainCateoreies_Liteners = document.querySelector(".mainCateoreies_Litener");
	var subCateoreies_Litener = document.querySelector(".subCateoreies_Litener");
	mainCateoreies_Liteners.addEventListener("change", function (event) {
		subCateoreies_Litener.innerHTML = "";
		var sub_categories_arr = categories_dict[this.value];
		for (var sub_index = 0; sub_index < sub_categories_arr.length; sub_index++) {
			var option = document.createElement('option');
			option.value = sub_categories_arr[sub_index];
			option.text = sub_categories_arr[sub_index];
			subCateoreies_Litener.appendChild(option);
		}
	})
</script>