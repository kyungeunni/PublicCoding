<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../ajax.js"></script>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		var param="id="+id;
		sendMessage("POST", "../idcheck_ok.do", param, idcheckCallback);
	});
});
function idcheckCallback()
{
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			var count=httpRequest.responseText;
			$('#result').text("");
			if(count==0)
			{
				var res="<font color=yellow>"+$('#id').val()+"는(은) 사용가능한 ID입니다<br>"
				       +"<input type=button value=확인 onclick=ok('"+$('#id').val()+"')>";
				$('#result').append(res);
			}
			else
			{
				var res="<font color=yellow>"+$('#id').val()+"는(은) "
				       +"이미 사용중인 ID입니다";
				$('#result').append(res);
			}
		}
	}
}
function ok(id)
{
	parent.join_frm.id.value=id;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
   <center>
     <table id="table_content" width=220 style="margin-top: 10px">
      <tr>
       <td><font color=white>ID:</font><input type=text name=id size=12 id="id">
       <input type=button value="체크" id="checkBtn">
       </td>
      </tr>
      <tr>
        <td class="tdcenter" id="result"></td>
      </tr>
     </table>
   </center>
</body>
</html>





