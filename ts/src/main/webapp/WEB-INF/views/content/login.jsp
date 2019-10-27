<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="sign-in-form style-1">
		<form action="/user/loginPost" method="post">
			<div class="form-gorup has-feedback">
				<input type="text" name="user_id" class="form-control" placeholder="USER ID">
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="user_pw" class="form-control" placeholder="Password">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-row">
				<div class="checkboxes margin-top-10">
					<input id="remember" type="checkbox" name="useCookie">
					<label for="remember">Remember Me</label>
				</div>
				<input type="submit" class="button border margin-top-5"/>
			</div>
		</form>
	</div>
</div>

