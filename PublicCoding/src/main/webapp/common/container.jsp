<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PUBLIC CODING | 모두가 즐기는 코딩</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/main2.css">


<!-- ////////////////////////////////////// LOGIN ACTION /////////////////////////// -->

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#logBtn').click(function() {
			var id = $('#id').val();
			if (id.trim() == "") {
				$('#id').focus();
				return;
			}

			var pwd = $('#pwd').val();
			if (pwd.trim() == "") {
				$('#pwd').focus();
				return;
			}
			$('#logForm').submit();
		});
		$('#logoutBtn').click(function() {
			$('#logoutForm').submit();
		});
	});
</script>
<!-- ////////////////////////////////////////////////////////////////////////////// -->



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
					<c:forEach var="d" items="${ dlist }">
						<li><a href="scategory.do?dno=${d.dno }">${d.dname }</a></li>
					</c:forEach>
				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-retweet"></i>오프라인
					스터디</a>

				<center>
					<ul class="dropdown-menu">

						<li><a href="#">지역별</a></li>
						<li><a href="#">주제별</a></li>

					</ul>
				</center></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"><i class="fa fa-file-text-o"></i>게시판</a>
				<ul class="dropdown-menu">
					<li><a href="qnaboard.do">Q&A 게시판</a></li>
					<li><a href="#">자유 게시판</a></li>
				</ul></li>

			<!-- 회원가입-->

			<c:if test="${sessionScope.id==null }">
				<li class="joinok" data-toggle="modal" data-target="#join"><a
					href="#"><i class="fa fa-user"></i>회원가입</a></li>

				<li class="logininok" data-toggle="modal" data-target="#login"><a
					href="#"><i class="fa fa-sign-in"></i>로그인</a></li>
			</c:if>

			<c:if test="${sessionScope.id!=null }">
				<%-- <li><input type="button" value="${sessionScope.id}"></li> --%>
				<li class="dropdown" id="loginok"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						${sessionScope.id}
				</a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-pagelines fa-fw"
								aria-hidden="true"></i>My Page</a></li>
						<li><a href="#"><i class="fa fa-pencil fa-fw"
								aria-hidden="true"></i>개인정보수정</a></li>
						<li><a href="#signout.do" data-target="#logout"
							id="logoutBtn"> <i class="fa fa-sign-out fa-fw"></i>로그아웃
						</a></li>
					</ul></li>
			</c:if>

			<!-- 과거 로그인시, 로그인 한 사람에 대해 나오는 메뉴 시작 -->
			<%-- <c:if test="${sessionScope.id==null }">
					<li>
						<!-- <a href="member/signin.jsp"> --> <input
						onclick="popup_signin()" type="button" value="로그인"> <!-- 로그인<!-- </a> -->
					</li>
					<!-- <li><a href="elements.html">Elements</a></li> -->
					<!-- <li><a href="member/signup.jsp" class="button special">Sign Up</a></li> -->
					<li id="pop1"><input onclick="popup_signup()" type="button"
						class="button special" value="회원가입"></li>
					</c:if>
					<c:if test="${sessionScope.id!=null }">
						<li><input type="button" value="${sessionScope.id}"></li>
						<div class="btn-group open">
							<a class="btn btn-default" href="#"><i
								class="fa fa-user fa-fw"></i> ${sessionScope.id}</a> <a
								class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
								href="#"> <span class="fa fa-caret-down"
								title="Toggle dropdown menu"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="fa fa-pencil fa-fw"
										aria-hidden="true"></i> Edit</a></li>
								<li><a href="#"><i class="fa fa-trash-o fa-fw"
										aria-hidden="true"></i> Delete</a></li>
								<li><a href="#"><i class="fa fa-ban fa-fw"
										aria-hidden="true"></i> Ban</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-unlock"
										aria-hidden="true"></i> Make admin</a></li>
							</ul>
						</div>
					</c:if>
			 --%>
			<!-- 과거 로그인시, 로그인 한 사람에 대해 나오는 메뉴 시작 끝 -->
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
								이미 가입 하셨나요? <br> <br> <input type="button"
									class="btn btn-block btn-primary" data-toggle="modal"
									data-target="#login" data-dismiss="modal" value="로그인">

							</p>
						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 원래 main 화면에 있는 기본 로그인 부분 시작 -->
		<%-- <div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>안녕하세요. PUCO 입니다.</center>
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

								<input type="button" class="btn btn-block btn-primary"
									data-target="#login" data-dismiss="modal" value="로그인">
						</form>

					</div>
				</div>
			</div>
		</div> --%>
		<!-- 원래 main 화면에 있는 기본 로그인 부분  끝 -->


		<!-- 로그인 modal 창의 id, password, 로그인, 로그아웃 버튼 부분 시작 -->
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true"></span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="lineModalLabel">
							<center>안녕하세요. PUCO 입니다.</center>
						</h4>
					</div>
					<div class="modal-body">

						<!-- content goes here -->
						<c:if test="${sessionScope.id==null }">
							<form class="form-horizontal ng-pristine ng-valid ng-valid-email"
								role="form" method="post" action="signin.do" id="logForm">

								<div class="row">
									<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
										<label for="firstname">아이디</label> <input type="text"
											class="form-control ng-pristine ng-untouched ng-valid"
											id="id" name="id" placeholder="아이디">
									</div>
									<div class="col-sm-6 col-xs-12" style="margin-bottom: 10px;">
										<label for="lastName">비밀번호</label> <input type="password"
											class="form-control ng-pristine ng-untouched ng-valid"
											id="pwd" name="pwd" placeholder="비밀번호">
									</div>
								</div>

								<p>
								<p>
									<button type="button" class="btn btn-block btn-primary"
										data-target="#login" data-dismiss="modal" id="logBtn">로그인</button>
							</form>
						</c:if>
						<c:if test="${sessionScope.id!=null }">
							<form method="post" action="signout.do" id="logoutForm">
								${sessionScope.id }님 환영합니다!!&nbsp;
								<button type="button" class="btn btn-block btn-primary"
									data-target="#login" data-dismiss="modal" id="logoutBtn">로그아웃</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- 로그인 modal 창의 id, password, 로그인, 로그아웃 버튼 부분 끝 -->



	</header>

	<!-- 컨텐츠  -->
	<jsp:include page="${jsp }"></jsp:include>




	<!-- Scripts -->

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>

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