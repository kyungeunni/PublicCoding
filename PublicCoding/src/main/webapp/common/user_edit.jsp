<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 태그CSS -->
<link type="text/css" rel="stylesheet" href="assets/css/userMain.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="resources/input_tags/bootstrap-tagsinput.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rainbow/1.2.0/themes/github.css">
<link rel="stylesheet" href="resources/input_tags/app.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"
	charset="euc-kr"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#uploadimg').attr('src', e.target.result);

			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<script type="text/javascript">
	$(function() {

		$('#uuBtn').click(function() {
			//태그 값 저장
			$('#taglist').val($("#tags").val());
			if (confirm("수정하시겠습니까?") == true){    //확인
				$('#datafrm').submit();
			}else{   //취소
			    return;
			}
		});
	});
</script>
</head>
<body>
	<center>
		<form method=post action="user_update_ok.do" id="datafrm"
			enctype="multipart/form-data">
			<table width="500">
				<tr class="useredittd"><td width="30%" ><label class="control-label col-sm-10" for="tags">프로필</label></td>
					<td style="text-align: center" width="70%" class="useredittd">
						<div class="avatar-card">
							<div class="avatar">

								<div class="gravatar-wrapper-164">
									<img src="resources/userprofiles/defaultprofile.jpg" alt=""
										width="300" height="300" class="avatar-user" id="uploadimg">
								</div>

							</div>
							<input type="file" onchange="readURL(this);"
								class="btn btn-default" name="upload" id="upload" value="파일선택"
								size=50 style="margin: auto;">
						</div>



					</td>
				</tr>
				<tr class="useredittd">
					<td width="30%" class="useredittd" style="vertical-align: middle;"><label class="control-label col-sm-10" for="tags">기존 관심사</label></td>
					<td width="70%">
						<div class="col-sm-10 taglist">
								<c:forEach var="tag" items="${tags }" >
										<span class="tags">${tag }</span>
									</c:forEach>
						</div></td>
				</tr>
				<tr class="useredittd">
					<td width="30%" class="useredittd" style="vertical-align: middle;"><label class="control-label col-sm-10" for="tags">새로운 관심사</label></td>
					<td width="70%">
						<div class="col-sm-10">
							<div class="example example_objects_as_tags">
								<div class="bs-example">
									<input type="text" id="tags" name="tags" value="${tags }" />
								</div>
							</div>
						</div></td>
				</tr>
			</table>
			<%-- 		
								<label class="control-label col-sm-2" for="tags">Tags:</label>
								<div class="col-sm-8">
									<div class="example example_objects_as_tags">
										<div class="bs-example">
											<input type="text" id="tags" name="tags" value="${tags }" />
										</div>
									</div>
								</div>
												
							
							<div class="form-group"  style="width:300">
								<label class="control-label col-sm-2" for="tags">Tags:</label>
								<div class="col-sm-8">
									<div class="example example_typeahead">
										<div class="bs-example">
											<input type="text" id="tags" name="tags" value="${tags }" />
										</div>
									</div>
								</div>
							</div>	 --%>

			<!-- 글쓰기버튼 -->
			<input type="hidden" id="taglist" name="taglist"> <input
				type="hidden" id="mno" name="mno" value="${sessionScope.mno }">
			<div class="col-sm-offset-4 col-sm-8">
				<input type="button" id="uuBtn" value="글쓰기"> <input
					type="button" onclick="javascript:history.back()" value="취소">
			</div>



		</form>



	</center>

	<!-- 태그 스크립트 -->
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-42755476-1', 'bootstrap-tagsinput.github.io');
		ga('send', 'pageview');
	</script>



	<!-- tags scripts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js"></script>
	<script src="resources/input_tags/bootstrap-tagsinput.min.js"></script>
	<script src="resources/input_tags/bootstrap-tagsinput-angular.min.js"></script>
	<script src="resources/input_tags/puco_tags.js"></script>
</body>
</html>