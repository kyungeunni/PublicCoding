<%@ page language="java" contentType="text/html; charset=EUC-KR" 
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${bCheck==true }">
  <c:redirect url="freeboard_content.do?no=${bno }&page=${page }"/> <!-- redirect = sendRedirect -->
</c:if>
<c:if test="${bCheck==false }">
  <script>
    alert("비밀번호를 확인하여 주십시오");
    history.back();
  </script>
</c:if>