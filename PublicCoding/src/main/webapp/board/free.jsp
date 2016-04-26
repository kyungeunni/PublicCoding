<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html> 
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/newboard.css" />
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

</head>
<body>
<div class="container">
  <center>
  <div class="freemajor" id="freelistmajor"> 
    <h3>자유게시판 (FreeBoard)</h3></div>
   <!--  <table border="0" width="700" id="frBtn">
     <td align="left" class="writeBt">
       <a href="board_insert.do">
       <button class="button">글쓰기&nbsp;&nbsp;
       <i class="fa fa-pencil" aria-hidden="true"></i>
       </button></a>
     </td>
    </table> -->
    <div id="content">
        <table id="freeboard" border="0px" bordercolor="#CCCCCC" width="700">
     <td align="left" class="writeBt">
       <a href="board_insert.do">
       <button class="button">글쓰기&nbsp;&nbsp;&nbsp;&nbsp;
       <i class="fa fa-pencil" aria-hidden="true"></i>
       </button></a>
     </td>
      <tr align="center" class="menubar">
       <td width="15%">번호</td>
       <td width="45%">제목</td>
       <td width="15%">작성자</td>
       <td width="15%">작성일</td>
       <td width="15%">조회수</td>
      </tr>
      <c:forEach var="vo" items="${list }">
        <tr class="dataList">
          <td width=10% class="tdcenter">${vo.bno }</td>
          <td width=45% class="tdleft">
          <a href="board_content.do?no=${vo.bno }&page=${curpage}">
          ${vo.bsubject }</a>
          &nbsp;
          <c:if test="${today==vo.bdate }">
            New&nbsp;&nbsp;<i class="fa fa-bell-o" aria-hidden="true"></i>
          </c:if>
          &nbsp;
          <c:if test="${vo.answer>0 }">
            (${vo.answer })
          </c:if>
          </td>
          <td width=15% class="tdcenter">${vo.userid }</td>
          <td width=15% class="tdcenter">
          <fmt:formatDate value="${vo.bdate }" pattern="yyyy-MM-dd" />
          </td>
          <td width=15% class="tdcenter">${vo.bhit }</td>
        </tr>
      </c:forEach>
    </table>
    <table id="freeboard">
      <tr>
        <td align=right>
          <a href="freeboard.do?page=${curpage>1?curpage-1:curpage }">
            <i class="fa fa-chevron-circle-left" aria-hidden="true"></i></a>&nbsp;
          <a href="freeboard.do?>page=${curpage<totalpage?curpage+1:curpage }">
          <i class="fa fa-chevron-circle-right" aria-hidden="true"></i></a>&nbsp;&nbsp;
          ${curpage } page / ${totalpage } pages
        </td>
      </tr>
    
    </table>
    </div>
  </center>
  </div>
</body>
</html>
