<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="onoffmix/table.css">
<title>Insert title here</title>
</head>
<body>
<center>
<table id="table_content" width="600" height=500>
						<tr>
							<th colspan="2">예약정보</th>
						</tr>
						<tr>
							<td class="tdcenter" id="poster_div" rowspan="8">
							<img src="${vo.poster}" alt="" width="200" height="300"
									class="img-rounded"></td>
						</tr>
						<tr>
							<td class="tdcenter" id="span_title">${vo.title }</td>
						</tr>
						<tr>
							<td id="span_tname">장소: ${vo.tname} (${vo.loc})</td>
						</tr>
						<tr>
							<td id="span_date">날짜: ${vo.meetdate}</td>
						</tr>
						<tr>
							<td id="span_time">스터디 시간: ${vo.meettime}</td>
						</tr>
						<tr>
							<td id="span_inwon">최소인원:최소인원: ${vo.maxpeople} (현재 ${jnummap[vo.groupno]}명)</td>
						</tr>
						<tr>
							<td id="span_joined">참가자:<div>
													
													<c:forEach var="d" items="${mjoinedmap[vo.groupno] }">
														<span><a href="userMain.do?mno=${d}"
															title="user정보 보기"><img
																src="resources/userprofiles/${imgmapmap[vo.groupno][d]}" alt=""
																width="40" height="40" class="img-rounded"> </a> </span>
													</c:forEach>
													<input type="hidden" value="${ minp}">
												</div></td>
						</tr>
						<tr>
							<td class="tdcenter">
							<form method="post" action="register_ok.do" id="res_frm">
								<input type="hidden" id="title_jsp" name="title">
								<input type="hidden" id="meetno_jsp" name="meetno">
								<input type="hidden" id="theater_jsp" name="theater">
								<input type="hidden" id="day_jsp" name="day">
								<input type="hidden" id="time_jsp" name="time">
								<input type="hidden" id="loc_jsp" name="tno"> 
								<input type="hidden" id="isfirst_jsp" name="jnum">
							</form>
							<!-- <img src="assets/img/res_d.png" border=0 id="resImg"> -->
							<button class="btn btn-success btn-block " id="resImg">
							<!-- btn btn-success btn-block -->
									<span class="fa fa-plus-circle"></span> 참가하기
								</button>
							</td>
						</tr>
					</table>

</center>
<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=99c036c2f0f9f7cf0da349dbdfb62c19"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(${axis[0]},${axis[1]}),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>

</body>
</html>