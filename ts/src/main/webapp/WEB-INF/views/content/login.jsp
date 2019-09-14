<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/user/loginPost" method="post">
		<div class="form-gorup has-feedback">
			<input type="text" name="user_id" class="form-control" placeholder="USER ID">
			<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="password" name="user_pw" class="form-control" placeholder="Password">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		<div class="row">
			<div class="col-xs-8">
				<div class="checkbox icheck">
					<label>
						<input type="checkbox" name="useCookie"> Remember Me
					</label>
				</div>
			</div><!-- /.col -->
			<div class="col-xs-4">
				<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
			</div><!-- /.col -->
		</div>
	</form>
	<form action="/user/logout" method="post">
		<button type="submit" class="btn btn-primary btn-block btn-flat">logout</button>
		
	</form>
</body>
</html>