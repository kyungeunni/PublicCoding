<%@ page language="java"%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ page import="java.io.*"%>

<HTML>
<BODY>
<P>
다음과 같은 오류가 발생하였습니다.<BR>
시스템관리자에게 문의하여 주십시오<BR>
<%if(exception != null)out.println(exception.getMessage());%><BR>
<hr>

</BODY>
</HTML>

