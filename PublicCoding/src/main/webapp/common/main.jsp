<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Public Coding</title>

<link type="text/css" rel="stylesheet" href="../assets/css/main.css">

</head>

<body class="landing">

	<div id="page-wrapper">

		<header id="header">
			<h1 >
				<a href="main.do">
						PUBLIC CODING
				</a>
			</h1>
			
		<!-- 메뉴바 -->
			<nav id="nav">
				<ul>
					<li><a href="StudySub.jsp">강의목록</a>
						<ul>
							<li><a href="left-sidebar.html">언어</a></li>
							<li><a href="right-sidebar.html">데이터베이스</a></li>
							<li><a href="no-sidebar.html">WEB/CSS</a></li>
							<!-- <li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul>
							</li> -->
						</ul></li>

					<li><a href="#">게시판</a>
						<ul>
							<li><a href="right-sidebar.html">Q&A</a></li>
							<li><a href="no-sidebar.html">자유게시판</a></li>
							<!-- <li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul>
							</li> -->
						</ul>
					</li>
					
					<li><a href="#">스터디</a>
						<ul>
							<li><a href="right-sidebar.html">주제별</a></li>
							<li><a href="no-sidebar.html">지역별</a></li>
							<!-- <li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul>
							</li> -->
						</ul>
					</li>
					
					<li>
					<input onclick="popup_signin()" type="button" value="로그인">
					</li>
					
					<li id="pop1"><input onclick="popup_signup()" type="button"
						class="button special" value="회원가입"></li>
				</ul>
			</nav>
		</header>

		<!-- 메인페이지(페이지1) -->
		
	<section id="banner">
			<article class="content">
				<li>
					보드1
					보드2
				</li>
			</article>
			
			<article class="boardq">
				<li>
					보드1
					보드2
				</li>
			</article>
			
			<article class="boardf">
			<li>
					보드1
					보드2
				</li>
			</article>
			
			<article class="boards">
			<li>
					보드1
					보드2
				</li>
			</article>
			
			<article>
			</article>
				
	</section> 

		<!-- Footer -->
		<!-- <footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy;Copyright by SIST-C2.</li>

	

			</ul>
			
			
		</footer> -->

	</div>

	<!-- Scripts -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/modal.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.onvisible.min.js"></script>
	
	<!-- 회원가입/로그인 팝업창 띄우기 -->	
	<script src="assets/js/popup.js"></script>
	<!-- 메인페이지에서 동영상/이미지 겹치는 스크립트 -->
	<script type="text/javascript"	src="//cdn.jsdelivr.net/g/modernizr@2.7,respond@1.4,bootstrap@3.1,fittext@1.2"></script>

	

</body>
</html>