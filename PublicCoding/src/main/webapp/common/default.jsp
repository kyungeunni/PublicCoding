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
<link type="text/css" rel="stylesheet" href="assets/css/main2.css">
</head>

<body>

	<section>

		<article>
			<div class="container" id="mainc">
				<div class="col-md-12" id="maina">
					<div class="carousel slide" id="myCarousel">
						<div class="carousel-inner">
							<div class="item active">
								<c:forEach var="g1" begin="1" end="6" items="${g1list}">
									<ul class="thumbnails">
										<li class="col-sm-2">
											<div class="fff">
												<div class="thumbnail">
													<a href="#"><img src="${g1.gimageurl}" alt=""></a>
												</div>
												<div class="caption">
													<h4>
														강의명: <br />${g1.gname }</h4>
													<a class="btn btn-mini" href="#"> 강의 알아보기</a>
												</div>
											</div>
										</li>
									</ul>
								</c:forEach>
							</div>
							<!-- /Slide1 -->
							<div class="item">
								<c:forEach var="g2" begin="1" end="6" items="${g2list}">
									<ul class="thumbnails">
										<li class="col-sm-2">
											<div class="fff">
												<div class="thumbnail">
													<a href="#"><img src="${g2.gimageurl}" alt=""></a>
												</div>
												<div class="caption">
													<h4>
														강의명: <br />${g2.gname }</h4>
													<a class="btn btn-mini" href="#"> 강의 알아보기</a>
												</div>
											</div>
										</li>
									</ul>
								</c:forEach>
							</div>
							<!-- /Slide2 -->
						</div>
						<nav>
							<ul class="control-box">
								<li><a data-slide="prev" href="#myCarousel" class="prev"><i
										class="glyphicon glyphicon-chevron-left"></i></a></li>
								<li><a data-slide="next" href="#myCarousel" class="next"><i
										class="glyphicon glyphicon-chevron-right"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</article>


		<article>
			<div class="row">
					<h4>원하는 정보를 검색해 보세요</h4>
				</div>
					<form action="#" method="get">
<label class="control-label col-sm-2" for="tags">Tags:</label>				
						<div class="form-group">
							
							<div class="col-sm-8">
								<div class="example example_objects_as_tags">
									<div class="bs-example">
										<input type="text" id="tags" name="tags" placeholder="태그" />
<!-- <input class="form-con







trol" id="system-search" name="q"
							placeholder="검색어를 입력해주세요" required> -->
									</div>
								</div>
							</div>
						</div>
						
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