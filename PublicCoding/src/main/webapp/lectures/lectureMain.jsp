<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
=======
>>>>>>> refs/remotes/origin/master
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">
<!-- 썸네일 -->
<link href="assets/css/hyun/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/hyun/shop-homepage.css" rel="stylesheet">
</head>

<<<<<<< HEAD
<body>
=======
>>>>>>> refs/remotes/origin/master
	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<div class="panel-group" id="accordion">
						
							<%-- <c:forEach var="d" items="${dlist }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseOne">
												<i class="fa fa-code"></i>${d.dname }</a>
										</h4>
									</div>
									
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<table class="table">
												<c:forEach var="s" items="${slist }">
													<tr>
														<td><a href="#">${s.sname }</a></td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</div>
								</div>
							</c:forEach> --%>
							<c:forEach var="d" items="${dlist }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="#collapseOne">
												<i class="fa fa-code"></i>${d.dname }</a>
										</h4>
									</div>
									
									
									<div id="collapseOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<table class="table">
											<c:forEach var="s" items="${slist }">
												<c:if test="${d.dno == s.dno }">
													<tr>
														<td><a href="#">${s.sname }</a></td>
													</tr>
												</c:if>
											</c:forEach>	
											</table>
										</div>
									</div>
								</div>
							</c:forEach>
						
							<!-- <div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseOne">
											<i class="fa fa-code"></i> 언어</a>
									</h4>
								</div>
								
								<div id="collapseOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<table class="table">
											<tr>
												<td>	<a href="#">자바</a></td>
											</tr>
											
											<tr>
												<td>	<a href="#">C/C++</a></td>
											</tr>
											
											<tr>
												<td>	<a href="#">Ruby</a></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseTwo">
												<i class="fa fa-database"></i> 데이터베이스</a>
									</h4>
								</div>
								
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tr>
												<td><a href="#">데이터베이스 기초</a></td>
											</tr>
											
											<tr>
												<td><a href="#">Oracle</a></td>
											</tr>
											
											<tr>
												<td><a href="#">My SQL</a></td>
											</tr>
											
										</table>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapseThree"> <i class="fa fa-css3"></i> WEB/HTML/CSS</a>
									</h4>
								</div>
								
								<div id="collapseThree" class="panel-collapse collapse">
									<div class="panel-body">
										<table class="table">
											<tr>
												<td><a href="#">WEB</a></td>
											</tr>
											
											<tr>
												<td><a href="#">HTML</a></td>
											</tr>
											
											<tr>
												<td><a href="#">CSS</a></td>
											</tr>
											
											<tr>
												<td><a href="#">Jquery</a></td>
											</tr>
											
										</table>
									</div>
								</div>
							</div> -->
							
						</div>
					</div>
				</div>
			</div>
		</article>

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
			<div class="text">
				<span>
				<!-- 썸내일 시작 -->
				<c:set var="celi" value="${fn:length(list)/4}"></c:set>
                <c:set var="celi_ok" value="${celi+(1-(celi%1))%1}"></c:set>
                <c:forEach var="i" begin="1" end="${celi_ok}" >
                <div class="row" style="margin-top: 30px ">
                 <c:forEach var="g" begin="${(i*4)-3}" end="${i*4 }" items="${list}">
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail hthumbnail">
                            <img src="${g.GimageURL}">
                            <div class="caption">
                                <h4 class="pull-right">강의명:${g.Gname }</h4>
                                <p><a href="play.do?So=${g.Sno }" style="color: red;">${g.Gintro }<br>
                               	 총강의수:${g.TotalCno }강</a></p><!-- rgb(171,164,234) -->
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
                 </div>
                 </c:forEach>
                 </span>
                 <!-- 썸내일 끝 -->
			</div>
		</article>
	</section>
	
	<!-- 썸네일 -->
	<!-- jQuery -->
    <script src="assets/js/hyun/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="assets/js/hyun/bootstrap.min.js"></script>
</body>
</html>