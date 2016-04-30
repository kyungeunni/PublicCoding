<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">
</head>

<body>
	<section>
		<article>

			<div class="container">
				<div class="row">
					<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
						<div class="well profile">
							<div class="col-sm-6 col-md-4 profilepic" >
													
							<img src="resources/userprofiles/${vo.mimageURL }"
								alt="" width="160" height="160" class="img-rounded">
							
								
								<div id="modifybtn">								
								<c:if test="${sessionScope.mno==vo.mno}"><input type="button"
								class="btn btn-default" name="list" id="list" onclick="window.location.href='user_update.do?mno=${sessionScope.mno }'"
								value="수정" size=50></c:if>
								</div>
								
								
					</div>
							<div class="col-sm-6 col-md-8">
								<h3>${vo.mid }</h3>
								<p>
									<i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;${vo.memail } <br />
									<i class="glyphicon glyphicon-gift"></i>&nbsp;가입일: <fmt:formatDate value="${vo.mdate}" pattern="yyyy년 MM월 dd일"/><br /> 
									<i class="glyphicon glyphicon-globe"></i> &nbsp;www.jquery2dotnet.com <br /> 
									<i class="fa fa-eye" aria-hidden="true">&nbsp;포스트 뷰:</i><br /> 
									<i class="fa fa-clock-o" aria-hidden="true">&nbsp;최근 접속시간: ${login }</i><br /> 
									
									<p><strong><font color="red"><i class="fa fa-heart" aria-hidden="true"></i></font>&nbsp;favorite: </strong>
                        <c:forEach var="tag" items="${tags }">
                        <span class="tags">${tag }</span></c:forEach> 
   
                    </p>
									
									
								<br /><br /><br />
							</div>
							<div class="col-xs-12 divider text-center">
								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong> ${vo.mpoint }  </strong>
									</h2>
									<p>
										<small>PUCO점수</small>
									</p>
									<button class="btn btn-success btn-block">
										<span class="fa fa-plus-circle"></span> 답변 보기
									</button>
								</div>

								<div class="col-xs-12 col-sm-4 emphasis">
									<h2>
										<strong>${qno }</strong>
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
										<strong>${ano} </strong>
									</h2>
									<p>
										<small>답변수</small>
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
				<span>질문글</span>
				<div id="u_qalist">

				<ul>
				<c:forEach var="q" items="${qlist }">
					<li><a href="content.do?no=${q.bno}&page=1">${q.bsubject}</a></li>
					</c:forEach>
				</ul>
			</div>
			</div>
		</article>


		<article>
			<div class="text" >
				
				<div id="u_qalist" >

							<h3>답변 </h3>
				<ul style="color:black">
				<c:forEach var="a" items="${alist }">
					<li><a href="content.do?no=${a.bno}">${a.bsubject}</a></li>
					</c:forEach>
				</ul>
			
				</div>
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


</body>
</html>