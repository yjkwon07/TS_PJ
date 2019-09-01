<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<nav>
    <ul>
        <c:choose>
            <c:when test="${side_menu=='admin_mode'}">
                <li>
                    <h3>주요기능</h3>
                    <ul>
                        <li><a href="${contextPath}/">상품관리</a></li>
                        <li><a href="${contextPath}/">주문관리</a></li>
                        <li><a href="${contextPath}/">회원관리</a></li>
                        <li><a href="${contextPath}/">배송관리</a></li>
                        <li><a href="${contextPath}/">게시판관리</a></li>
                    </ul>
                </li>
            </c:when>
            <c:when test="${side_menu=='my_page'}">
                <li>
                    <h3>주문내역</h3>
                    <ul>
                        <li><a href="${conetextPath}/">주문내역/배송 조회</a></li>
                        <li><a href="${conetextPath}/">반퓸/교환 신청 및 조회</a></li>
                        <li><a href="${conetextPath}/">최소 주문 내역</a></li>
                        <li><a href="${conetextPath}/">세금계산서</a></li>
                    </ul>
                </li>
                <li>
                    <h3>정보내역</h3>
                    <ul>
                        <li><a href="${contextPath}/">회원정보관리</a></li>
                        <li><a href="${contextPath}/">나의 주소록</a></li>
                        <li><a href="${contextPath}/">개인정보 동의내역</a></li>
                        <li><a href="${contextPath}/">회원탈퇴</a></li>
                    </ul>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <h3>국내외 도서</h3>
                    <ul>
                        <li><a href="${contextPath}/">IT/인터넷</a></li>
                        <li><a href="${contextPath}/">경제/경영</a></li>
                        <li><a href="${contextPath}/">대학교재</a></li>
                        <li><a href="${contextPath}/">자기계발</a></li>
                        <li><a href="${contextPath}/">자연과학/공학</a></li>
                        <li><a href="${contextPath}/">역사/인문학</a></li>
                    </ul>
                </li>
                <li>
                    <h3>음반</h3>
                    <ul>
                        <li><a href="${contextPath}/">가요</a></li>
                        <li><a href="${contextPath}/">록</a></li>
                        <li><a href="${contextPath}/">클래식</a></li>
                        <li><a href="${contextPath}/">뉴에이지</a></li>
                        <li><a href="${contextPath}/">재즈</a></li>
                        <li><a href="${contextPath}/">기타</a></li>
                    </ul>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>

<!-- 공지사항 DB 연결-->
<div class="cs_side_notice">
    <h2>공지사항</h2>
    <ul>
        <li><a href="${contextPath}/">공지사항입니다.</a></li>
    </ul>
</div>