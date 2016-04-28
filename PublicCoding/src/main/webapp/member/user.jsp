<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html >
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="user.css">
</head>
<body>
	<div id=content>
		<!-- Profile 첫번째 줄 -->
		<div class=row>
			<div class="avatar-card">
				<div class="avatar">
					<a href="#">
						<div class="gravatar-wrapper-164">
							<img src="http://img.visualdive.co.kr/sites/2/2015/10/gisa2.jpg"
								alt width="200" height="200" class="avatar-user">
						</div>
					</a>
				</div>
				<div id="score">
					<span id="grade" title="뱃지"></span>100 점
				</div>
			</div>
			<div id="profile_wrapper">
				<div id="description">
					<c:forEach var="m" items="${ mlist}">
						<li>${m.id }</li>
					</c:forEach>
					<ul id="descr">
						<li>직장: 쌍용교육센터</li>
						<li>관심사: JAVA</li>
						<li>하고싶은 말: 어떻게 하면 자바 고수가 될 수 있나요?</li>
					</ul>
				</div>
				<div id="info-summary">
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
							<li><i class="fa fa-sign-in" aria-hidden="true">&nbsp;가입일</i></li>
							<li><i class="fa fa-github" aria-hidden="true">&nbsp;Github:</i></li>							
							<li><i class="fa fa-stack-overflow" aria-hidden="true">&nbsp;stack overflow:</i></li>
							<li><i class="fa fa-eye" aria-hidden="true">&nbsp;포스트 뷰</i></li>
							<li><i class="fa fa-clock-o" aria-hidden="true">&nbsp;최근 접속시간</i></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!--  Profile 두번째 줄 -->
		<div class=row>
			<div id="u_tags">
			<h3>favorite tags</h3>
				<table>

					<tr>
					<td><a href="#" class="post-tag">태그</a></td>
					<td><a href="#" class="post-tag">태그</a></td>
					<td><a href="#" class="post-tag">태그</a></td>
					</tr>
				</table>
			
			</div>
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
			
			<div id="u_review">
			<h3>점수 획득 내역</h3>
				<ul>
							<li>+5 강의 평점을 매겼습니다.</li>
							<li>+5 강의 평점을 매겼습니다.</li>
							<li>+10 답변을 작성했습니다.</li>
							<li>+5 도움되는 답변으로 좋아요 획득!</li>
							<li>-1 싫어요 획득</li>
						</ul>
				
			
			</div>
			
		</div>

	</div>
</body>
</html>