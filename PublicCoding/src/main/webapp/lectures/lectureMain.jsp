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
<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">

</head>

<body>
	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
							
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
							</div>
							
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
				<span>동영상들~~~</span>
			</div>
		</article>

	</section>

</body>
</html>