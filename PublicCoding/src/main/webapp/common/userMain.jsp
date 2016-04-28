<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="org.json.simple.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">
<link rel="stylesheet" href="member/user.css">
</head>
<body>

		<!-- <nav id="nav-main">
	</nav> -->

	<section>
		<article>
			<div class="text" id="content">
						<div class="avatar-card">
				<div class="avatar">
					<a href="#">
						<div class="gravatar-wrapper-164">
							<c:if test="${vo.filesize==0 }">
							<img src="resources/userprofiles/defaultprofile.jpg"
								alt width="300" height="300" class="avatar-user">
								</c:if>
						</div>
					</a>
				</div>
				<div id="score">
					<span id="grade" title="뱃지"></span>${vo.mpoint } 점
				</div>
		<input type="button"
								class="btn btn-default" name="list" id="list" onclick="window.location.href='user_update.do?mno=${sessionScope.mno }'"
								value="수정" size=50>
			</div>
				<div id="profile_wrapper">
				<!-- <div id="description">
					<h2>loveyk.eun</h2>
					<ul id="descr">
						<li>직장: 쌍용교육센터</li>
						<li>관심사: JAVA</li>
						<li>하고싶은 말: 어떻게 하면 자바 고수가 될 수 있나요?</li>
					</ul>
				</div> -->
				<div id="info-summary">
				<h2>${vo.mid }</h2>
					<div class="u_num">
						<div class="u_num_answers">
							<div class="mini-counts">
								<span title="답변 갯수">0</span>
							</div>
							<div>답변수</div>
						</div>
						<div class="u_num_question">
							<div class="mini-counts">
								<span title="질문수">0</span>
							</div>
							<div>질문수</div>
						</div>

						<div class="u_num_lectures">
							<div class="mini-counts">
								<span title="수강강의 수">0</span>
							</div>
							<div>수강수</div>
						</div>

					</div>
					<div>
						<ul>
							<li><i class="fa fa-sign-in" aria-hidden="true">&nbsp;가입일: 
							<fmt:formatDate value="${vo.mdate}" pattern="yyyy년 MM월 dd일"/>
							</i></li>
							<li><i class="fa fa-github" aria-hidden="true">&nbsp;Github:</i></li>
							<li><i class="fa fa-eye" aria-hidden="true">&nbsp;포스트 뷰</i></li>
							<li><i class="fa fa-clock-o" aria-hidden="true">&nbsp;최근 접속시간 ${login }</i></li>
						</ul>
					</div>
				</div>
			</div>
			</div>
		</article>

		<article>
			<div id='calendar'></div>
		</article>

		<article>
			<div class="text">
				<span>내가 쓴 글</span>
				<div id="u_qalist">
				<h3>질문과 답변</h3>
				<table>
					<tr><td>How can I make an instance of a block of Blockly with
						Javascript?</td></tr>
					<tr>	<td>Grocery CRUD Join tabl</td></tr>
					<tr><td>Apache folder not showing up</td></tr>
					<tr><td>How can I make an instance of a block of Blockly with
						Javascript?</td></tr>
					<tr><td>Grocery CRUD Join table</td></tr>
					<tr><td>Apache folder not showing up</td></tr>
				</table>
			</div>
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
	

</body>
</html>