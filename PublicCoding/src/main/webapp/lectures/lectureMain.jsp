<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="lectures/lectures.css">

<!-- 썸네일 -->
<!-- <link href="assets/css/hyun/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/hyun/shop-homepage.css" rel="stylesheet"> -->
</head>


<body>
	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<div class="panel-group" id="accordion">
							<c:forEach var="d" items="${dlist }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapse${d.dno}">
											<c:if test="${d.dno == 1 }">
												<i class="fa fa-code"></i>${d.dname }</a>
											</c:if>
											<c:if test="${d.dno == 2 }">
												<i class="fa fa-database"></i>${d.dname }</a>
											</c:if>
											<c:if test="${d.dno == 3 }">
												<i class="fa fa-css3"></i>${d.dname }</a>
											</c:if>
										</h4>
									</div>
									<div id="collapse${d.dno}" class="panel-collapse collapse in">
										<div class="panel-body">
											<table class="table">
												<c:forEach var="sl" items="${slist }">
													<c:forEach var="s" items="${sl }">
														<c:if test="${d.dno == s.dno }">
															<tr>
																<td><a href="courseGroup.do?sno=${s.sno }">${s.sname }</a></td>
															</tr>
														</c:if>
													</c:forEach>
												</c:forEach>
											</table>
										</div>
									</div>

								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</article>

		<article>
			<div class="textte">

				<span> <!-- 썸내일 시작 -->
					<c:set var="celi" value="${fn:length(glist)/4}"></c:set>
					<c:set var="celi_ok" value="${celi+(1-(celi%1))%1}"></c:set>
					
					<c:forEach var="i" begin="1" end="${celi_ok}">
						<div class="row">
							<c:forEach var="g" begin="${(i*4)-4}" end="${(i*4)-1 }" items="${glist}">

								<div class="col-sm-3 col-lg-3 col-md-3">
									<div class="thumbnail hthumbnail">
										<div class=tumbnailb">
											<img src="${g.gimageurl}">
										</div>
										
										<div class="caption">
											<br> <br>
											<h4 class="nowrap">
												<a href="play.do?gno=${g.gno }" style="color: red;">강의명: ${g.gname }</a>
											</h4>
											<h5>총 강의수 : ${g.totalcno }강</h5>

											</p>
											<!-- rgb(171,164,234) -->
										</div>
										
            <div class="well well-sm">
                <div class="row">
                
                    <div class="col-xs-12 col-md-6 text-center">
                        <h1 class="rating-num">4.0</h1>
                        <div class="rating">
                            <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                            </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                            </span><span class="glyphicon glyphicon-star-empty"></span>
                        </div>
                        <div>
                            <span class="glyphicon glyphicon-user"></span>1,050,008 total
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-md-6">
                        <div class="row rating-desc">
                        
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>5
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 5 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>4
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 4 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>3
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>2
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        <span class="sr-only">20%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>1
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                        aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                        <span class="sr-only">60%</span>
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                    </div>
                </div>
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
</body>
</html>