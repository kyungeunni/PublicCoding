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
<link rel="stylesheet" href="../assets/css/newboard.css" />
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
  <center>
    <div class="freemajor" id="freelistmajor">
    <div class="panel_top">
      <h3>자유게시판 (FreeBoard)</h3>
    <div class="writer">
      ${vo.mno }
    </div>
    <div class="panel_body">
      <div class="panel_body_content">
        <div class="bno">${vo.bno }</div>
      </div>
      <h2 class="panel_title">${vo.bsubject }</h2>
      <hr>
      <article class="content_text">
        <p>
        <br>
        </p>
        <h3>${vo.bcontent }</h3>
      </article>
    </div>
    </div>
    </div>
    
  </center>
</body>
</html>