<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	List<String> list=new ArrayList<String>();
	for(int i=0;i<20;i++){
		list.add("김현성:"+i);
	}
	request.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>PublicCode</title>
    <!-- Bootstrap Core CSS -->
    <link href="../assets/css/hyun/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/hyun/shop-homepage.css" rel="stylesheet">
</head>
<body>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <p class="lead"></p>
                <div class="list-group">
                    <a href="videolist.do?mode=1" class="list-group-item"><b>★Programing★</b></a>
                    <a href="videolist.do?mode=2" class="list-group-item">-Java-</a>
                    <a href="videolist.do?mode=3" class="list-group-item">-C/C++-</a>
                    <a href="videolist.do?mode=4" class="list-group-item">-JSP-</a>
                    <a href="videolist.do?mode=5" class="list-group-item">-Oracle-</a>
                    <a href="videolist.do?mode=6" class="list-group-item">-Spring-</a>
                    <a href="videolist.do?mode=7" class="list-group-item">-HTML-</a>
                    <a href="videolist.do?mode=8" class="list-group-item">-CSS-</a>
                    <a href="videolist.do?mode=9" class="list-group-item">-JavaScript-</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                 <a href="#">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                 </a>
                                </div>
                                <div class="item">
                                 <a href="#">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                 </a>
                                </div>
                                <div class="item">
                                 <a href="#">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                 </a>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <c:set var="celi" value="${fn:length(list)/4 }"></c:set>
                <c:forEach var="i" begin="1" end="${celi+(1-(celi%1))%1 }" >
                <div class="row">
                 <c:forEach var="j" begin="${(i*4)-3 }" end="${i*4 }" items="${list}">
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail hyundiv">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">YouTube</h4>
                                <h4>출처:</h4>
                                <p><a href="#">You Tube와 함깨하는 Java강의asdfasdf</a></p>
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
                </div>
            </div>
        </div>
    
    <!-- jQuery -->
    <script src="../assets/js/hyun/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../assets/js/hyun/bootstrap.min.js"></script>
</body>
</html>