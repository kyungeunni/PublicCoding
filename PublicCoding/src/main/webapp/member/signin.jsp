<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign In</title>
<script type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="assets/css/su.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

	<center>
		<legend></legend>

			<form class="su-email">

			<div class="container">
				<div class="row">
					<div
						class="col-lg-6 col-sm-8 col-xs-12 col-lg-offset-3 col-sm-offset-2">
						</div>
						</div>
						</div>
		</form>

		<div data-ng-controller="accountAuth"
			class="row row-gap-medium ng-scope">
			<!-- ngView:  -->
			<div data-ng-view="" class="ng-scope">
				<div class="form-box ng-scope" style="padding: 0 35px 35px 35px;">

					<form class="form-horizontal ng-pristine ng-valid ng-valid-email"
						role="form">


						<div class="row onboarding-form-group">
							<div class="col-sm-12 col-xs-12">
								<div>
									<label for="email">아이디</label> <input type="text"
										data-ng-model="email"
										class="form-control ng-pristine ng-untouched ng-valid ng-valid-email"
										id="email" placeholder="아이디">
								</div>
							</div>
						</div>

						<div class="row onboarding-form-group">
							<div class="col-md-12 col-xs-12">
								<div
									data-ng-class="{'has-error': contactInfoErrors.setsPassword}">
									<label for="password">비밀번호</label> <input type="password"
										data-ng-model="password"
										class="form-control ng-pristine ng-untouched ng-valid"
										id="password" placeholder="비밀번호">
								</div>
							</div>
						</div>
						<p></p>
						<div class="row">
							<div class="col-mm-5 col-xs-12">
								<a href="main.do">
									<button type="submit" class="btn btn-block btn-primary">로그인</button>
								</a>
							</div>
						</div>
					</form>

					<div class="hr-with-words"></div>




				</div>
			</div>
		</div>


	</center>



</body>
</html>




