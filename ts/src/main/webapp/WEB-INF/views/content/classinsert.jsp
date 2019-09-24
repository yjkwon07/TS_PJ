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
	
						<!-- class name -->
						<div class="row with-forms">
							<div class="col-md-12">
								<h5>
									강의 명 
									<i class="tip" data-tip-content="강의를 입력해주세요.<br> ex) 직장인 요가 스트레칭"></i>
								</h5>
								<input class="search-field" type="text" value="" name="class_name"/>
							</div>
						</div>

						<!-- class info -->
						<div class="row with-forms">

							<!-- Main Category -->
							<div class="col-md-6">
								<h5>Main Category</h5>
								<select class="js_mainCateoreies_Litener" name="class_maincategories" id="class_maincategories">
									<option label="blank">Select Main Category</option>
								</select>
							</div>

							<!-- Sub Category -->
							<div class="col-md-6">
									<h5>Sub Category</h5>
									<select class="js_subCateoreies_Litener" name="class_subcategories" id="class_subcategories">
									</select>
							</div>
							
							<!-- Teacher name  -->
							<div class="col-md-6">
								<h5>Teacher name</h5>
								<input type="text" value='${login.user_name}' name="class_teacher_name" disabled>
								<input type="hidden" value='${login.user_name}' name="class_teacher_name"/>
								<input type="hidden" value='${login.user_id}' name="user_id"/>
							</div>

							<!-- Summary -->
							<div class="col-md-6">
								<h5>
									Summary
									<i class="tip" data-tip-content="전반적인 강의 내용을 적어주세요 <br> ex) 지친 하루 가벼운 스트레칭으로 피로를 푸세요."></i>
								</h5>
								<input type="text" name="class_summary">
							</div>

							<!-- YouTube Link -->
							<div class="col-md-6">
								<h5>
									YouTube Link
									<i class="tip"
										data-tip-content="해당강의 유튜브로 홍보해 보세요. <br> !만약 없다면 빈칸으로 남겨 주세요."></i>
								</h5>
								<input type="text" placeholder="https://www.youtube.com/"  name="class_youtube">
							</div>

							<!-- Maximum student -->
							<div class="col-md-6">
								<h5>
									수강 최대 인원 수
									<i class="tip" data-tip-content="최대 수강인원을 적어주세요."></i>
								</h5>
								<input type="text" placeholder="15" name="class_student_cnt">
							</div>
						</div>
						<!-- class info / End -->

					</div>
					<!-- Section / End -->

					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Map -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-location"></i> 강의 장소</h3>
						</div>

						<div id="map-container" class="fullwidth-home-map">
						
							<div id="map" data-map-zoom="9">
							<!-- map goes here -->
							</div>

							<!-- place search -->
							<div class="main-search-inner">
						
								<div class="container">
						
									<div class="row">
						
										<div class="col-md-11">
						
											<div class="main-search-input">
						
												<div class="main-search-input-item">
													<input claas="js_PlaceName" type="text" placeholder="강의 장소를 입력해 주세요." value="" />
												</div>
						
												<button class="js_PlaceSearchButton">Search</button>
						
												<ul id="search-list"></ul>
						
											</div>
										</div>
									</div>
								</div>
						
							</div>
						
							<!-- Scroll Enabling Button -->
							<a href="#" id="scrollEnabling" title="Enable or disable scrolling on map">Enable Scrolling</a>
						</div>

						<input type="hidden" value="30.2" name="class_lat"> 
						<input type="hidden" value="122.2" name="class_lng">
					</div>
					<!-- Section / End -->


					<!-- Section -->
					<div class="add-listing-section margin-top-45">

						<!-- Headline -->
						<div class="add-listing-headline">
							<h3><i class="sl sl-icon-picture"></i> 강의 사진 </h3>
							<h5><i class="tip" data-tip-content="강의를 소개할 사진을 올려주세요."></i> </h5>
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
								<i class="sl sl-icon-docs"></i> 강의 내용 
							</h3>
						</div>

						<!-- Description -->
						<div class="form">
							<h5>상세 설명 <i class="tip" data-tip-content="강의 세부 내용을 입력해 주세요."></i> </h5>
							<textarea name="class_content" cols="40" rows="3" id="class_content"></textarea>
						</div>
					</div>
					<!-- Section / End -->

				</div>
				<!-- Section / End -->

				<!-- Section -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-docs"></i> 강의 시작일 / 종료일
						</h3>
					</div>
					
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
									<option value="2AM">2 AM</option>
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
				</div>

				<!-- Section -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-clock"></i> 강의 가능한 날짜</h3>
					</div>

					<!-- Switcher ON-OFF Content -->
					<div class="switcher-content">
						<div id="datepicker"></div>
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
									<option value="2AM">2 AM</option>
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
									<option value="2AM">2 AM</option>
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
				<i class="fa fa-arrow-circle-right"></i><input type="submit" value='강의 개설'/>
		
			</div>
		</div>

	</div>
</form>
<input class= "js_categories" type="hidden" value=${categories_dict} >
</body>
<script src="${contextPath}/resources/scripts/classinsert/categories.js"/>


