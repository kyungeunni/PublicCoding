<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="org.json.simple.*"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PUBLIC CODING | 모두가 즐기는 코딩</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="../assets/css/userMain.css">
<link type="text/css" rel="stylesheet" href="../assets/js/cal/fullcalendar.css">
<link type="text/css" rel="stylesheet" href="../assets/js/cal/fullcalendar.print.css">

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.0/fullcalendar.min.js">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.0/fullcalendar.min.css">
<link rel="stylesheet" href=//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.0/fullcalendar.print.css>



</head>
<body>

	<header>
		<h1>
			<a href="main.do"> PUBLIC CODING</a>
		</h1>

		<ul id="gnb">

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-book"></i>온라인 강의</a>
				<ul class="dropdown-menu">
					<li><a href="#">언어</a></li>
					<li><a href="#">데이터베이스</a></li>
					<li><a href="#"> WEB/HTML/CSS</a></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-retweet"></i>오프라인
					스터디</a>
				<ul class="dropdown-menu">
					<li><a href="#">지역별</a></li>
					<li><a href="#">주제별</a></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-file-text-o"></i>게시판</a>
				<ul class="dropdown-menu">
					<li><a href="#">Q&A 게시판</a></li>
					<li><a href="#">자유 게시판</a></li>
				</ul></li>

			<!-- 회원가입-->
			<li class="joinok" data-toggle="modal" data-target="#join"><a
				href="#"><i class="fa fa-user"></i>회원가입</a></li>

			<li class="logininok" data-toggle="modal" data-target="#login"><a
				href="#"><i class="fa fa-sign-in"></i>로그인</a></li>
		</ul>

		<div class="modal fade" id="join" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>PUCO의 회원이 되어 주세요</center>
						</h4>
					</div>
					<div class="modal-body">

						<!-- content goes here -->
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
							<p>
							<p>
							<div class="row">
								<div class="col-mm-6 col-xs-12">
									<button type="submit" class="btn btn-block btn-primary">회원가입</button>
								</div>
							</div>
						</form>

						<div class="row row-gap-medium ng-scope">
							<br>

							<p class="col-xs-6 col-xs-offset-3 bold text-center">
								이미 가입 하셨나요? <br>
								<br> <input type="button" class="btn btn-block btn-primary"
									data-toggle="modal" data-target="#login" data-dismiss="modal" value="로그인">

							</p>
						</div>

					</div>
				</div>
			</div>
		</div>



		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>안녕하세요 PUCO 입니다.</center>
						</h4>
					</div>
					<div class="modal-body">

						<!-- content goes here -->
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


							<p>
							<p>

								<input type="button" class="btn btn-block btn-primary" data-target="#login"
									 data-dismiss="modal" value="로그인">
						</form>

					</div>
				</div>
			</div>
		</div>



	</header>

	<!-- <nav id="nav-main">
	</nav> -->

	<section>
		<article>
			<div class="text" id="content">
				<span>유저프로필</span>
			</div>
		</article>

		<article>
			<div id='calendar'>
				<!-- <span>나의 강의 일정표</span> -->
			</div>
		</article>

		<article>
			<div class="text">
				<span>내가 쓴 글</span>
			</div>
		</article>

		<article>
			<div class="text">
				<span>나의 통계</span>
			</div>
		</article>

		<article>
			<div class="text">
				<span>개설 스터디 내역</span>
			</div>
		</article>

		<article>
			<div class="footer">
				<ul class="icons">
					<li><a href="#">about us</a></li>
				</ul>

				<ul class="copyright">
					<li>&copy;Copyright by SIST-C3.</li>
				</ul>

			</div>
		</article>

	</section>

	
	<!-- Scripts -->

	<script src="../assets/js/cal/fullcalendar.min.js"></script>
	<script src="../assets/js/cal/jquery-1.5.2.min.js"></script>
	<script src="../assets/js/cal/jquery-ui-1.8.11.custom.min.js"></script>
	<script type='text/javascript'>

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		});
		
	});

</script>
	
	
	
	
	
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/modal.js"></script>
	<!-- 회원가입/로그인 팝업창 띄우기 -->
	<script src="../assets/js/popup.js"></script>



	<script type="text/javascript">
		$(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).fadeIn("fast");
				$(this).toggleClass('open');
				$('b', this).toggleClass("caret caret-up");
			}, function() {
				$('.dropdown-menu', this).stop(true, true).fadeOut("fast");
				$(this).toggleClass('open');
				$('b', this).toggleClass("caret caret-up");
			});
		});
	</script>
	
	

</body>
</html>