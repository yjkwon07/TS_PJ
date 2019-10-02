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

		<div class="col-lg-12">

			<div id="add-listing" class="separated-form">

				<!--  Thank you open the class -->
				<div class="add-listing-section">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3> <i class="sl sl-icon-doc"></i> Thank you open the class </h3>
					</div>

					<!-- class name -->
					<div class="row with-forms">
						<div class="col-md-12">
							<h5>
								강의 명
								<i class="tip" data-tip-content='강의를 입력해주세요.<br> ex) 직장인 요가 스트레칭'></i>
							</h5>
							<input type="text" class="js_class_name" />
						</div>
					</div>

					<!-- class info -->
					<div class="row with-forms">
						<!-- Main Category -->
						<div class="col-md-6">
							<h5>Main Category</h5>
							<select class="js_mainCateoreies_Litener">
								<option label="blank">Select Main Category</option>
							</select>
						</div>

						<!-- Sub Category -->
						<div class="col-md-6">
							<h5>Sub Category</h5>
							<select class="js_subCateoreies_Litener"></select>
						</div>

						<!-- Teacher name  -->
						<div class="col-md-6">
							<h5>Teacher name</h5>
							<input type="text" value='${login.user_name}' disabled>
							<input type="hidden" class="js_class_teacher_name" value='${login.user_name}' />
							<input type="hidden" class="js_user_id" value='${login.user_id}'  />
						</div>

						<!-- Summary -->
						<div class="col-md-6">
							<h5>
								Summary
								<i class="tip" data-tip-content='전반적인 강의 내용을 적어주세요 <br> ex) 지친 하루 가벼운 스트레칭으로 <br> 피로를 푸세요.''></i>
							</h5>
							<input type="text" class="js_class_summary">
						</div>
							
						<!-- YouTube Link -->
						<div class="col-md-6">
							<h5>
								YouTube Link
								<i class="tip" data-tip-content=' 해당강의 유튜브로 홍보해 보세요. <br> <i class="fa fa-warning"></i> 홍보 영상이 없으면 빈칸으로 남겨 주세요.'></i>
							</h5>
							<input type="url" class="js_class_youtube" placeholder="https://www.youtube.com/">
						</div>

						<!-- Maximum student -->
						<div class="col-md-6">
							<h5>
								수강 최대 인원 수
								<i class="tip" data-tip-content='최대 수강인원을 적어주세요.'></i>
							</h5>
							<input type="number" placeholder="15" class="js_class_student_cnt">
						</div>
					</div>
					<!-- class info / End -->

				</div>
				<!-- Thank you open the class / End -->

				<!-- 강의 사진 -->
				<div class="add-listing-section margin-top-45">
					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-picture"></i> 강의 사진<i class="tip" data-tip-content='강의를 소개할 사진을 올려주세요. <br> <i class="fa fa-warning"></i> png파일을 권장합니다.<br> <i class="fa fa-warning"></i> 이미지의 최대 크기는 2MB입니다. '></i>
						</h3>
					</div>

					<!-- Dropzone -->
					<div class="submit-section">
						<form action="upload" class="dropzone" name="file" id="dropzoneFrom" enctype="multipart/form-data">
							<div class="dz-default dz-message">
								<span><i class="sl sl-icon-plus"></i> Click here or drop files to upload</span>
							</div>
						</form>
					</div>

					<button class="js_allUpload button medium" id="submit-all"><i class="fa fa-cloud-upload"></i>All Upload</button>
					<button class="js_allDelete button medium" id="submit-all"><i class="fa fa-trash-o"></i>All Delete</button>
					<i class="tip" data-tip-content='강의를 소개할 메인 사진을 선택해 주세요. <br> <i class="fa fa-warning"></i> 업로드된 파일만 선택이 가능합니다.'></i>

					<!--template-->
					<!-- upload after image thumbnail-->
					<div class="dashboard-list-box margin-top-0">
						<div class="js_previews-template">
						</div>
					</div>
					<div>
						메인 이미지
						<span ><img class="js_main_imgae" src=""/></span>
						<input hidden class="js_class_image class_image" value=""/>
					</div>
				</div>
				<!-- 강의 사진 / End -->

				<!-- 강의 내용 -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-docs"></i> 강의 내용
						</h3>
					</div>

					<!-- Description -->
					<div class="form">
						<h5>상세 설명 <i class="tip" data-tip-content='강의 세부 내용을 입력해 주세요.'></i> </h5>
						<textarea cols="40" rows="3" class="js_class_content"></textarea>
					</div>

				</div>
				<!-- 강의 내용 / End -->

				<!-- 강의 장소 -->
				<div class="add-listing-section margin-top-45">

					<!-- Map -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-location"></i> 강의 장소</h3>
					</div>

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
												<input class="js_PlaceName" type="text" placeholder="강의 장소를 입력해 주세요." value="" />
												
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
					</div>
				</div>
				<!-- 강의 장소 / End -->

				<!-- 강의 시작일 / 종료일 -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-docs"></i> 강의 시작일 / 종료일
						</h3>
					</div>

					<div class="row opening-day">
						<div class="col-md-2">
							<h5>강의 시작일</h5>
						</div>
						<div class="col-md-5">
							<input class="js_class_startday js_flatpickr_basic" />
						</div>
					</div>

					<div class="row opening-day">
						<div class="col-md-2">
							<h5>강의 종료일</h5>
						</div>
						<div class="col-md-5">
							<input class="js_class_endday js_flatpickr_basic" />
						</div>
					</div>
				</div>
				<!-- 강의 시작일 / 종료일 / end-->

				<!-- 강의 날짜 -->
				<div class="add-listing-section margin-top-45">
				
					<!-- Headline -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-clock"></i> 강의 가능한 날짜</h3>
					</div>

					<!-- Day -->
					<div class="js_day">

					</div>
					<!-- Day / End -->
				</div>
				<!-- 강의 날짜/ End -->

				<!-- 가격 -->
				<div class="add-listing-section margin-top-45">
					
					<!-- Headline -->
					<div class="add-listing-headline">
						<h3><i class="sl sl-icon-book-open"></i> Pricing</h3>
						<div class="row">
								<div class="col-md-12">
									<table id="pricing-list-container">
										<tr class="pricing-list-item pattern">
											<td>
												<div class="fm-input pricing-ingredients">
													<input type="number" placeholder="가격" class="js_class_price" />
												</div>
											</td>
										</tr>
									</table>
								</div>
						</div>
					</div>

				</div>
				<!-- 가격 / End -->
			</div>
			<!-- Section / End -->

			<a href="#" role="button" class="button medium border js_submit"><i class="fa fa-arrow-circle-right"></i>강의 개설</a>
		</div>
		<!-- col-lg-12 -->
	</div>
	<!-- row -->
</div>

<!-- 가져온 후 remove-->
<input hidden class="js_class_id" value="${class_id}">
<input class= "js_categories" type="hidden" value=${categories_dict} />





