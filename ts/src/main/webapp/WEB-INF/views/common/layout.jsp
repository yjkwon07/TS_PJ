<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    request.setCharacterEncoding("utf-8");
%>

<head>
    <!--CSS-->
    <title>
        <tiles:insertAttribute name="title" />
    </title>
    <style>
        @import '${contextPath}/resources/css/layout.css';
    </style>
</head>

<body>
    <div class="cs_body_Content">
        <header>
            <tiles:insertAttribute name="header" />
        </header>
        <div class="cs_body_asid_article_flex">
            <aside>
                <tiles:insertAttribute name="side" />
            </aside>

            <article>
                <tiles:insertAttribute name="body" />
            </article>
        </div>
        <footer>
            <tiles:insertAttribute name="footer" />
        </footer>

        <div class="cs_body_Quickmenu">
            <tiles:insertAttribute name="quickMenu" />
        </div>
    </div>

    <!--JS -->
</body>