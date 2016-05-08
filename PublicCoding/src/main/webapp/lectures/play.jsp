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
<!-- //////////////////////// 강의 평가 댓글 시작  ////////////////////////// -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#replyBtn').click(function(){
		var checkedValue=$("input[type=radio][name=grepoint]:checked").val();
		alert(checkedValue);
		
		var rd=$('#reply_data').val();
		if(rd.trim()=="")
		{
			$('#reply_data').focus();
			return;
		}
		$('#rifrm').submit();
	});
	
});
</script>
<!-- //////////////////////// 강의 평가 댓글  끝 ////////////////////////// -->
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
						
						<!-- 수강 전  || 로그인 전 -->
						<c:if test="${gno != confirmCourse.gno}">
							<p>
							<c:if test="${sessionScope.id == null }">	
								<a href="#" data-toggle="modal" data-target="#login" id="asking" class="button large special">
									<span class="glyphicon glyphicon-play"></span>START COURSE
								</a>
							</c:if>
							<c:if test="${gno != confirmCourse.gno && sessionScope.id != null }">
								<a href="register.do?gno=${gno }" class="button large special">
								<span class="glyphicon glyphicon-play"></span>START COURSE
								</a>
							</c:if>
							<div class="col-xs-10 col-sm-5 col-md-5">
								<div class="row">

									<div id="class_info">
										<p>
										<table class="table">
											<tr>
												<td width=70>강의</td>
												<td width=100>${firstCname }</td>
												<td></td>
											</tr>
											<tr>
												<td>시간</td>
												<td>${firstCtime }</td>
												<td></td>
											</tr>
										</table>
										</p>
									</div>
								</div>
							</div>
						</c:if>

						<!-- 수강 중   -->
						<c:if test="${gno == confirmCourse.gno && sessionScope.id != null}">

							<div class="col-xs-10 col-sm-5 col-md-5" style="height:450px; overflow:auto">
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
								<div class="container">

									<div class="row">

										<div class="col-sm-3">
											<h4>Rating breakdown</h4>
											<div class="pull-left">
												<div class="pull-left" style="width: 35px; line-height: 1;">
													<div style="height: 9px; margin: 5px 0;">
														5 <span class="glyphicon glyphicon-star"></span>
													</div>
												</div>
												<div class="pull-left" style="width: 180px;">
													<div class="progress" style="height: 9px; margin: 8px 0;">
														<div class="progress-bar progress-bar-success"
															role="progressbar" aria-valuenow="5" aria-valuemin="0"
															aria-valuemax="5" style="width: 1000%">
															<span class="sr-only">80% Complete (danger)</span>
														</div>
													</div>
												</div>
												<div class="pull-right" style="margin-left: 10px;">1</div>
											</div>
											<div class="pull-left">
												<div class="pull-left" style="width: 35px; line-height: 1;">
													<div style="height: 9px; margin: 5px 0;">
														4 <span class="glyphicon glyphicon-star"></span>
													</div>
												</div>
												<div class="pull-left" style="width: 180px;">
													<div class="progress" style="height: 9px; margin: 8px 0;">
														<div class="progress-bar progress-bar-primary"
															role="progressbar" aria-valuenow="4" aria-valuemin="0"
															aria-valuemax="5" style="width: 80%">
															<span class="sr-only">80% Complete (danger)</span>
														</div>
													</div>
												</div>
												<div class="pull-right" style="margin-left: 10px;">1</div>
											</div>
											<div class="pull-left">
												<div class="pull-left" style="width: 35px; line-height: 1;">
													<div style="height: 9px; margin: 5px 0;">
														3 <span class="glyphicon glyphicon-star"></span>
													</div>
												</div>
												<div class="pull-left" style="width: 180px;">
													<div class="progress" style="height: 9px; margin: 8px 0;">
														<div class="progress-bar progress-bar-info"
															role="progressbar" aria-valuenow="3" aria-valuemin="0"
															aria-valuemax="5" style="width: 60%">
															<span class="sr-only">80% Complete (danger)</span>
														</div>
													</div>
												</div>
												<div class="pull-right" style="margin-left: 10px;">0</div>
											</div>
											<div class="pull-left">
												<div class="pull-left" style="width: 35px; line-height: 1;">
													<div style="height: 9px; margin: 5px 0;">
														2 <span class="glyphicon glyphicon-star"></span>
													</div>
												</div>
												<div class="pull-left" style="width: 180px;">
													<div class="progress" style="height: 9px; margin: 8px 0;">
														<div class="progress-bar progress-bar-warning"
															role="progressbar" aria-valuenow="2" aria-valuemin="0"
															aria-valuemax="5" style="width: 40%">
															<span class="sr-only">80% Complete (danger)</span>
														</div>
													</div>
												</div>
												<div class="pull-right" style="margin-left: 10px;">0</div>
											</div>
											<div class="pull-left">
												<div class="pull-left" style="width: 35px; line-height: 1;">
													<div style="height: 9px; margin: 5px 0;">
														1 <span class="glyphicon glyphicon-star"></span>
													</div>
												</div>
												<div class="pull-left" style="width: 180px;">
													<div class="progress" style="height: 9px; margin: 8px 0;">
														<div class="progress-bar progress-bar-danger"
															role="progressbar" aria-valuenow="1" aria-valuemin="0"
															aria-valuemax="5" style="width: 20%">
															<span class="sr-only">80% Complete (danger)</span>
														</div>
													</div>
												</div>
												<div class="pull-right" style="margin-left: 10px;">0</div>
											</div>
										</div>
									</div>
									<br>
									
									
									<c:if test="${sessionScope.id != null && gno == confirmCourse.gno}">
									<!-- 리뷰 작성 박스 시작 -->
									<div class="col-md-6">
										<div class="well well-sm">
										<form accept-charset="EUC-KR" action="reply_insert.do" method="post" id="rifrm">
										
										
										<div class="col-sm-3">
											<div class="rating-block">
											
												<font style="color: black">
												<h4>Average user rating</h4>
												<!-- <h2 class="bold padding-bottom-7">
													4.3 <small>/ 5</small>
												</h2> -->
												<!-- <button type="button" class="btn btn-warning btn-sm"
													aria-label="Left Align" name="star" value="1">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												</button>
												<button type="button" class="btn btn-warning btn-sm"
													aria-label="Left Align" name="star" value="2">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												</button>
												<button type="button" class="btn btn-warning btn-sm"
													aria-label="Left Align" name="star" value="3">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												</button>
												<button type="button"
													class="btn btn-default btn-grey btn-sm"
													aria-label="Left Align" name="star" value="4">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												</button>
												<button type="button"
													class="btn btn-default btn-grey btn-sm"
													aria-label="Left Align" name="star" value="5">
													<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												</button> -->
		
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<input type="radio" name="grepoint" value="1"><br>
												
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<input type="radio" name="grepoint" value="2" checked="true"><br>
												
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<input type="radio" name="grepoint" value="3"><br>
												
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<input type="radio" name="grepoint" value="4"><br>
												
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
												<input type="radio" name="grepoint" value="5"><br>
												
												</font>
												
											</div>
										</div>
										
										
											<div class="text-right">
												<a class="btn btn-success btn-green" id="open-review-box">
													<input type=button id="replyBtn" value="Review">
												</a>
											</div>
											<!-- style="display: none;" -->
											<div class="row" id="post-review-box">
												<div class="col-md-12">
													
														<input type="hidden" name="gno" value="${gno }">
														<input type="hidden" name="id" value="${sessionScope.id }">
														<input type="hidden" name="pwd" value="${sessionScope.pwd }">
														<!-- <input id="ratings-hidden" name="rating" type="hidden"> -->
														<!-- class="form-control animated" -->
														<textarea class="form-control animated" cols="50" style="float: left" id="reply_data" name="reply_data" rows="5"></textarea>

														<!-- <div class="text-right">
															<div class="stars starrr" data-rating="0"></div>
															<a class="btn btn-danger btn-sm" href="#"
																id="close-review-box"
																style="display: none; margin-right: 10px;"> <span
																class="glyphicon glyphicon-remove"></span>Cancel
															</a>
															<button class="btn btn-success btn-lg" type="submit">Save</button>
														</div> -->
													
												</div>
											</div>
										</form>	
										</div>
									</div>
									</c:if>
									
									<!--  리뷰 모음 시작  -->
									<div class="row">
										<div class="col-sm-7">
											<hr />
											<div class="review-block">
											
												<c:forEach var="rvo" items="${replyList}">
												<div class="row">
													<div class="col-sm-3">
														<img
															src="http://dummyimage.com/60x60/666/ffffff&text=No+Image"
															class="img-rounded">
														<div class="review-block-name">
															<a href="#">${rvo.grename }</a>
														</div>
														<div class="review-block-date">
															${rvo.gredate }<br />${rvo.dbday }
														</div>
													</div>
													
													
													<div class="col-sm-9">
														
															<div class="review-block-rate">
																<c:forEach var="i" begin="1" end="${rvo.grepoint}">
																<button type="button" class="btn btn-warning btn-xs"
																	aria-label="Left Align">
																	<span class="glyphicon glyphicon-star"
																		aria-hidden="true"></span>
																</button>
																</c:forEach>
																<!-- <button type="button"
																	class="btn btn-default btn-grey btn-xs"
																	aria-label="Left Align">
																	<span class="glyphicon glyphicon-star"
																		aria-hidden="true"></span>
																</button> -->
															</div>
															
															
														<div class="review-block-description">${rvo.grecontent }</div>
													</div>
													
													
												</div>
												<hr />
												</c:forEach>
												
												
												<!-- <div class="row">
													<div class="col-sm-3">
														<img
															src="http://dummyimage.com/60x60/666/ffffff&text=No+Image"
															class="img-rounded">
														<div class="review-block-name">
															<a href="#">nktailor</a>
														</div>
														<div class="review-block-date">
															January 29, 2016<br />1 day ago
														</div>
													</div>
													<div class="col-sm-9">
														<div class="review-block-rate">
															<button type="button" class="btn btn-warning btn-xs"
																aria-label="Left Align">
																<span class="glyphicon glyphicon-star"
																	aria-hidden="true"></span>
															</button>
															<button type="button" class="btn btn-warning btn-xs"
																aria-label="Left Align">
																<span class="glyphicon glyphicon-star"
																	aria-hidden="true"></span>
															</button>
															<button type="button" class="btn btn-warning btn-xs"
																aria-label="Left Align">
																<span class="glyphicon glyphicon-star"
																	aria-hidden="true"></span>
															</button>
															<button type="button"
																class="btn btn-default btn-grey btn-xs"
																aria-label="Left Align">
																<span class="glyphicon glyphicon-star"
																	aria-hidden="true"></span>
															</button>
															<button type="button"
																class="btn btn-default btn-grey btn-xs"
																aria-label="Left Align">
																<span class="glyphicon glyphicon-star"
																	aria-hidden="true"></span>
															</button>
														</div>
														<div class="review-block-title">this was nice in buy</div>
														<div class="review-block-description">this was nice
															in buy. this was nice in buy. this was nice in buy. this
															was nice in buy this was nice in buy this was nice in buy
															this was nice in buy this was nice in buy</div>
													</div>
												</div> -->
											</div>
										</div>
									</div>

								</div>
								<!-- /container -->
							</div>

							<div role="tabpanel" class="tab-pane" id="messages">
								<p>
								<h5>연관강의</h5>
								</p>
								<div class="row">
									<c:forEach var="i" begin="1" end="4" items="${glist }">
										<div class="col-xs-5 col-sm-4 col-md-3">
											<div class="thumbnail">
												<img src="${i.gimageurl}" alt="...">
												<div class="caption">
													<h5><font color="#000">${i.gname }</font>></h5>
													<p>총 강의수 : ${i.totalcno }강</p>
													<a class="btn btn-mini" href="play.do?gno=${i.gno }"> 강의 알아보기</a>
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
								
								<article>
									<form action="#" method="get">
										<br /> <input class="form-control" id="system-search" name="q"
											placeholder="검색어를 입력해주세요" required>
									</form>
								</article>
						
								<article>
									<span>Q&A 게시판</span>
									<div id="qnaboard">
										<div class="container">
											<div class="row">
												<div class="col-md-9">
						
													<table class="table table-list-search">
														<thead>
															<tr>
																<th class="no">No.</th>
																<th class="title">제목</th>
																<th class="id">글쓴이</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="q" items="${qlist }">
																<tr>
																	<td class="no">${q.bno }</td>
																	<td class="title">${q.bsubject }</td>
																	<td class="id">${q.userid }</td>
																</tr>
															</c:forEach>
													</table>
						
												</div>
											</div>
										</div>
									</div>
								</article>
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
												<td>java, sql, javascript..</td>
											</tr>
											<tr>
												<td>Compile online</td>
												<td><a href="http://www.onlinecompiler.net/" target="_blank">http://www.onlinecompiler.net</a></td>
												<td>c/c++, fortran, pascal..</td>
											</tr>
											<tr>
												<td>CodeChef</td>
												<td><a href="https://www.codechef.com/ide" target="_blank">https://www.codechef.com/ide</a></td>
												<td>asm, php, ada, ruby..</td>
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