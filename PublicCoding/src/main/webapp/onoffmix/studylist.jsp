<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="EUC-KR">

<!-- <link type="text/css" rel="stylesheet" href="../assets/css/userMain.css"> -->
<title>Insert title here</title>
</head>
<body>
	<section>

		<div class="container">
			<div class="row">
				<c:forEach var="vo" items="${list }">
					<div class="col-md-4" style="display: inline-block; float: left">
						<div class="well profile">
							<h3>${vo.title }</h3>
							<div class="col-sm-6 col-md-4 profilepic">

								<img src="${vo.poster}" alt="" width="120" height="180"
									class="img-rounded">


							</div>
							<div class="col-sm-6 col-md-7" style="margin-left: 20px">

								<table id="table_content" width="200px" height="200px"
									style="padding-left: 20px;">

									<tr>
										<td id="span_tname">���: ${vo.tname} (${vo.loc})</td>
									</tr>
									<tr>
										<td id="span_date">��¥: ${vo.meetdate}</td>
									</tr>
									<tr>
										<td id="span_time">���͵� �ð�: ${vo.meettime}</td>
									</tr>
									<tr>
										<td id="span_inwon">�ּ��ο�: ${vo.maxpeople}</td>
									</tr>

									<tr>
										<td class="tdcenter">
											<form method="post" action="register_ok.do" id="res_frm">
												<input type="hidden" id="title_jsp" name="title"> <input
													type="hidden" id="meetno_jsp" name="meetno"> <input
													type="hidden" id="theater_jsp" name="theater"> <input
													type="hidden" id="day_jsp" name="day"> <input
													type="hidden" id="time_jsp" name="time"> <input
													type="hidden" id="loc_jsp" name="tno">

											</form>
										</td>
									</tr>
								</table>
							</div>
							<div>
								<div style="width: inherit;">
									<table width="300">
										<tr>
											<td width="25%"><strong><font color="red"><i
														class="fa fa-heart" aria-hidden="true"></i></font>&nbsp;������:</strong></td>
											<td width="75%" id="span_joined">
												<div>
													<%-- ������: ${jnum} �� --%>
													<c:forEach var="d" items="${mjoinedmap[vo.groupno] }">
														<span><a href="userMain.do?mno=${d}"
															title="user���� ����"><img
																src="resources/userprofiles/${imgmapmap[vo.groupno][d]}" alt=""
																width="40" height="40" class="img-rounded"> </a> </span>
													</c:forEach>
													<input type="hidden" value="${ minp}">
												</div>
											</td>
										</tr>
									</table>
								</div>
								<button class="btn btn-success btn-block">
									<span class="fa fa-plus-circle"></span> �����ϱ�
								</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>


	</section>

	<!-- <div>
		<table id="table_content" width="270" height=500>
			<tr>
				<th>��������</th>
			</tr>
			<tr>
				<td class="tdcenter" id="poster_div"></td>
			</tr>
			<tr>
				<td class="tdcenter" id="span_title"></td>
			</tr>
			<tr>
				<td id="span_tname">���:</td>
			</tr>
			<tr>
				<td id="span_date">��¥:</td>
			</tr>
			<tr>
				<td id="span_time">���͵� �ð�:</td>
			</tr>
			<tr>
				<td id="span_inwon">�ּ��ο�:</td>
			</tr>
			<tr>
				<td id="span_joined">������:</td>
			</tr>
			<tr>
				<td class="tdcenter">
					<form method="post" action="register_ok.do" id="res_frm">
						<input type="hidden" id="title_jsp" name="title"> <input
							type="hidden" id="meetno_jsp" name="meetno"> <input
							type="hidden" id="theater_jsp" name="theater"> <input
							type="hidden" id="day_jsp" name="day"> <input
							type="hidden" id="time_jsp" name="time"> <input
							type="hidden" id="loc_jsp" name="tno">

					</form> <img src="assets/img/res_d.png" border=0 id="resImg">
				</td>
			</tr>
		</table>
	</div>
 -->

</body>
</html>