<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Landed by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>PUCO</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/sujin-main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<!-- newScripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/bootstrap-3.3.2/js/tab.js"></script>

<script>
        		$('#myTab a').click(function (e) {
        		  	e.preventDefault()
        		  	$(this).tab('show')
        		})
        		
</script>
</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<!-- 
				<header id="header">
					
					<nav id="nav">
						<ul>
							
							
							<li><a href="#" class="button small">Sign In</a></li>
							<li><a href="#" class="button small special">Sign Up</a></li>
							
							
							
							<li><a href="#" class="button small"><span class="glyphicon glyphicon-user"></span>Hi! PUCO</a>
								<ul>
									<li><a href="#">Profile</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Log out</a></li>
								</ul>
							</li>
							
						</ul>
					</nav>
				</header>
			-->
		<!-- Main -->
		<div id="main">

			<div class="container">
				<div class="page-header" style="margin-top: 100px">
					<h1 style="font: 20px 맑은 고딕">${firstCname }
						<!-- <small>Subtext for header</small> -->
					</h1>
				</div>
				<!-- Content -->
				<section id="content">
					<div class="row">
						<div class="col-xs-10 col-sm-7 col-md-7">
							<div class="embed-responsive embed-responsive-16by9">
								<!-- &amp;showinfo=0 -->
									<iframe class="embed-responsive-item" width="560" height="315" 
									src="https://www.youtube.com/embed/${contenturl}" frameborder="0" allowfullscreen></iframe>
							</div>
						</div>


						<!-- 수강 중 && 로그인 후  -->
						<c:if test="${sessionScope.id != null }">

							<div class="col-xs-10 col-sm-5 col-md-5" style="height:400px; overflow:auto">
								<table class="table">
									<c:forEach var="i" items="${clist }">
										<tr>
											<td><span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span></td>
											<td>${i.cstep }강</td>
											<td><a href="?gno=${gno}&cno=${i.cno}" target="_self">${i.cname }</a></td>
										</tr>
									</c:forEach>
							<!-- <tr>
									<td>
									<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span></td>
									<td>2강 </td>
									<td><a href="" target="_self">개발 환경 설정</a></td>
									
								</tr>
								-->

								</table>
							</div>
						</c:if>
						<!-- 수강 전 || 로그인 전  -->
						<c:if test="${sessionScope.id == null }">

							<p>
								<a href="#" data-toggle="modal" data-target="#login" id="asking" class="button large special">
									<span class="glyphicon glyphicon-play"></span>START COURSE
								</a>
							<div class="col-xs-10 col-sm-5 col-md-5">
								<div class="row">

									<div id="class_info">
										<p>
										<table class="table">
											<tr>
												<td width=70>강의</td>
												<td width=100>120</td>
												<td></td>
											</tr>
											<tr>
												<td>시간</td>
												<td>60</td>
												<td></td>
											</tr>
											<tr>
												<td>강사</td>
												<td>누군가</td>
												<td></td>
											</tr>
											<tr>
												<td>구분</td>
												<td>JSP</td>
												<td></td>
											</tr>
										</table>
										</p>
									</div>
								</div>
							</div>
						</c:if>

					</div>
				</section>
				<div>

					<!-- Nav tabs -->
					<div class="col-xs-12 col-sm-12 col-md-12">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">강의소개</a></li>
							<li role="presentation"><a href="#profile"
								aria-controls="profile" role="tab" data-toggle="tab">강의평가</a></li>
							<li role="presentation"><a href="#messages"
								aria-controls="messages" role="tab" data-toggle="tab">연관강의</a></li>
							<li role="presentation"><a href="#settings"
								aria-controls="settings" role="tab" data-toggle="tab">연관게시글</a></li>
							<li role="presentation"><a href="#board"
								aria-controls="board" role="tab" data-toggle="tab">실습링크</a></li>
						</ul>
					</div>

					<!-- Tab panes -->
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
								<p>
								<h5>${ginfo.gname }</h5>
								</p>
								<p>
									강의 내용 : ${ginfo.gintro}
									<br> 이번 강의는 ${firstCname }편입니다.
									<br> PC로 보실때는 http://www.youtube.com${firstSite } 또는 위의 동영상에서 HD 동영상을 보시는 것이 좋습니다.
									<br> 1080p로 설정해서 보시면 글자가 잘 보입니다. 오른쪽 하단 톱니모양에서 1080p를 선택하세요.
									<br> 그리고 모바일로 보실 때에는 유튜브 앱으로 보십시오. 그래야 글자가 잘 보입니다.<br>
								</p>
								<p>PPT 파일, 소스파일은 첨부파일은 http://www.youtube.com${firstSite }을 참조하세요.</p>
							</div>

							<div role="tabpanel" class="tab-pane" id="profile">
								<p>
								<h5>강의 리뷰</h5>
								</p>
								<%-- <jsp:include page="${review.jsp }"></jsp:include> --%>

							</div>

							<div role="tabpanel" class="tab-pane" id="messages">
								<p>
								<h5>연관강의</h5>
								</p>
								<div class="row">
									<c:forEach var="i" begin="1" end="4">
										<div class="col-xs-5 col-sm-4 col-md-3">
											<div class="thumbnail">
												<img src="${image}" alt="...">
												<div class="caption">
													<h3>${title }</h3>
													<p>내..용...</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>

							<div role="tabpanel" class="tab-pane" id="settings">
								<p>
								<h5>연관 게시글</h5>
								</p>
							</div>

							<div role="tabpanel" class="tab-pane" id="board">
								<div class="row">
									<div class="col-xs-10 col-sm-7 col-md-7">

										<p>
										<table class="table">
											<tr>
												<th>사이트명</th>
												<th>링크</th>
												<th>종류</th>
											</tr>
											<tr>
												<td>JSFiddle</td>
												<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
												<td>html, css, javascript..</td>
											</tr>
											<tr>
												<td>Ideone.com</td>
												<td><a href="https://ideone.com/" target="_blank">https://ideone.com</a></td>
												<td>html, css, javascript..</td>
											</tr>
											<tr>
												<td>Compile online</td>
												<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
												<td>html, css, javascript..</td>
											</tr>
											<tr>
												<td>CodeChef</td>
												<td><a href="https://jsfiddle.net/" target="_blank">http://jsfiddle.net</a></td>
												<td>html, css, javascript..</td>
											</tr>
										</table>
										</p>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="assets/js/main.js"></script>
</body>
</html>