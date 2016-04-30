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
			<div class="col-md-3">
					<form action="#" method="get">
						<div class="input-group">
							<input class="form-control" id="system-search" name="q" 
							placeholder="검색어를 입력해주세요" required>

						</div>
					</form>
			</div>
			</center>
		</article>

		<article>
			<div id="qnaboard">
				<div class="container">
					<div class="row">
						<div class="col-md-9">
							Q & A 게시판	
							<table class="table table-list-search">
								<thead>
									<tr>
										<th class="no">No</th>
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




		<article>
				<div id="qnaboard">
				<div class="container">
					<div class="row">
						<div class="col-md-9">
							Q & A 게시판	
							<table class="table table-list-search">
								<thead>
									<tr>
										<th class="no">No</th>
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

		<article>
			<div>
					<div id="qnaboard">
				<div class="container">
					<div class="row">
						<div class="col-md-9">
							Q & A 게시판	
							<table class="table table-list-search">
								<thead>
									<tr>
										<th class="no">No</th>
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