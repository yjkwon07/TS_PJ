<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<body>
    <!-- 
        광고글을 3초마다 한 번씩 바뀌고 버튼 클릭 시 이동하게 끔 만들기
    -->
    <div class="cs_main_Ad_Banner">
        <ul>
            <li><img src="${contextPath}/resources/image/main_banner02.jpg"></li>
            <li><img src="${contextPath}/resources/image/main_banner02.jpg"></li>
            <li><img src="${contextPath}/resources/image/main_banner02.jpg"></li>
        </ul>
    </div>
    <c:forEach var="category" items="${goodsMap}">
        <div class="cs_main_Book">
            <c:choose>
                <c:when test="${category.key eq 'bestseller'}">
                    <h3>베스트셀러</h3>
                </c:when>
                <c:when test="${category.key eq 'newbook'}">
                    <h3>새로 출판된 책</h3>
                </c:when>
                <c:when test="${category.key eq 'steadyseller'}">
                    <h3>스테디셀러</h3>
                </c:when>
            </c:choose>
            <c:set var="goods_count" value="0" />
            <c:forEach var="goods_List" items="${category.value}">
                <c:set var="goods_count" value="${goods_count+1}" />
               	<div class="book">
               		<a href ="${contextPath}/goods/goodsDetail?goods_id=${goods_List.goods_id}">
	                	<img src="${contextPath}/thumbnails?goods_id=${goods_List.goods_id}&fileName=${goods_List.goods_fileName}">
	                </a>
	                <p>
	                    ${goods_List.goods_title}
	                </p>
	                <p>
	                    <fmt:formatNumber value="${goods_List.goods_price}" type="number" var="goods_price" />
	                    ${goods_List.goods_price}원
	                </p>
                </div>
                <c:if test="${goods_count==15}">
                        <p>
                          <a href="#">more</a>
                        </p>
                 </c:if>
            </c:forEach>
        	        	
        </div>
    </c:forEach>

</body>