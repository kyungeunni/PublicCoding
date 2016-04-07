<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.puco.board.dao.*,java.util.*"%>
<jsp:useBean id="dao" class="com.puco.board.dao.BoardDAO"></jsp:useBean>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	List<BoardDTO> d = dao.boardListData(0);
%> --%>

<!DOCTYPE HTML>
<!--
	Landed by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>PUBLIC CODING</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/newboard.css" />
<!-- <link rel="stylesheet" href="../assets/css/pracc111.css" /> -->
<!-- 		<link rel="stylesheet" type="text/css" href="//cdn.sstatic.net/stackoverflow/all.css?v=a14bb0933bd0"> -->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<header id="header">
		<h1 id="logo">
			<a href="common/main.jsp">p2</a>
		</h1>
		<nav id="nav">
		<ul>

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


					<li>
						<!-- <a href="member/signin.jsp"> --> <input
						onclick="popup_signin()" type="button" value="로그인"> <!-- 로그인<!-- </a> -->
					</li>
					<!-- <li><a href="elements.html">Elements</a></li> -->
					<!-- <li><a href="member/signup.jsp" class="button special">Sign Up</a></li> -->
					<li id="pop1"><input onclick="popup_signup()" type="button"
						class="button special" value="회원가입"></li>
				</ul>
		
		</nav> </header>


		<!-- Main -->

		<div class="container">
			<div class="major">
				<h2>PUCO Overflow</h2>
				<p></p>
			</div>

			<!-- Content -->
			<div id="content" class="snippet-hidden">


				<!-- 추가 -->
				<div id="mainbar">

					<header class="subheader">
						<h1 id="h-top-questions">Top Questions</h1>
						<div id="tabs">
							<a class="youarehere" href="?tab=interesting" data-nav-xhref=""
								title="Questions that may be of interest to you based on your history and tag preference"
								data-value="interesting"> 최신등록</a> <a href="?tab=featured"
								data-nav-xhref="" title="Questions with an active bounty"
								data-value="featured"> <span class="bounty-indicator-tab">437</span>
								인기답변
							</a> <a href="?tab=hot" data-nav-xhref=""
								title="Questions with the most views, answers, and votes over the last few days"
								data-value="week"> 주간</a> <a href="?tab=week" data-nav-xhref=""
								title="Questions with the most views, answers, and votes this week"
								data-value="month"> 월간</a>

						</div>
					</header>


					<div id="qlist-wrapper">
						<div id="question-mini-list">


						<c:forEach var="d" items="${ list }" >
							
						
						
							<div class="question-summary narrow">
								<!-- 카운트,뷰,보트 영역 -->
								<div
									onclick="window.location.href='/questions/36144341/reduce-table-whit-css-if-posible'"
									class="cp">
									<div class="votes">
										<div class="mini-counts">
											<span title="0 votes">0</span>
										</div>
										<div>votes</div>
									</div>
									<div class="status unanswered">
										<div class="mini-counts">
											<span title="0 answers">0</span>
										</div>
										<div>answers</div>
									</div>
									<div class="views">
										<div class="mini-counts">
											<span title="${d.hit } views">${d.hit } </span>
										</div>
										<div>views</div>
									</div>
								</div>

								<!-- 질문과 시간영역 -->

								<div class="summary">
									<h3>
										<a href="/questions/36144341/reduce-table-whit-css-if-posible"
											class="question-hyperlink">${d.subject } </a>
									</h3>
									<div class="tags t-태그 t-태그">
										<a href="/questions/tagged/태그" class="post-tag"
											title="show questions tagged &#39;태그&#39;" rel="tag">태그</a> <a
											href="/questions/tagged/태그" class="post-tag"
											title="show questions tagged &#39;태그&#39;" rel="tag">태그</a>
									</div>
									<div class="started">
										<a href="/questions/36144341/reduce-table-whit-css-if-posible"
											class="started-link">asked <span
											title="2016-03-22 00:50:00Z" class="relativetime">${d.regdate }</span></a>
										<a href="/users/6096182/${d.name } ">${d.name }</a>
										<span class="reputation-score" title="reputation score "
											dir="ltr">1</span>
									</div>
								</div>
							</div>

		</c:forEach>

						</div>
					</div>
				</div>
				<div id="sidebar">
					<div id="hot-network-questions" class="module">
						<h4>
							<a href="//stackexchange.com/questions?tab=hot"
								class="js-gps-track"
								data-gps-track="posts_hot_network.click({ item_type:1, location:8 })">
								Hot Network Questions </a>
						</h4>
						<ul>
							<li>
								<div class="favicon favicon-security"
									title="Information Security Stack Exchange"></div> <a
								href="http://security.stackexchange.com/questions/118450/is-there-a-threshold-for-a-password-so-long-it-doesnt-get-any-more-secure-or-ev"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:162 }); posts_hot_network.click({ item_type:2, location:8 })">
									Is there a threshold for a password so long it doesn't get any
									more secure or even becomes insecure? </a>

							</li>
							<li>
								<div class="favicon favicon-academia"
									title="Academia Stack Exchange"></div> <a
								href="http://academia.stackexchange.com/questions/65808/cite-something-i-overheard-as-personal-communation"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:415 }); posts_hot_network.click({ item_type:2, location:8 })">
									Cite something I overheard as personal communation </a>

							</li>
							<li>
								<div class="favicon favicon-gamedev"
									title="Game Development Stack Exchange"></div> <a
								href="http://gamedev.stackexchange.com/questions/118862/how-do-i-ensure-a-piece-of-code-runs-only-once"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:53 }); posts_hot_network.click({ item_type:2, location:8 })">
									How do I ensure a piece of code runs only once? </a>

							</li>
							<li>
								<div class="favicon favicon-scifi"
									title="Science Fiction &amp; Fantasy Stack Exchange"></div> <a
								href="http://scifi.stackexchange.com/questions/123185/why-wouldnt-hermione-and-other-muggle-borns-say-voldemorts-name"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:186 }); posts_hot_network.click({ item_type:2, location:8 })">
									Why wouldn't Hermione (and other muggle borns) say Voldemort's
									name? </a>

							</li>
							<li>
								<div class="favicon favicon-mathematica"
									title="Mathematica Stack Exchange"></div> <a
								href="http://mathematica.stackexchange.com/questions/111223/nonzero-element-positions-of-a-matrix"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:387 }); posts_hot_network.click({ item_type:2, location:8 })">
									Nonzero element positions of a matrix </a>

							</li>
							<li>
								<div class="favicon favicon-programmers"
									title="Programmers Stack Exchange"></div> <a
								href="http://programmers.stackexchange.com/questions/313998/should-i-add-redundant-code-now-just-in-case-it-may-be-needed-in-the-future"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:131 }); posts_hot_network.click({ item_type:2, location:8 })">
									Should I add redundant code now just in case it may be needed
									in the future? </a>

							</li>
							<li>
								<div class="favicon favicon-security"
									title="Information Security Stack Exchange"></div> <a
								href="http://security.stackexchange.com/questions/118709/can-i-get-malware-on-my-phone-if-my-phone-is-tethered-to-my-laptop-downloading"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:162 }); posts_hot_network.click({ item_type:2, location:8 })">
									can i get malware on my phone, if my phone is tethered to my
									laptop downloading torrents? </a>

							</li>
							<li>
								<div class="favicon favicon-latin"
									title="Latin Language Stack Exchange"></div> <a
								href="http://latin.stackexchange.com/questions/631/old-vs-classical-latins"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:644 }); posts_hot_network.click({ item_type:2, location:8 })">
									Old vs Classical latins </a>

							</li>
							<li>
								<div class="favicon favicon-stats" title="Cross Validated"></div>
								<a
								href="http://stats.stackexchange.com/questions/203993/why-0-for-failure-and-1-for-success-in-a-bernoulli-distribution"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:65 }); posts_hot_network.click({ item_type:2, location:8 })">
									Why 0 for failure and 1 for success in a Bernoulli
									distribution? </a>

							</li>
							<li>
								<div class="favicon favicon-worldbuilding"
									title="Worldbuilding Stack Exchange"></div> <a
								href="http://worldbuilding.stackexchange.com/questions/38987/is-there-any-real-potential-advantage-to-having-two-hearts"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:579 }); posts_hot_network.click({ item_type:2, location:8 })">
									Is there any real potential advantage to having two hearts? </a>

							</li>
							<li>
								<div class="favicon favicon-worldbuilding"
									title="Worldbuilding Stack Exchange"></div> <a
								href="http://worldbuilding.stackexchange.com/questions/38502/would-a-bear-cavalry-be-feasible"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:579 }); posts_hot_network.click({ item_type:2, location:8 })">
									Would a bear cavalry be feasible? </a>

							</li>
							<li>
								<div class="favicon favicon-astronomy"
									title="Astronomy Stack Exchange"></div> <a
								href="http://astronomy.stackexchange.com/questions/14319/did-i-see-another-planet"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:514 }); posts_hot_network.click({ item_type:2, location:8 })">
									Did I see another planet? </a>

							</li>
							<li class="dno js-hidden" style="display: list-item;">
								<div class="favicon favicon-aviation"
									title="Aviation Stack Exchange"></div> <a
								href="http://aviation.stackexchange.com/questions/26463/which-type-of-airfoil-does-the-737-use"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:528 }); posts_hot_network.click({ item_type:2, location:8 })">
									Which type of airfoil does the 737 use? </a>

							</li>
							<li class="dno js-hidden" style="display: list-item;">
								<div class="favicon favicon-mechanics"
									title="Motor Vehicle Maintenance &amp; Repair Stack Exchange"></div>
								<a
								href="http://mechanics.stackexchange.com/questions/27593/what-is-the-reason-royal-enfield-classic-350"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:224 }); posts_hot_network.click({ item_type:2, location:8 })">
									what is the reason (royal enfield classic 350) </a>

							</li>
							<li class="dno js-hidden" style="display: list-item;">
								<div class="favicon favicon-worldbuilding"
									title="Worldbuilding Stack Exchange"></div> <a
								href="http://worldbuilding.stackexchange.com/questions/38590/humans-can-now-run-40-mph-how-do-i-keep-the-stupid-people-alive"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:579 }); posts_hot_network.click({ item_type:2, location:8 })">
									Humans can now run 40 mph. How do I keep the stupid people
									alive? </a>

							</li>
							<li class="dno js-hidden" style="display: list-item;">
								<div class="favicon favicon-math"
									title="Mathematics Stack Exchange"></div> <a
								href="http://math.stackexchange.com/questions/1716366/playing-with-fermats-little-theorem"
								class="js-gps-track"
								data-gps-track="site.switch({ item_type:8, target_site:69 }); posts_hot_network.click({ item_type:2, location:8 })">
									Playing with Fermat's little theorem </a>
						</ul>


					</div>
				</div>

			</div>


		</div>




		<!-- Footer-->
<!-- 		<footer id="footer">
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
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
	
	</footer> -->
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