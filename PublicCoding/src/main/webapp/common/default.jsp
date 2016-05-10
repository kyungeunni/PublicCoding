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
				<div class="row">
					<div class="row">
						<div class="col-md-9">
							<h2>PUCO 추천 강의</h2>
						</div>

						<div class="col-md-3">
							<!-- Controls -->
							<div class="controls pull-right hidden-xs">
								<a class="left fa fa-chevron-left btn btn-primary"
									href="#carousel-example-generic" data-slide="prev"></a><a
									class="right fa fa-chevron-right btn btn-primary"
									href="#carousel-example-generic" data-slide="next"></a>
							</div>
						</div>
					</div>
					<br> <br>

					<div id="carousel-example-generic" class="carousel slide hidden-xs"
						data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<div>
										<c:forEach var="g1" begin="0" end="1" items="${g1list}">
											<div class="col-sm-6">
												<div class="col-item">
													<div class="photo">
														<a href="play.do?gno=${g1.gno }"><img
															src="${g1.gimageurl}" alt=""></a>
													</div>
													<div class="info">
														<div class="row">
															<div class="price col-md-12">
																<h4>
																	강의명: <br>${g1.gname }<br>
																</h4>
															</div>
														</div>
														<div class="separator clear-left">
															<p class="btn-add">
																<i class="fa fa-shopping-cart"></i><a
																	href="http://www.jquery2dotnet.com" class="hidden-sm">
																	내강의 담기 </a>
															</p>
															<p class="btn-details">
																<i class="fa fa-list"></i><a
																	href="play.do?gno=${g1.gno }" class="hidden-sm">더
																	알아보기</a>
															</p>


														</div>
														<div class="clearfix"></div>
													</div>
												</div>
												<br> <br>
											</div>

										</c:forEach>
									</div>

									<div>
										<c:forEach var="g1" begin="2" end="3" items="${g1list}">
											<br>
											<br>
											<br>
											<br>
											<div class="col-sm-6">
												<div class="col-item">
													<div class="photo">
														<a href="play.do?gno=${g1.gno }"><img
															src="${g1.gimageurl}" alt=""></a>
													</div>
													<div class="info">
														<div class="row">
															<div class="price col-md-12">
																<h4>
																	강의명: <br>${g1.gname }<br>
																</h4>
															</div>
														</div>
														<div class="separator clear-left">
															<p class="btn-add">
																<i class="fa fa-shopping-cart"></i><a
																	href="http://www.jquery2dotnet.com" class="hidden-sm">
																	내강의 담기 </a>
															</p>
															<p class="btn-details">
																<i class="fa fa-list"></i><a
																	href="play.do?gno=${g1.gno }" class="hidden-sm">더
																	알아보기</a>
															</p>
														</div>
														<div class="clearfix"></div>
													</div>
												</div>
												<br> <br>
											</div>
										</c:forEach>

									</div>


								</div>
							</div>

							<div class="item">
								<div class="row">
									<c:forEach var="g2" begin="1" end="2" items="${g2list}">
										<div class="col-sm-6">
											<div class="col-item">
												<div class="photo">
													<a href="#"><img src="${g2.gimageurl}" alt=""></a>
												</div>

												<div class="info">
													<div class="row">
														<div class="price col-md-12">
															<h4>
																강의명: <br>${g2.gname }<br>
															</h4>
															<h5>총강의수: ${g2.totalcno }</h5>
														</div>
													</div>
													<div class="separator clear-left">
														<p class="btn-add">
															<i class="fa fa-shopping-cart"></i> <a
																href="http://www.jquery2dotnet.com" class="hidden-sm">
																내강의 담기 </a>
														</p>
														<p class="btn-details">
															<i class="fa fa-list"></i><a
																href="play.do?gno=${g1.gno }" class="hidden-sm">더
																알아보기</a>
														</p>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
											<br> <br>
										</div>
									</c:forEach>

									<c:forEach var="g2" begin="3" end="4" items="${g2list}">
										<div class="col-sm-6">
											<div class="col-item">
												<div class="photo">
													<a href="#"><img src="${g2.gimageurl}" alt=""></a>
												</div>

												<div class="info">
													<div class="row">
														<div class="price col-md-12">
															<h4>
																강의명: <br> ${g2.gname }<br>
															</h4>
															<h5>총강의수: ${g2.totalcno }</h5>
														</div>
													</div>
													<div class="separator clear-left">
														<p class="btn-add">
															<i class="fa fa-shopping-cart"></i> <a
																href="http://www.jquery2dotnet.com" class="hidden-sm">
																내강의 담기 </a>
														</p>
														<p class="btn-details">
															<i class="fa fa-list"></i><a
																href="play.do?gno=${g1.gno }" class="hidden-sm">더
																알아보기</a>
														</p>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
											<br> <br>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>


		<article>
			<form action="#" method="get">
				<h3 class="h3class">게시판 통합검색</h3>
				<input class="form-control" id="system-search" name="q"
					placeholder="검색어를 입력해주세요">
			</form>
		</article>

		<article>
			<center>
				<div class="h3m">
					<h3 class="h3n">Q&A 게시판</h3>
				</div>
			</center>
			<div id="qnaboard">
				<div class="container">
					<div class="row">
						<div id="col-line1"style="height: 70vh; overflow: auto">
							<div class="table-size">
								<table class="table table-list-search">
									<thead>
										<tr class="qtr">
											<th class="tag" style="text-align: center">tag</th>
											<th class="title">제목</th>
											<th class="id">글쓴이</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="q" items="${qlist }">
											<tr class="qtr1">
												<td class="tag1" style="text-align: center"><a
													href="content.do?no=${q.bno }&page=1">${q.tag1 }</a></td>
												<td class="title1"><a href="content.do?no=${q.bno }&page=1">${q.bsubject }</a></td>
												<td class="id1"><a href="userMain.do?mno=${q.mno }">${q.userid }</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>


		<article>
			<center>
				<div class="h3m">
					<h3 class="h3n">자유 게시판</h3>
				</div>
			</center>
			<div id="fboard">
				<div class="container">
					<div class="row">
						<div id="col-line2" style="height: 70vh; overflow: auto">
							<table class="table table-list-search">
								<thead>
									<tr>
										<th class="title2" style="text-align: left">제목</th>
										<th class="id2"style="text-align: left">글쓴이</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="f" items="${flist }">
										<tr class="ftr">
											<td class="title3" style="text-align:left"><a	href="freeboard_content.do?no=${f.bno }&page=1">${f.bsubject }</a></td>
											<td class="id3" style="text-align: left"><a href="userMain.do?mno=${f.mno }">${f.userid }</a></td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</article>

		<article>
			<center>
				<div class="h3m">
					<h3 class="h3n">오프라인 스터디</h3>
				</div>
			</center>
			<div id="qnaboard">
				<div class="container">
					<div class="row">
						<div class="col-md-9" id="col-line1"
							style="height: 70vh; overflow: auto">
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
		<article></article>

	</section>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('#myCarousel').carousel({
				interval : 5000
			});
			$('#carousel-text').html($('#slide-content-0').html());
			//Handles the carousel thumbnails
			$('[id^=carousel-selector-]').click(function() {
				var id_selector = $(this).attr("id");
				var id = id_selector.substr(id_selector.length - 1);
				var id = parseInt(id);
				$('#myCarousel').carousel(id);
			});
			// When the carousel slides, auto update the text
			$('#myCarousel').on('slid', function(e) {
				var id = $('.item.active').data('slide-number');
				$('#carousel-text').html($('#slide-content-' + id).html());
			});
		});
	</script>
</body>


</html>