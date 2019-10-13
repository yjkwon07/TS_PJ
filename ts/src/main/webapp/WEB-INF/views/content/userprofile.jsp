<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Content
================================================== -->
<div class="container">
    <div class="row sticky-wrapper">

        <!-- Sidebar
                ================================================== -->
        <div class="col-lg-4 col-md-4 margin-top-0">

        </div>
        <!-- Sidebar / End -->

        <!-- Content
        ================================================== -->
        <div class="col-lg-8 col-md-8 padding-left-30">

            <c:if test="${userprofileVO['userVO'].user_auth == 1}">
            <h3 class="margin-top-0 margin-bottom-40">${userprofileVO['userVO'].user_id} 등록한 강좌 목록</h3>
            	<!-- Listings Container -->
	            <div class="row">
	            <c:forEach var="lectureVO" items="${userprofileVO['enrolmentLectureVO']}">
		            <!-- Listing Item -->
		                <div class="col-lg-12 col-md-12">
		                    <div class="listing-item-container list-layout">
		                        <a href="/lecture/${lectureVO.class_id}" class="listing-item">
		
		                            <!-- Image -->
		                            <div class="listing-item-image">
		                                <img src="images/listing-item-01.jpg" alt="">
		                                <span class="tag">${lectureVO.class_maincategories}/${lectureVO.class_subcategories}</span>
		                            </div>
		
		                            <!-- Content -->
		                            <div class="listing-item-content">
		                                <div class="listing-item-inner">
		                                	<h4>${lectureVO.class_teacher_name}</h4>
		                                    <h3>${lectureVO.class_name}</h3>
		                                    <span>${lectureVO.class_summary}</span>
		                                </div>
		                            </div>
		                        </a>
		                    </div>
		                </div>
		            <!-- Listing Item / End -->
	            </c:forEach>
	            
	            <div class="col-md-12 browse-all-user-listings">
	                <a href="#">Browse All Listings <i class="fa fa-angle-right"></i> </a>
	            </div>
	
	        	</div>
	            <!-- Listings Container / End -->
            </c:if>

            
            <c:if test="${userprofileVO['userVO'].user_auth == 2}">
            <h3 class="margin-top-0 margin-bottom-40">${userprofileVO['userVO'].user_id} 강의 개설 목록</h3>
            
            <div class="row">
            <c:forEach var="tutorLectureVO" items="${userprofileVO['tutorLectureVO']}">
            	<!-- Listing Item -->
                <div class="col-lg-12 col-md-12">
                    <div class="listing-item-container list-layout">
                        <a href="/lecture/${tutorLectureVO.class_id}" class="listing-item">

                            <!-- Image -->
                            <div class="listing-item-image">
                                <img src="images/listing-item-01.jpg" alt="">
                                <span class="tag">${tutorLectureVO.class_maincategories}/${tutorLectureVO.class_subcategories}</span>
                            </div>

                            <!-- Content -->
                            <div class="listing-item-content">
                                <div class="listing-item-inner">
                                    <h3>${tutorLectureVO.class_name}</h3>
                                    <span>${tutorLectureVO.class_summary}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
		        <!-- Listing Item / End -->
            </c:forEach>
            </div>
            
            <h3 class="margin-top-0 margin-bottom-40">${userprofileVO['userVO'].user_id} 등록한 강좌 목록</h3>
            	<!-- Listings Container -->
	            <div class="row">
	            <c:forEach var="lectureVO" items="${userprofileVO['enrolmentLectureVO']}">
		            <!-- Listing Item -->
		                <div class="col-lg-12 col-md-12">
		                    <div class="listing-item-container list-layout">
		                        <a href="/lecture/${lectureVO.class_id}" class="listing-item">
		
		                            <!-- Image -->
		                            <div class="listing-item-image">
		                                <img src="images/listing-item-01.jpg" alt="">
		                                <span class="tag">${lectureVO.class_maincategories}/${lectureVO.class_subcategories}</span>
		                            </div>
		
		                            <!-- Content -->
		                            <div class="listing-item-content">
		                                <div class="listing-item-inner">
		                                	<h4>${lectureVO.class_teacher_name}</h4>
		                                    <h3>${lectureVO.class_name}</h3>
		                                    <span>${lectureVO.class_summary}</span>
		                                </div>
		                            </div>
		                        </a>
		                    </div>
		                </div>
		            <!-- Listing Item / End -->
	            </c:forEach>
	            
	            <div class="col-md-12 browse-all-user-listings">
	                <a href="#">Browse All Listings <i class="fa fa-angle-right"></i> </a>
	            </div>
	
	        	</div>
	            <!-- Listings Container / End -->
	            
	            
            </c:if>
	           	
        </div>
    </div>
</div>