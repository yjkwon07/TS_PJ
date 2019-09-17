<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
  <!-- Basic Page Needs
================================================== -->
  <title>
    <tiles:insertAttribute name="title" />
  </title>
  <meta charset="utf-8" />
  <meta
    name="viewport"
    content="width=device-width, initial-scale=1, maximum-scale=1"
  />

  <!-- CSS
================================================== -->
  <link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
  <link
    rel="stylesheet"
    href="${contextPath}/resources/css/colors/main.css"
    id="colors"
  />
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
  <!-- After, method call complete -->
  <script>
    // Do the normal stuff for this function
    function someMethodIThinkMightBeSlow(startTime) {
      console.log(startTime);

      var duration = performance.now() - startTime;
      console.log("someMethodIThinkMightBeSlow took", duration, "ms");
    }
  </script>

  <!--default passive -->
  <script
    type="text/javascript"
    src="https://unpkg.com/default-passive-events"
  ></script>

  <!--jquery-->
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery/jquery-2.2.0.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery/jquery-ui.min.js"
  ></script>

  <!--jQuery requestAnimationFrame-->
  <!--optimizing view rendering-->
  <script src="${contextPath}/resources/scripts/jquery-custom/min/requestanimationframe.min.js"></script>
  <!--jquery-custom-->
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/develop/chosen.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/magnific-popup.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/mmenu.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/slick.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/rangeslider.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/waypoints.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/counterup.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/min/tooltips.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/jquery-custom/custom.js"
  ></script>

  <!-- Maps -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsLQ-siN80uRGoJqri7Ib9qhYETZm2en8&libraries=places"></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/maps/infobox.min.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/maps/markerclusterer.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/maps/custommarker.js"
  ></script>
  <script
    type="text/javascript"
    src="${contextPath}/resources/scripts/maps/mainMap.js"
  ></script>
</body>
