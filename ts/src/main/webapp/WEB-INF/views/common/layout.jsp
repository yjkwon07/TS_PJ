<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
  <!-- Basic Page Needs
================================================== -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <title>
    <tiles:insertAttribute name="title" />
  </title>

  <tiles:insertAttribute name="css" />
</head>

<body>
  <!-- Wrapper -->
  <div id="wrapper">
    <tiles:insertAttribute name="header" />

    <tiles:insertAttribute name="content" />

    <tiles:insertAttribute name="footer" />
  </div>

</body>

<tiles:insertAttribute name="script" />