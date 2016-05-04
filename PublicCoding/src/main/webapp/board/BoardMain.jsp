<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	List<BoardDTO> d = dao.boardListData(0);
%> --%>

<!DOCTYPE HTML>
<html>
<head>
<title>PUBLIC CODING</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/newboard.css" />
</head>

<body>
		<!-- Main -->

		<div class="container">
			<div class="major" id="boardlistmajor">
				<div id="pucoof"><h2>PUCO Overflow</h2></div>
				<div  id="btnqst">
										<c:if test="${sessionScope.id!=null }">
										<h5 ><a href="question.do" id="asking"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>질문하기</a></h5>
										</c:if>
										
										<c:if test="${sessionScope.id==null }">
										<h5 ><a href="#"  data-toggle="modal" data-target="#login"  id="asking"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>질문하기</a></h5>
										</c:if>
								</div>
			</div>
			

			<!-- Content -->
			<div id="content" class="snippet-hidden">


				<!-- 추가 -->
				<div id="mainbar">
					
					<header class="subheader">
						<h1 id="h-top-questions">Top Questions</h1>
						<div id="tabs">
							<a href="?order=1" data-nav-xhref=""
								title="Questions that may be of interest to you based on your history and tag preference"
								data-value="interesting"
								<c:if test="${order==1}">class="youarehere"</c:if> > 최신등록</a> <a href="?order=2"
								data-nav-xhref="" title="Questions with an active bounty"
								data-value="featured" <c:if test="${order==2}">class="youarehere"</c:if>> 
								높은조회수
							</a> <a href="?order=3" data-nav-xhref=""
								title="Questions with the most views, answers, and votes over the last few days"
								data-value="week" <c:if test="${order==3}">class="youarehere"</c:if>>인기답변 </a> 

						</div>
					</header>


					<div id="qlist-wrapper">
						<div id="question-mini-list">


							<c:forEach var="d" items="${ list }">



								<div class="question-summary narrow">
									<!-- 카운트,뷰,보트 영역 -->
									<div
										onclick="window.location.href='content.do?no=${d.bno }&page=${curpage}'"
										class="cp">
										<div class="votes <c:if test="${d.bvote>0}">voted</c:if>">
											<div class="mini-counts">
												<span title="${d.bvote} votes">${d.bvote}</span>
											</div>
											<div>votes</div>
										</div>
										
										<div class="status  <c:if test="${d.answer>0}">answered</c:if>">
											<div class="mini-counts">
												<span title="${d.answer } answers">${d.answer }</span>
											</div>
											<div>answers</div>
										</div>
										<div class="views">
											<div class="mini-counts">
												<span title="${d.bhit } views">${d.bhit } </span>
											</div>
											<div>views</div>
										</div>
									</div>

									<!-- 질문과 시간영역 -->

									<div class="summary">
										<h3>
											<a href="content.do?no=${d.bno }&page=${curpage}" class="question-hyperlink">${d.bsubject }
											</a>
										</h3>
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

										
										<div class="started">
											<a
												href="content.do?no=${d.bno }"
												class="started-link"	><span title="${d.bdate }" class="relativetime">${rtime[d.bno]}</span></a>
												
											<a href="userMain.do?mno=${d.mno }">${d.userid }</a> <span
												class="reputation-score" title="reputation score " dir="ltr"></span>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
						<div class="col-sm-offset-3 col-sm-8">
						
							<a href="qnaboard.do?page=${curpage>1?curpage-1:curpage }&order=${order}"><i class="fa fa-chevron-circle-left" aria-hidden="true">이전페이지</i></a>&nbsp;
			          ${curpage } page / ${totalpage } pages<a href="qnaboard.do?page=${curpage<totalpage?curpage+1:curpage }&order=${order}">
			          <i class="fa fa-chevron-circle-right" aria-hidden="true">다음페이지</i></a><br>
			          
							
						</div>
					</div>
				</div>
				<div id="sidebar">
					<div id="hot-network-questions" class="module">
						<h4>
							<a href="//stackexchange.com/questions?tab=hot"
								class="js-gps-track"
								data-gps-track="posts_hot_network.click({ item_type:1, location:8 })">
								IT 실시간 뉴스 </a>
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
		




	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/jquery.scrollex.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/modal.js"></script>
	<!-- 회원가입/로그인 팝업창 띄우기 -->
	<script src="../assets/js/popup.js"></script>



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