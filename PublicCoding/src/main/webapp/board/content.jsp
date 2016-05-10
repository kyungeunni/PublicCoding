<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Landed by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->


<link rel="stylesheet" href="assets/css/newboard.css" />
<link rel="stylesheet" href="assets/css/content.css">

<!-- 에디터 -->
<link href="resources/se/css/smart_editor2.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>


</head>
<body>

	<!-- Main -->
	<div id="main" class="wrapper style1">
		<div class="container">
			<header class="major">
				<!-- 					<h2>HTML5에서 div의 float을 주면 wrapper가 감싸지 못합니다.</h2>
					<p>#태그. #태그. #태그</p> -->
				<h2>${d.bsubject }</h2>
				<!-- <p>#${d.tag1 }.#${d.tag2 }. #${d.tag3 }</p> -->
				<div class="tags t-태그 t-태그">
											<c:if test="${d.tag1!='NONE' }">
											<a href="/questions/tagged/${d.tag1}" class="post-tag"
												title="show questions tagged &#39;${d.tag1}&#39;" rel="tag">${d.tag1}</a>
												</c:if>
												<c:if test="${d.tag2!='NONE' }">
											<a href="/questions/tagged/${d.tag2}" class="post-tag"
												title="show questions tagged &#39;${d.tag2}&#39;" rel="tag">${d.tag2}</a>
												</c:if>
												<c:if test="${d.tag3!='NONE' }">
											<a href="/questions/tagged/${d.tag3}" class="post-tag"
												title="show questions tagged &#39;${d.tag3}&#39;" rel="tag">${d.tag3}</a>
												</c:if>
											
										</div>
			</header>

			<!-- Content -->
			<div id=content>
			<div id=mainbar>
				<section id="question">
					<div id="question" class="noanswerd qnacontent">

							<table border=0>
								<tr>
									<td width=15% align="right" >
										<ul class=vote>
											<li><a href="bvoteup.do?bno=${no }&page=${page}&type=1"><i class="fa fa-angle-up"></i></a></li>
											<li>${d.bvote}</li>
											<li><a href="bvotedown.do?bno=${no }&page=${page}&type=1"><i class="fa fa-angle-down"></i></a></li>
										</ul>
									</td>

									<td width=85%>
										<p>${d.bcontent}</p>

										<p id="written">
											<a href="userMain.do?mno=${d.mno}"><img src="resources/userprofiles/${wimg }"
								alt="" width="40" height="40" class="img-rounded"> ${d.userid} </a> 님이 질문
										<p>
									</td>
								</tr>

							</table>
						</div>
				</section>

				<section id="answers">
					<h3 class="content-h">답변 ${d.answer } </h3>
					<%-- 			<jsp:include page="inner_content.jsp" /> --%>
				
						<c:forEach var="as" items="${alist}">
						<div id="answer_${d.bno }${as.rno}" class="qnacontent" >

							<table border=0>
								
								<tr>
									<td width=15% align="right">
										<ul class=vote>
											<li><a href="bvoteup.do?bno=${no }&page=${page}&type=0&rno=${as.rno}"><i class="fa fa-angle-up"></i></a></li>
											<li>${as.rhit}</li>
											<li><a href="bvotedown.do?bno=${no }&page=${page}&type=0&rno=${as.rno}"><i class="fa fa-angle-down"></i></a></li>
										</ul>
									</td>

									<td width=85%>
										<p>${as.rcontent}</p>

										<p id="written">
											<a href="userMain.do?mno=${as.mno}"> <img src="resources/userprofiles/${as.mimageurl }"
								alt="" width="40" height="40" class="img-rounded"> ${as.userid }</a> 님의 답변
										<p>
									</td>
								</tr>

							</table>
						</div>
						</c:forEach>
					
						
					

					<div class="content-h">
						<h3>당신의 답변을 적어주세요.</h3>
						<!-- 에디터 -->
						<form action="answer.do" id="frm" method="post">
						<textarea name="ir1" id="ir1"
							style="width: 800px; height: 300px; display: none;"></textarea>
							<input type="hidden" id="no" name="no" value="${no }">
							<input type="hidden" id="page" name="page" value="${page }">
							</form>
						<div class="col-sm-offset-8 col-sm-8">
							<c:if test="${sessionScope.id==null }">
							<input type="button" class="btn btn-default" value="답변달기" data-toggle="modal" data-target="#login""></c:if>
							 <c:if test="${sessionScope.id!=null }">
							<input type="button" id="sndbtn" class="btn btn-default" value="답변달기" ></c:if>
							
								<input type="button"
								class="btn btn-default" name="list" id="list" onclick="window.location.href='qnaboard.do?page=${page }'"
								value="목록" size=50>
						</div>
						

						<script>
							$(function() {
								//전역변수선언
								var editor_object = [];
								nhn.husky.EZCreator
										.createInIFrame({
											oAppRef : editor_object,
											elPlaceHolder : "ir1",
											sSkinURI : "resources/se/SmartEditor2Skin.html",
											htParams : {
												// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
												bUseToolbar : true,
												// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
												bUseVerticalResizer : true,
												// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
												bUseModeChanger : false,
											}
										});
								//전송버튼 클릭이벤트
								$("#sndbtn")
										.click(function() {
											
											//id가 smarteditor인 textarea에 에디터에서 대입
													editor_object.getById["ir1"]
															.exec(
																	"UPDATE_CONTENTS_FIELD",
																	[]);
													// 이부분에 에디터 validation 검증
													//폼 submit
													alert("실행?");
													$("#frm").submit();
												})
							})
						</script>

					</div>

				</section>
			</div>

			<div id="sidebar">
				<p>작성시간 &nbsp;${time }</p>
				<p>조회수 &nbsp; ${d.bhit }</p>

				


				
				<p>blar blar blar</p>
				<p>blar blar blar</p>
			</div>
			</div>
		</div>
	</div>




</body>
</html>