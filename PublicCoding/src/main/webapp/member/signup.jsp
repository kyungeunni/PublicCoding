<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>


<html>
<head>
<meta charset="EUC-KR">

<title>Sign up</title>
<script type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../assets/css/su.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">



</head>
<body>


		<legend class="sumain"></legend>


		<!-- <form class="su-email">

<div class="container" data-responsiveness-enabler="">
	<div class="row">
		<div class="col-lg-6 col-sm-8 col-xs-12 col-lg-offset-3 col-sm-offset-2">
			
 </form> -->

		<div class="row row-gap-medium ng-scope">
			<!-- ngView:  -->
			<div data-ng-view="" class="ng-scope">
				<div class="form-box ng-scope" style="padding: 0 35px 35px 35px;">

					<form class="form-horizontal ng-pristine ng-valid ng-valid-email"
						role="form">

						<div class="row">
							<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
								<label for="firstname">아이디</label> <input type="text"
									class="form-control ng-pristine ng-untouched ng-valid"
									id="firstName" placeholder="아이디">
							</div>
							<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
								<label for="lastName">비밀번호</label> <input type="password"
									class="form-control ng-pristine ng-untouched ng-valid"
									id="password" placeholder="비밀번호">
							</div>
						</div>


						<div class="row onboarding-form-group">
							<div class="col-sm-12 col-xs-12">
								<div>
									<label for="email">E-mail</label> <input type="text"
										class="form-control ng-pristine ng-untouched ng-valid ng-valid-email"
										id="email" placeholder="E-mail">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-mm-6 col-xs-12">
								<legend class="sumain"></legend>
								<button type="submit" class="btn btn-block btn-primary">회원가입</button>
							</div>
						</div>
					</form>
					<!-- 
	<div class="hr-with-words">
	
	</div>
	 -->
					<!-- 	<div class="row">
		<div class="col-xs-12">
			<button class="btn btn-block btn-default" data-ng-click="signUpFacebook()">
				<img src="/media/img/logos/third_party/facebook-login.png" alt="Facebook icon" title="Facebook icon">
		<i class="fa fa-facebook-official fa-1g"></i>
				
				Sign up with Facebook
			</button>
		</div>
		
		<div class="col-xs-12">
			<button class="btn btn-block btn-default" data-ng-click="signUpGoogle()">
				<img src="/media/img/logos/third_party/google-login.png" alt="G+ icon" title="G+ icon">
		<i class="fa fa-google-plus-square fa-1g"></i>
				Sign up with Google
			</button>
		</div>
	</div> -->


					<div class="row row-gap-medium ng-scope">
						<br>
						<p class="col-xs-6 col-xs-offset-3 bold text-center">
							이미 가입 하셨나요? <br>
							<br> <a href="signin.jsp"> <input type="button"
								class="button special" value="로그인">
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>





</body>
</html>






















