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
                <h3>
                    Carousel Product Cart Slider</h3>
            </div>
            <div class="col-md-3">
                <!-- Controls -->
                <div class="controls pull-right hidden-xs">
                    <a class="left fa fa-chevron-left btn btn-primary" href="#carousel-example-generic"
                        data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-primary" href="#carousel-example-generic"
                            data-slide="next"></a>
                </div>
            </div>
        </div>
        
        <div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>
                                                Sample Product</h5>
                                            <h5 class="price-text-color">
                                                $199.99</h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <p class="btn-add">
                                            <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                        <p class="btn-details">
                                            <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-sm-4">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>
                                                Product Example</h5>
                                            <h5 class="price-text-color">
                                                $249.99</h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                        </div>
                                    </div>
                                    
                                    <div class="separator clear-left">
                                        <p class="btn-add">
                                            <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                        <p class="btn-details">
                                            <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="item">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>
                                                Grouped Product</h5>
                                            <h5 class="price-text-color">
                                                $249.99</h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <p class="btn-add">
                                            <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                        <p class="btn-details">
                                            <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-4">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>
                                                Grouped Product</h5>
                                            <h5 class="price-text-color">
                                                $249.99</h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <p class="btn-add">
                                            <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                        <p class="btn-details">
                                            <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

			<%-- 	<div class="col-md-12" id="maina">
					<div class="carousel slide" id="myCarousel">
						<div class="carousel-inner">
							<div class="item active">
								<c:forEach var="g1" begin="0" end="5" items="${g1list}">
									<ul class="thumbnails">
										<li class="col-sm-2">
											<div class="fff">
												<div class="thumbnail">
													<a href="play.do?gno=${g1.gno }"><img
														src="${g1.gimageurl}" alt=""></a>
												</div>
												<div class="caption">
													<h4>
														강의명: <br />${g1.gname }</h4>
													<a class="btn btn-mini" href="play.do?gno=${g1.gno }">
														강의 알아보기</a>
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
													<a class="btn btn-mini" href="courseGroup.do?gno=${g2.gno }"> 강의 알아보기</a>
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
				</div> --%>
			</div>
		</article>


		<article>
			<!-- 	<div class="row">
				<h4>원하는 정보를 검색해 보세요</h4>
			</div>
			<form action="#" method="get">
				<label class="control-label col-sm-2" for="tags">Tags:</label>
				<div class="form-group">
					<div class="example example_objects_as_tags">
						<div class="bs-example">
							<input type="text" id="tags" name="tags" placeholder="태그" />
							<input class="form-control" id="system-search" name="q"
							placeholder="검색어를 입력해주세요" required>
						</div>
					</div>
				</div>

			</form> -->
		</article>

		<article>
			<h3>Q&A 게시판</h3>
			<div id="qnaboard">
				<div class="container">
					<div class="row">
						<div class="col-md-9" id="col-line1">

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
											<td class="no1"><a href="content.do?no=${q.bno }">${q.bno }</a></td>
											<td class="title1"><a href="content.do?no=${q.bno }">${q.bsubject }</a></td>
											<td class="id1"><a href="userMain.do?mno=${q.mno }">${q.userid }</a></td>
										</tr>
									</c:forEach>
							</table>

						</div>
					</div>
				</div>
			</div>
		</article>


		<article>
			<h3>자유 게시판</h3>
			<div id="fboard">
				<div class="container">
					<div class="row">
						<div class="col-md-9" id="col-line2">

							<table class="table table-list-search">
								<thead>
									<tr>
										<th class="no">No.</th>
										<th class="title">제목</th>
										<th class="id">글쓴이</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="f" items="${flist }">
										<tr>
											<td class="no"><a
												href="freeboard_content.do?no=${f.bno }">${f.bno }</a></td>
											<td class="title"><a
												href="freeboard_content.do?no=${f.bno }">${f.bsubject }</a></td>
											<td class="id"><a href="userMain.do?mno=${f.mno }">${f.userid }</a></td>
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