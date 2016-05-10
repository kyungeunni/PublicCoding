<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="user/movie/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
$(function(){
		$('.rdate').click(function(){
			var day=$(this).text();
			var strArray=day.split('-');
			$('#span_date').text("일시: "+strArray[0]);
			$('#span_time').text("스터디 시간:"+strArray[1]);
			$('#day_jsp').val(strArray[0]);
			$('#time_jsp').val(strArray[1]);
			var param="mno="+$('#meetno_jsp').val()+"&day="+strArray[0]+"&time="+strArray[1];		
			sendMessage("POST", "reserve_time.do", param, timeInfo);
			
		});
});

function timeInfo(){
	if(httpRequest.readyState=4){
		if(httpRequest.status==200){
			$('#span_joined').html(httpRequest.responseText);
			$('#resImg').attr("class","btn btn-success btn-block");
			$('#resImg').css("cursor","pointer");
		}
	}
}

</script>
<title>Insert title here</title>


</head>
<body>
<%-- 	<center>
		<h3>${year }년도 ${month } 월</h3>
		<table id="table_content" width=315>
			<tr>
				<td><select name="year">
						<c:forEach var="i" begin="2016" end="2020">
							<option ${year==i?"selected":""  }>${i }</option>
						</c:forEach>
				</select>년도&nbsp; <select name="month">
						<c:forEach var="i" begin="1" end="12">
							<option ${month==i?"selected":""  }>${i }</option>
						</c:forEach>
				</select>월</td>
			</tr>
		</table>
		<table id="table_content" width=305>
			<tr>
				<c:forEach var="wstr" items="${weekList }">
					<th>${wstr }</th>
				</c:forEach>
			</tr>
			<c:forEach var="i" begin="1" end="${lastDay }">
				<c:if test="${i==1 }">
					<tr>
						<c:forEach var="j" begin="1" end="${week }">

							<td class="tdcenter">&nbsp;</td>
						</c:forEach>
				</c:if>
				<c:if test="${i>day }">
					<td class="tdcenter" bgcolor="#ccccff">
					<a href="#" year="${year }" month="${month }"  class="rdate">${i }</a>
						
					</td>
				</c:if>
				<c:if test="${i<=day }">
					<td class="tdcenter">${i }</td>
				</c:if>
				<c:set var="week" value="${week+1 }" />
				<c:if test="${week>6 }">
					<c:set var="week" value="0" />
					</tr>
					<tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</center> --%>
	<center>
		<table id="table_content" style="width:200px">
			<tr>
				<th>일시</th>
			</tr>

			<c:forEach var="vo" items="${tlist }">
				<tr  class="dataTr">
					<td class="rdate">${vo }</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>