<%@ page language="java" contentType="text/html; charset=EUC-KR" 
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/newboard.css" />
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i=0;
var w=0;
var m=0;
$(function(){
   $('.reply_table').show();
   $('#reply_show').click(function(){
      if(i==0)
      {
        $('#reply_show').text("댓글닫기");
        $('.reply_table').show();
        i=1;
      }
      else
      {
        $('#reply_show').text("댓글보기");
        $('.reply_table').hide();
        i=0;
      }
   });
    $('.reply_write').click(function(){
      var id=$(this).attr('id');
      var no=id.substring(1);// w1 w2 w3
      if(w==0)
      {
         $('#ww'+no).show();
         w=1;   
      }
      else
      {
         $('#ww'+no).hide();
         w=0;
      }
   });
   $('.reply_modify').click(function(){
      var id=$(this).attr('id');
      var no=id.substring(1);// w1 w2 w3
      if(m==0)
      {
         $('#mm'+no).show();
         m=1;   
      }
      else
      {
         $('#mm'+no).hide();
         m=0;
      }
   });
   $('#replyBtn').click(function(){
      var rd=$('#reply_data').val();
      if(rd.trim()=="")
      {
         $('#reply_data').focus();
         return;
      }
      $('#rifrm').submit();
   });
   $('.ruBtn').click(function(){
	  var id=$(this).attr('id');
	  var no=id.substring(3);
	  var data=$('#rd'+no).val();
	  if(data.trim()=="")
	  {
         $('#rd'+no).focus();
         return;
	  }
	  $('#frm'+no).submit();
	  
   });
   $('.riBtn').click(function(){
	   var id=$(this).attr('id');
	   var no=id.substring(4);
	   var data=$('#d'+no).val();
	   if(data.trim()=="")
	   {
		   $('#d'+no).focus();
		   return;
	   }
	   $('#rfrm'+no).submit();
   });
});
</script>
</head>
<body>
<div class="container">
  <center>
  <div class="freemajor" id="freelistmajor">
  <h3>자유게시판(FreeBoaerd)</h3>
    <p>
    <table id=freeboardNav border=1 bordercolor="black" cellpadding="0" cellspacing="0">
      <tr height=27>
        <td width=20% align=center bgcolor=#2988b1>번호</td>
        <td width=30% align=center>${vo.bno }</td>
        <td width=20% align=center bgcolor=#2988b1>작성일</td>
        <td width=30% align=center>
        <fmt:formatDate value="${vo.bdate }" pattern="yyyy-MM-dd"></fmt:formatDate>
        </td>
      </tr>
      <tr height=27>
        <td width=20% align=center bgcolor=#24c2c8>이름</td>
        <td width=30% align=center>${vo.userid }</td>
        <td width=20% align=center bgcolor=#24c2c8>조회수</td>
        <td width=30% align=center>${vo.bhit }</td>
      </tr>
      <tr height=27>
        <td width=20% align=center bgcolor=#2988b1>제목</td>
        <td width=30% align=left colspan="3">${vo.bsubject }</td>
      </tr>
      <tr>
        <td colspan="4" align="left" valign="top" height=100 style="background-color: white">
          <pre style="background-color: white;">${vo.bcontent }</pre>
        </td>
      </tr>
    </table>
    <table id="checkpwd">
      <tr>
        <td align="right">
          
          <c:if test="${sessionScope.id == vo.userid }">
          <a href="freeboard_update.do?no=${vo.bno }&page=${page }">
          <button class="button" id="updateBtn">
          <i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;
          	수정</button></a></c:if>
          
          <%-- <c:if test="${sessionScope.id}!=${vo.userid }">
          <a href="freeboard_update.do?no=${vo.bno }&page=${page }">
          <button class="button" id="updateBtn">
          <i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;
          	수정</button></a></c:if> --%>
         
         <c:if test="${sessionScope.id == vo.userid }">
         <a href="freeboard_delete.do?no=${vo.bno }&page=${page }">
         <button id="delBtn" class="button"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;&nbsp;
         	삭제
         </button></a></c:if>
          
          <a href="free.do?page=${page }">
          <button class="button"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;
          	목록</button></a>
        </td>
      </tr>
     
    </table>
    <div>
    <a href="#" id="reply_show" style="color:#e44c65">댓글보기</a>
    </div>
    <table id="freetable_content" class="reply_table" style="display:none">
     <tr>
      <th colspan=2 style="background-color:transparent">댓글</th>
     </tr>
     <c:forEach var="rvo" items="${list }">
       <tr>
         <td width="75%" height="30">
          <c:if test="${rvo.bretab>0 }">
           <c:forEach var="i" begin="1" end="${rvo.bretab }">
            &nbsp;&nbsp;
           </c:forEach>
           <i class="fa fa-reply" aria-hidden="true"></i>
          </c:if>
          ${rvo.brecontent }<br>
           <c:if test="${rvo.bretab>0 }">
           <c:forEach var="i" begin="1" end="${rvo.bretab }">
            &nbsp;&nbsp;
           </c:forEach>
          </c:if>
          <font color=blue>${rvo.mno }</font>
          (${rvo.dbday })
         </td>
         <td width="25%" class="tdcenter" style="background-color: transparent;">
           <button class="button" id="w${rvo.bno }" class="reply_write">
          <i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;
          	수정</button> 
           <c:if test="${sessionScope.id==vo.userid }">
             <img src="user/board/image/btn_modify.gif" id="m${rvo.bno }" class="reply_modify">
             <a href="reply_delete.do?no=${rvo.bno }&bno=${vo.bno}&page=${page}">
             <img src="user/board/image/btn_delete.gif"></a>
           </c:if>
         </td>
       </tr>
     <tr id="ww${rvo.bno }" style="display:none">
      <td colspan="2">
       <form method="post" action="reply_re_insert.do" id="rfrm${rvo.breno }">
        <input type="hidden" name="bno" value="${vo.bno }">
        <input type="hidden" name="page" value="${page}">
        <input type="hidden" name="no" value="${rvo.breno }">
        <textarea rows="4" cols="85" name="reply_data" style="float: left" id="d${rvo.bno }"></textarea>
        <input type=button value="댓글달기" style="height:60px" id="rBtn${rvo.breno }" class="riBtn">
       </form>
      </td>
     </tr>
     <tr id="mm${rvo.bno }" style="display:none">
      <td colspan="2">
      
       <form method="post" action="reply_update.do" id="frm${rvo.breno }">
       	 <input type="hidden" name="bno" value="${vo.bno }">
         <input type="hidden" name="page" value="${page}">
         <input type="hidden" name="no" value="${rvo.breno }">
        <textarea rows="4" cols="85" name="reply_data" style="float: left" id="rd${rvo.bno }" >${rvo.brecontent }</textarea>
        <input type=button value="댓글수정" style="height:60px" id="btn${rvo.bno }" class="ruBtn">
      	</form>
      </td>
     </tr>
     </c:forEach>
     <tr>
      <td colspan="2">
        <form method="post" action="FBreply_insert.do" id="rifrm">
         <input type="hidden" name="bno" value="${vo.bno }">
         <input type="hidden" name="page" value="${page}">
         
         <textarea rows="4" cols="50" name="reply_data" style="float: left" id="reply_data"></textarea>
         <input type=button value="댓글" style="height:50px" id="replyBtn">
        </form>
      </td>
     </tr>
    </table>
  
    </div>
    </div>
  </center>
</body>
</html>