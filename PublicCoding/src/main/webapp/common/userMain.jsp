<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">

</head>

<body>

	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
						<div class="well profile">
							<div class="col-sm-6 col-md-4">
								<img src="http://img.visualdive.co.kr/sites/2/2015/10/gisa2.jpg"
									alt="" width="160" height="140"
									class="img-rounded" />
							</div>
							<div class="col-sm-6 col-md-8">
								<h4>User Id</h4>
								<p>
									<i class="glyphicon glyphicon-envelope"></i> email@email. <br />
									<i class="glyphicon glyphicon-globe"></i> www.jquery2dotnet.com <br /> 
									<i class="glyphicon glyphicon-gift"></i>June 02, 1988
									
									<p><strong>Skills: </strong>
                        <span class="tags">html5</span> 
                        <span class="tags">css3</span>
                        <span class="tags">jquery</span>
                        <span class="tags">bootstrap3</span>
                    </p>
									
									
								<br /><br /><br />
							</div>
							<div class="col-xs-12 divider text-center">
								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong> 20 </strong>
									</h2>
									<p>
										<small>답변수</small>
									</p>
									<button class="btn btn-success btn-block">
										<span class="fa fa-plus-circle"></span> 답변 보기
									</button>
								</div>

								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong>245</strong>
									</h2>
									<p>
										<small>질문수</small>
									</p>
									<button class="btn btn-info btn-block">
										<span class="fa fa-user"></span> 질문 보기
									</button>
								</div>

								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong>245</strong>
									</h2>
									<p>
										<small>수강강의</small>
									</p>
									<button class="btn btn-info btn-block">
										<span class="fa fa-user"></span> 수강강의 보기
									</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</article>

		<article>
			<div id='calendar'>calendar</div>
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

	<script type='text/javascript'>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2016-01-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2016-01-01'
				},
				{
					title: 'Long Event',
					start: '2016-01-07',
					end: '2016-01-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-01-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-01-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2016-01-11',
					end: '2016-01-13'
				},
				{
					title: 'Meeting',
					start: '2016-01-12T10:30:00',
					end: '2016-01-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2016-01-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2016-01-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2016-01-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2016-01-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2016-01-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2016-01-28'
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