<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Programming MOOC</title>
<link rel="stylesheet" type="text/css" href="../assets/css/main.css">
</head>
<body class="landing">
	<div id="page-wrapper">
		<header id="header">
			<h1 id="logo">
				<a href="main.jsp">Programming Study</a>
			</h1>
			<!-- 메뉴바 -->	
			<nav id="nav">
				<ul>
					<li><a href="main.jsp">Home</a></li>
					<li><a href="#">강의목록</a>
						<ul>
							<li><a href="left-sidebar.html">Left Sidebar</a></li>
							<li><a href="right-sidebar.html">Right Sidebar</a></li>
							<li><a href="no-sidebar.html">No Sidebar</a></li>
							<li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul></li>
						</ul></li>
					<li><a href="#">게시판</a>
						<ul>
							<li><a href="left-sidebar.html">Left Sidebar</a></li>
							<li><a href="right-sidebar.html">Right Sidebar</a></li>
							<li><a href="no-sidebar.html">No Sidebar</a></li>
							<li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option 1</a></li>
									<li><a href="#">Option 2</a></li>
									<li><a href="#">Option 3</a></li>
									<li><a href="#">Option 4</a></li>
								</ul></li>
						</ul></li>
					<li id="pop1"><input onclick="popup()" type="button" class="button special" value="Sign Up"></li>
				</ul>
			</nav>
		</header>
	</div>
		 <%-- <div style="margin-top: 100px;"><jsp:include page="dist/html/test2.jsp"/></div> --%>
		 <div class="container">
		  	<div class="row">
		  		<%-- <div style="border:1px solid gold; position: fixed;"><jsp:include page="dist/html/test2.jsp"/></div> --%>
		 		<div><jsp:include page="inner_videolist.jsp"/></div>
		 	</div>
		 </div>
         
         <!-- 풋터 -->
         <footer id="footer">
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
		</footer>
            
	
	<link rel="stylesheet" type="text/css" href="../assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/hyun/hyun.css">
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/ie/respond.min.js"></script>
	<!--[endif]  -->
	<script src="../assets/js/main.js"></script>
	<script src="../assets/js/popup.js"></script>
	<!--  -->
	
</body>
</html>