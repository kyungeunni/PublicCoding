<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- /////////////signin from MemberController///////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
  <c:when test="${res=='NOID' }">
   <script>
   alert("ID가 존재하지 않습니다");
   history.back();
   </script>
  </c:when>
  <c:when test="${res=='NOPWD' }">
   <script>
   alert("비밀번호가 틀립니다");
   history.back();
   </script>
  </c:when>
  <c:otherwise>
    <c:redirect url="main.do"/>
   <script type="text/javascript">
window.opener.parent.location.reload();
window.opener.document.location.reload();
window.self.close();
</script>
  </c:otherwise>
</c:choose>
<!-- ////////////////////////////////////////////////////// -->