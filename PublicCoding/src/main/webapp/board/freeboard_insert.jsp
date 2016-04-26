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
<title>PUBLIC CODING</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->


<!-- 태그CSS -->

<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="resources/input_tags/bootstrap-tagsinput.css">
    <link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css">
    <link rel="stylesheet" href="resources/input_tags/app.css">
    

<link rel="stylesheet" href="assets/css/newboard.css" />

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript"	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script>
	$(function() {
		//전역변수선언
		var editor_object = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "ir1",
			sSkinURI : "resources/se/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,

			}
		});

		//전송버튼 클릭이벤트
		$("#sndbtn").click(function() {
			var title = $('#title').val();
			if (title.trim() == "") {
				$('#title').focus();
				alert("2");
				return;
			}
			alert(1);
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			alert(2);
			// 이부분에 에디터 validation 검증
			//폼 submit
			$("#frm").submit();
		})
	})
</script>
</head>
<body>

	<!-- Main -->
	<div id="main" class="wrapper style1">
		<div class="container">
			<header class="major">
				<h2>자유게시판(Freeboard)</h2>
				<p>자유롭게 글을 작성해 주세요.</p>
			</header>

			<!-- Content -->
			<section id="content" style="margin-top: auto;">
				<div id="mbar" align="center">
					<!-- 컨텐츠 -->
					<form class="form-horizontal" role="form" action="freeboard_insert_ok.do"
						method="post" id="frm">

						<!-- 제목 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="title">Title:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="Enter title">
							</div>
						</div>
						<!-- 에디터 -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">Content:</label>
							<div class="col-sm-9">
								<textarea name="ir1" id="ir1"
									style="width: 775px; height: 300px; display: none;"></textarea>
								<input type="hidden" id="taglist" name="taglist">
							</div>
						</div>

						<!-- 글쓰기버튼 -->

						<div class="col-sm-offset-4 col-sm-8">
							<input type="button" id="sndbtn" value="글쓰기"> <input
								type="button" onclick="javascript:history.back()" value="취소">
						</div>



					</form>
</body>
</html>