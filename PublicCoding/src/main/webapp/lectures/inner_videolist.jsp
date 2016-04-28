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
<!-- git test -->
    <!-- Page Content -->
    <div class="container">
    		<div class="page-header" style="margin-top: 100px">
 				<h1 style="font: 20px 맑은 고딕">신입 SW인력을 위한 실전  동영상 과정 <small>Subtext for header</small></h1>
			</div>
            <div class="row">
	                <c:forEach var="g" begin="1" end="${fn:length(glist)}" items="${glist}">
	                    <div class="col-sm-3 col-lg-3 col-md-3">
	                        <div class="thumbnail hthumbnail">
	                            <img src="${g.gimageurl}">
	                            <div class="caption">
	                                <h4 class="pull-right">강의명:${g.gname }</h4>
	                                <p><a href="play.do?gno=${g.gno }" style="color: red;">${g.gintro }<br>
	                               	 총강의수:${g.totalcno }강</a></p><!-- rgb(171,164,234) -->
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
               <%--  <c:set var="celi" value="${fn:length(list)/4}"></c:set>
                <c:set var="celi_ok" value="${celi+(1-(celi%1))%1}"></c:set>
                <c:forEach var="i" begin="1" end="${celi_ok}" >
                <div class="row" style="margin-top: 30px ">
                 
                 <c:forEach var="g" begin="${(i*4)-3}" end="${i*4==celi_ok*4?(fn:length(glist)):i*4 }" items="${glist}">
                    <div class="col-sm-3 col-lg-3 col-md-3">
                        <div class="thumbnail hthumbnail">
                            <img src="${g.gimageurl}">
                            <div class="caption">
                                <h4 class="pull-right">강의명:${g.gname }</h4>
                                <p><a href="play.do?gno=${g.gno }" style="color: red;">${g.gintro }<br>
                               	 총강의수:${g.totalcno }강</a></p><!-- rgb(171,164,234) -->
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
                   </c:forEach> --%>
                </div>
            </div>
    <!-- jQuery -->
    <script src="assets/js/hyun/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="assets/js/hyun/bootstrap.min.js"></script>
</body>
</html>