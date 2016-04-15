<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="assets/css/hyun/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/hyun/shop-homepage.css" rel="stylesheet">
</head>
<body>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <p class="lead"></p>
                <div class="list-group">
                    <a href="videolist.do?mode=1" class="list-group-item"><b>★Programing★</b></a>
                    <a href="videolist.do?mode=2" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>Java 언어</a>
                    <a href="videolist.do?mode=3" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>C 언어</a>
                    <a href="videolist.do?mode=4" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>JSP</a>
                    <a href="videolist.do?mode=5" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>Oracle Database</a>
                    <a href="videolist.do?mode=6" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>Spring</a>
                    <a href="videolist.do?mode=7" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>HTML</a>
                    <a href="videolist.do?mode=8" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>CSS</a>
                    <a href="videolist.do?mode=9" class="list-group-item hyuna1"><i class="glyphicon glyphicon-tint"></i>JavaScript</a>
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
                                 <a href="videolist.do?mode=2">
                                    <img class="slide-image" src="http://exponential.io/images/blog/headers/java_linux.jpg" alt="java">
                                 </a>
                                </div>
                                <div class="item">
                                 <a href="videolist.do?mode=5">
                                    <img class="slide-image" src="data:image/png;base64,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" alt="database">
                                 </a>
                                </div>
                                <div class="item">
                                 <a href="videolist.do?mode=6">
                                    <img class="slide-image" src="data:image/png;base64,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" alt="spring">
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
                <c:set var="celi" value="${fn:length(list)/4}"></c:set>
                <c:set var="celi_ok" value="${celi+(1-(celi%1))%1}"></c:set>
                <c:forEach var="i" begin="1" end="${celi_ok}" >
                <div class="row">
                 <c:forEach var="j" begin="${(i*4)-3}" end="${i*4==celi_ok*4?(fn:length(list)):i*4 }" items="${list}">
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail hyundiv">
                            <img src="${j.image}" alt="">
                            <div class="caption">
                                <h4 class="pull-right">YouTube</h4>
                                <h4>출처:</h4>
                                <p><a href="play.do?lecture=${j.lectureurl }" style="color: red;">${j.title }</a></p><!-- rgb(171,164,234) -->
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
    <script src="assets/js/hyun/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="assets/js/hyun/bootstrap.min.js"></script>
</body>
</html>