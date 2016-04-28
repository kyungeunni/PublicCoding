<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="http://code.jquery.com/jquery.js" charset="euc-kr"></script>
<title>Insert title here</title>
<script type="text/javascript">
function readURL(input ){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload=function(e){
			$('#uploadimg').attr('src',e.target.result);
			
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<script type="text/javascript">

$(function(){
	$('#editBtn').click(function(){
		
		$('#datafrm').submit();
	});
});
</script>
</head>
<body>
	<center>
		<table>
			<tr>
			<td>
			<div class="avatar-card">
				<div class="avatar">
					<a href="#">
						<div class="gravatar-wrapper-164">
							<img src="../resources/userprofiles/defaultprofile.jpg"
								alt width="300" height="300" class="avatar-user" id="uploadimg">
						</div>
					</a>
				</div>
				<div id="score">
					<span id="grade" title="뱃지"></span>100 점
				</div>
				<form method=post action="user_edit_ok.do" id="datafrm" enctype="multipart/form-data">
				
		<input type="file" onchange="readURL(this);"
								class="btn btn-default" name="upload" id="upload" 
								value="파일선택" size=50>
								
								<input type="button"
								class="btn btn-default" name="editBtn" id="editBtn" 
								value="확인" size=50>
								</form>
			</div>
			</td>
			</tr>
		</table>
	
	</center>
</body>
</html>