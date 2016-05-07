<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="user/movie/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
$(function(){
	$('.theater_name').click(function(){
		var tname=$(this).text();
		$('#span_tname').text("극장명:"+tname);
		$('#theater_jsp').val(tname);
		sendMessage("POST", "reserve_date.do", null, reserveDate);
	});
});

function reserveDate(){
	if(httpRequest.readyState=4){
		if(httpRequest.status==200){
			$('#di').html(httpRequest.responseText);
		}
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
	<center>
		<table id="table_content" style="width:180px">
			<tr>
				<th>장소</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr class="dataTr">
					<td class="theater_name" id="${vo.tno}" >${vo.tname}(${vo.loc })</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>