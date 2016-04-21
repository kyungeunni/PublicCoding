<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Landed by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->



<link rel="stylesheet" href="assets/css/content.css">

<!-- 에디터 -->
<link href="resources/se/css/smart_editor2.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>


</head>
<body>

	<!-- Main -->
	<div id="main" class="wrapper style1">
		<div class="container">
			<header class="major">
				<!-- 					<h2>HTML5에서 div의 float을 주면 wrapper가 감싸지 못합니다.</h2>
					<p>#태그. #태그. #태그</p> -->
				<h2>${d.subject }</h2>
				<p>#태그. #태그. #태그</p>
			</header>

			<!-- Content -->
			<div id=mainbar>
				<section id="question">
					<div id="question" class="noanswerd qnacontent">

							<table border=0>
								<tr>
									<td width=15% align="right">
										<ul class=vote>
											<li><a href="#"><i class="fa fa-angle-up"></i></a></li>
											<li>0</li>
											<li><a href="#"><i class="fa fa-angle-down"></i></a></li>
										</ul>
									</td>

									<td width=85%>
										<p>${d.content}</p>

										<p id="written">
											asked by whom <img src="assets/vote-up.png">
										<p>
									</td>
								</tr>

							</table>
						</div>
				</section>

				<section id="answers">
					<h3 class="content-h">답변</h3>
					<%-- 			<jsp:include page="inner_content.jsp" /> --%>
					
						<div id="answer<%-- ${답변번호}  --%>" class="qnacontent" >

							<table border=0>
								<tr>
									<td width=15% align="right">
										<ul class=vote>
											<li><a href="#"><i class="fa fa-angle-up"></i></a></li>
											<li>0</li>
											<li><a href="#"><i class="fa fa-angle-down"></i></a></li>
										</ul>
									</td>

									<td width=85%>
										<p>${d.content}</p>

										<p id="written">
											asked by whom <img src="assets/vote-up.png">
										<p>
									</td>
								</tr>

							</table>
						</div>

						<div id="anawers" class="isanswerd"></div>
					

					<div class="content-h">
						<h3>당신의 답변을 적어주세요.</h3>
						<!-- 에디터 -->
						<textarea name="ir1" id="ir1"
							style="width: 800px; height: 300px; display: none;"></textarea>

						<div class="col-sm-offset-8 col-sm-8">
							<input type="button" id="sndbtn" class="btn btn-default"
								value="답변달기"> <input type="button"
								class="btn btn-default" onclick="javascript:history.back()"
								value="목록">
						</div>

						<script>
							$(function() {
								//전역변수선언
								var editor_object = [];
								nhn.husky.EZCreator
										.createInIFrame({
											oAppRef : editor_object,
											elPlaceHolder : "ir1",
											sSkinURI : "resources/se/SmartEditor2Skin.html",
											htParams : {
												// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
												bUseToolbar : true,
												// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
												bUseVerticalResizer : true,
												// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
												bUseModeChanger : false,
											}
										});
								//전송버튼 클릭이벤트
								$("#sndbtn")
										.click(
												function() {
													//id가 smarteditor인 textarea에 에디터에서 대입
													editor_object.getById["ir1"]
															.exec(
																	"UPDATE_CONTENTS_FIELD",
																	[]);
													// 이부분에 에디터 validation 검증
													//폼 submit
													$("#frm").submit();
												})
							})
						</script>

					</div>

				</section>
			</div>

			<div id="sidebar">
				<p>blar blar blar</p>
				<p>blar blar blar</p>
				<p>blar blar blar</p>
				<p>blar blar blar</p>
				<p>blar blar blar</p>
			</div>
		</div>
	</div>


	<!-- tags scripts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/dist/bootstrap-tagsinput.min.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/dist/bootstrap-tagsinput/bootstrap-tagsinput-angular.min.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/examples/assets/app.js"></script>
	<script
		src="resources/bootstrap-tagsinput-master/examples/assets/app_bs3.js"></script>

</body>
</html>