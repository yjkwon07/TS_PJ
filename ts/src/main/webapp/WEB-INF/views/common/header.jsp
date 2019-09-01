<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
    <div class="cs_header_Logo">
        <a href="${contextPath}/main/main.do">
            <img class="cs_main_Logo" alt="메인로고" src="${contextPath}/resources/image/main.png" />
        </a>
    </div>
    <div class="cs_header_Link">
        <ul>
            <c:choose>
                <c:when test="${isLogOn == true and not empty memberInfo}">
                    <li>환영합니다!!</li>
                    <li><a href="${contextPath}/">로그아웃</a></li>
                    <li><a href="${contextPath}/">마이페이지</a></li>
                    <li><a href="${contextPath}/">장바구니</a></li>
                    <li><a href="${contextPath}/">주문배송</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${contextPath}/">로그인</a></li>
                    <li><a href="${contextPath}/">회원가입</a></li>
                </c:otherwise>
            </c:choose>
            <li>
                <a href="${contextPath}/">고객센터</a>
            </li>
            <c:if test="${isLogOn==true and memberInfo.member_id=='admin'}">
                <li>
                    <a href="${contextPath}/">관리자</a>
                </li>
            </c:if>
        </ul>
    </div>
    
    <!-- SearchBar -->
    <div class="cs_header_Search">
        <form name="formSearch" action="${contextPath}/">
            <input name="searchWord" type="text" placeholder="Search">
            <!-- 돋보기이미지로 수정하기 -->
            <button name="search" type="submit">검색</button>
        </form>
    </div>
    <!-- 
        cs_header_Search에 ajax로 검색을 통하여 
        cs_header_Suggest영역에 결과를 계속해서 나타내기
    -->
    <div class="cs_header_Suggest">
        <div class="cs_header_SuggestList"></div>
    </div> 
    <script src="${contextPath}/resources/js/common/header.js"></script>
</body>