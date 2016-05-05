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
				<div id="mainbar" style="display: inline;">
					
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
				<div id="sidebar" style="width: 600px">
					<div id="hot-network-questions" class="module" style="width: 100%;">
						<h4 class="js-gps-track" style="display: inline; color: white;">IT 실시간 뉴스</h4>&nbsp;&nbsp;
						<form method="post" action="qnaboard.do">
						<input type="text" style="width: 200px; display: inline;" name="title" value="${search }">
						<input type="submit" value="검색">
						<input type="hidden" value="${curpage }" name="page">
						</form>
						<ul>
							<c:forEach var="vo" begin="0" end="20" items="${newslist }">
							<li>
								<div style="width:100%;overflow:hidden;white-space:nowrap;text-overflow:ellipsis; color: gold;cursor: pointer;" class="newsClass">
									${vo.title }<br>
								</div>
								<div style="color: gray;display: none;">
								&nbsp;&nbsp;&nbsp;└
								<a href="${vo.link }" style="color: gray;">
								${vo.description }
								</a>
								</div>
							</li>
							</c:forEach>
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
			
			var shownum=0;
			$('.newsClass').click(function(){
				if(shownum==0){
					$(this).nextAll().show();
					shownum=1;
				}else{
					$(this).nextAll().hide();
					shownum=0;
				}
			});
		});
	</script>



</body>
</html>