<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="onoffmix/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	$(function() {
		sendMessage("POST", "movie_info.do", null, movieCallback);

		//sendMessage("POST", "theater_info.do", null, theaterCallback);
	});
	function movieCallback() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				//alert(httpRequest.responseText);
				$('#mi').html(httpRequest.responseText);
			}
		}
	}
</script>
</head>
<body>
	<center>
		<h3>스터디신청</h3>
		<table id="table_content" height=450 width=900>
			<tr>
				<td width=23% class="tdcenter" height=300 id="mi" valign="top"></td>
				<td width=22% class="tdcenter" height=300 id="ti" valign="top" style="overflow: auto"></td>
				<td width=25% class="tdcenter" height=300 id="di" valign="top"></td>
				<td width=30% rowspan="2" class="tdleft" valign="top" height=500>
					<table id="table_content" width="270" height=500>
						<tr>
							<th>예약정보</th>
						</tr>
						<tr>
							<td class="tdcenter" id="poster_div"></td>
						</tr>
						<tr>
							<td class="tdcenter" id="span_title"></td>
						</tr>
						<tr>
							<td id="span_tname">장소:</td>
						</tr>
						<tr>
							<td id="span_date">날짜:</td>
						</tr>
						<tr>
							<td id="span_time">스터디 시간:</td>
						</tr>
						<tr>
							<td id="span_inwon">최소인원:</td>
						</tr>
						<tr>
							<td id="span_joined">참가자:</td>
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
							<img src="assets/img/res_d.png" border=0 id="resImg">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="tdcenter" height=150 id="timei"></td>
				<td width=20% class="tdcenter" height=150 id="res_inwon">
					
				</td>
			</tr>
		</table>
	</center>
</body>
</html>




