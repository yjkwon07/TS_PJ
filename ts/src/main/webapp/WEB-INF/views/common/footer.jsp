<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<body>
<!-- Footer
================================================== -->
	<div id="footer">
		<!-- Main -->
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-sm-6">
					<img class="footer-logo" src="${contextPath}/resources/images/logo.png" alt="">
					<br><br>
					<p>Morbi convallis bibendum urna ut viverra. Maecenas quis consequat libero, a feugiat eros. Nunc ut
						lacinia tortor morbi ultricies laoreet ullamcorper phasellus semper.</p>
				</div>

				<div class="col-md-4 col-sm-6 ">
					<h4>Helpful Links</h4>
					<ul class="footer-links">
						<li><a href="#">Login</a></li>
						<li><a href="#">Sign Up</a></li>
						<li><a href="#">My Account</a></li>
					</ul>

					<ul class="footer-links">
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">How It Works</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>

				<div class="col-md-3  col-sm-12">
					<h4>Contact Us</h4>
					<div class="text-widget">
						<span>12345 Little Lonsdale St, Melbourne</span> <br>
						E-Mail:<span> <a href="#">office@example.com</a> </span><br>
					</div>

					<ul class="social-icons margin-top-20">
						<li><a class="facebook" href="#"><i class="icon-facebook"></i></a></li>
						<li><a class="twitter" href="#"><i class="icon-twitter"></i></a></li>
						<li><a class="gplus" href="#"><i class="icon-gplus"></i></a></li>
						<li><a class="vimeo" href="#"><i class="icon-vimeo"></i></a></li>
					</ul>

				</div>

			</div>

			<!-- Copyright -->
			<div class="row">
				<div class="col-md-12">
					<div class="copyrights">© 2019 TS_PJ. All Rights Reserved.</div>
				</div>
			</div>

		</div>

	</div>
	<!-- Footer / End -->

	<!-- Back To Top Button -->
	<div id="backtotop"><a href="#"></a></div>
</body>