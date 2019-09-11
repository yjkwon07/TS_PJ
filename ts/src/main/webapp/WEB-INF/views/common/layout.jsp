<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
	<!-- Basic Page Needs
================================================== -->
	<title>
		<tiles:insertAttribute name="title" />
	</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
================================================== -->
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/colors/main.css" id="colors">

</head>

<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<tiles:insertAttribute name="header" />


		<tiles:insertAttribute name="content" />


		<tiles:insertAttribute name="footer" />

	</div>

	<!-- Scripts
================================================== -->
	<!--default passive -->
	<script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>

	<script type="text/javascript" src="${contextPath}/resources/scripts/jquery-2.2.0.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/mmenu.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/chosen.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/rangeslider.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/magnific-popup.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/waypoints.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/counterup.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/tooltips.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/custom.js"></script>

	<!-- Google Autocomplete -->
	<script>
		function someMethodIThinkMightBeSlow() {
			var startTime = performance.now();

			// Do the normal stuff for this function

			var duration = performance.now() - startTime;
			console.log(`someMethodIThinkMightBeSlow took ${duration}ms`);
		}
	</script>

	<!-- Maps -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsLQ-siN80uRGoJqri7Ib9qhYETZm2en8&libraries=places"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/maps/infobox.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/maps/markerclusterer.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/maps/custommarker.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/scripts/maps/mainMap.js"></script>

</body>