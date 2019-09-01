<%@ 
	page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
	<div class="cs_quickMenu">
		<ul>
			<li><a href="https://github.com/yjkwon07"><img src="${contextPath}/resources/image/git.png">Git</a></li>
			<li><a href="${contextPath}/"><img src="${contextPath}/resources/image/twitter.png">Twitter</a></li>
		</ul>

		<div class="cs_quickMenu_Recent">
			<h3>최근 본 상품</h3>
			<ul>
				<c:choose>
					<c:when test="${empty quickGoodsList}">
						상품이 없습니다.
					</c:when>
					<c:otherwise>
						<!-- else -->
						<form name="js_form_QuickMenu">
							<c:forEach var="item" items="${quickGoodsList}" varStatus="itemNum">
								<c:choose>
									<c:when test="${itemNum.count == 1}">
										<!--이미지 클릭 시-->
										<div class="cs_Form_QuickMenu_Img" id="js_Form_QuickMenu_Img">
											<!--썸네일 다운로드-->
											<img id="js_img_sticky"
												src="${contextPath}/thumbnails?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
										</div>
									</c:when>
								</c:choose>
								<input type="hidden" name="js_quickMenu_Form_QuickMenu_Goods_Id"
									value="${item.goods_id}" />
								<input type="hidden" name="js_quickMenu_Form_QuickMenu_Goods_FileName"
									value="${item.goods_fileName}" />
							</c:forEach>
						</form>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div class="cs_quickMenu_Subbar">
			<c:choose>
				<c:when test="${ empty quickGoodsList}">
					<p>0/0</p>
				</c:when>
				<c:otherwise>
					<button class="cs_subbar_Previous" id="js_subbar_Previous">이전</button>
					<p class="cs_subbar_Status" id="js_subbar_Status">1</p> / <p>${quickGoodsListNum}</p>
					<button class="cs_subbar_Next" id="js_subbar_Next">다음</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script src="${contextPath}/resources/js/common/quickMenu.js">
		// var CONTEXT_PATH = `${contextPath}`;
	</script>
</body>