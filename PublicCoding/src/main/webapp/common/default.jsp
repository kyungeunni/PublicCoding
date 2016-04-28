<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

<body>

	<section>
		<article>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="#" alt="#">
					</div>

					<div class="item">
						<img src="#" alt="#">
					</div>

					<div class="item">
						<img src="#" alt="#">
					</div>

					<div class="item">
						<img src="#" alt="#">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</article>

		<article>
		<center>
		<div id="qnaboard">
			<h3>Q&A게시판</h3>
			
			<table class="table table-hover table-striped table-bordered table-condensed">
				
				<c:forEach var="d" items="${qlist }">
					<%-- 
						<div class="mainQna">
							<div class="summary">
								<h3>
									<a href="content.do?no=${d.bno }" class="question-hyperlink">${d.bsubject }
									</a>
								</h3>
							</div>

							<div class="started">
								<a href="users.do?no=&id=${d.mno }">${d.userid }</a> <span
									class="reputation-score" title="reputation score " dir="ltr"></span>
							</div>
						</div> --%>
			
				
				<tbody>
					<tr>
						<td>${d.mno }</td>
						<td>${d.bsubject }</td>
						<td>${d.userid }</td>
					</tr>
				</c:forEach>
				</tbody>
						
			</table>
			</div>
				</center>
		</article>
	



		<article>
		</article>

		<article>
			<center>
				<span>자유게시판</span>
			</center>
		</article>

		<article>
			<div>
				<center>
					<span>스터디 게시판</span>
				</center>
			</div>
		</article>

		<article>
			<div>
				<ul class="icons">
					<li><a href="#">about us</a></li>
				</ul>

				<ul class="copyright">
					<li>&copy;Copyright by SIST-C3.</li>
				</ul>

			</div>
		</article>

	</section>

</body>
</html>