<%--------------------------------------------------------------------------------------------- --%>
<%--                                                                             				--%>
<%--------------------------------------------------------------------------------------------- --%>
<%@ page language="java" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page errorPage="Error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<fmt:requestEncoding value="UTF-8"/>

<%--------------------------------------------------------------------------------------------- --%>
<%-- CollectionParameter                                                                        --%>
<%--------------------------------------------------------------------------------------------- --%>
<c:set var="type" 						value="${param.type}"/>
<c:set var="curYear"					value="${param.curYear}"/>
<c:set var="curMonth"					value="${param.curMonth}"/>
<c:set var="curDay"						value="${param.curDay}"/>

<c:set var="schedule_id"				value="${param.schedule_id}"/>
<c:set var="schedule_date_time"			value="${param.schedule_date_time}"/>
<c:set var="schedule_subject"			value="${param.schedule_subject}"/>
<c:set var="schedule_content"			value="${param.schedule_content}"/>

<%--------------------------------------------------------------------------------------------- --%>
<%-- Header                                                                                     --%>
<%--------------------------------------------------------------------------------------------- --%>
<STYLE>
<!--
body {font-size:9pt; font-family:tahoma}
table {font-size:9pt; font-family:tahoma;color:black}
A { color:black; text-decoration:none}
A:hover {color:red;text-decoration:none;}

td.main {text-align:right;font-weight:bold;}
td.sub {padding-left:10}

.text_gray {Font-Family: "Arial", "굴림체"; Font-Size: 10pt; Background-Color:#FFFFFF; Color:#000000; border: 1px #818181 solid} 
.text_purple{border:solid 1;background-color:white;border-color:160F25;font-size:8pt;font-family:Arial;vertical-align:top;border-left-color:#ffffff;border-right-color:#ffffff;border-top-color:#74A6AB;border-bottom-color:#74A6AB;height:18px;}
.textarea {font-size:10pt; background-color:white; border-width:1; border-style:solid; color:#45250C; border-color:#777777;
			scrollbar-face-color:white;			scrollbar-shadow-color:#777777;  
			scrollbar-highlight-color:white;	scrollbar-3dlight-color:#777777; 
			scrollbar-darkshadow-color:white;	scrollbar-arrow-color:#777777;
			scrollbar-track-color:white ;}
-->
</STYLE>
<BODY>
<CENTER>
<%--------------------------------------------------------------------------------------------- --%>
<%-- Form                                                                                       --%>
<%--------------------------------------------------------------------------------------------- --%>
<FORM method="post" name="theForm" action="Update.jsp" style="margin:0">
<TABLE cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="100%" height="100%" >
<TR>
	<TD align="center">
	<TABLE cellpadding="0" cellspacing="1" border="0" bgcolor="#ffffff" width="440">
		<TR height="10">
			<TD></TD>
		</TR>
		<TR>
			<TD align=center bgcolor="#ffffff">
			<TABLE cellpadding="5" cellspacing="1" border="0" bgcolor="#666666">
				<TR bgcolor="#ffffff">
					<TD class="main">
						일자
					</TD>
					<TD>
						<INPUT type="text" name="date_Y" class="text_gray" size="4" maxlength="4" value='<c:out value="${curYear}"/>'>년 
						<INPUT type="text" name="date_M" class="text_gray" size="2" maxlength="2" value='<c:out value="${curMonth}"/>'>월  
						<INPUT type="text" name="date_D" class="text_gray" size="2" maxlength="2" value='<c:out value="${curDay}"/>'>일 
					</TD>
				</TR>
				<TR bgcolor="#ffffff">
					<TD class=main width="60">
						제목
					</TD>
					<TD width="380">
						<INPUT type="text" name="schedule_subject" class="text_gray" size="30" maxlength="50" value='<c:out value="${schedule_subject}"/>'>
					</TD>
				</TR>
				<TR bgcolor="#ffffff">
					<TD class="main">
						내용
					</TD>
					<TD>
						<TEXTAREA NAME="schedule_content" class="textarea" ROWS="12" COLS="52" WRAP="VIRTUAL"><c:out value="${schedule_content}"/></TEXTAREA>
					</TD>
				</TR>
			</TABLE>
			</TD>   
		</TR>     
		<TR>
			<TD colspan="2" height="5"></TD>
		</TR>
		<TR>
			<TD align="center">
				<IMG src="images/save.gif" 		style="cursor:hand" border=0 onclick="javascript:submitForm('<c:out value="${type}"/>');">
				<IMG src="images/close.gif" 	style="cursor:hand" border=0 onclick="window.close()">
				<c:if test="${type == 'SELECT'}">
					<IMG src="images/delete.gif" 	style="cursor:hand" border=0 onclick="javascript:deleteForm();">
				</c:if>
			</TD>
		</TR>
		<TR>
			<TD colspan=2 height=5></TD>
		</TR>
	</TABLE>
	</TD>
</TR>
</TABLE>
<INPUT type="hidden" name="type">
<INPUT type="hidden" name="schedule_id" value="<c:out value="${schedule_id}"/>">
<INPUT type="hidden" name="schedule_date_time">
</FORM>
</CENTER>
</BODY>
<%--------------------------------------------------------------------------------------------- --%>
<%-- SCRIPT                                                                                    --%>
<%--------------------------------------------------------------------------------------------- --%>

<SCRIPT LANGUAGE="JavaScript">
	function checkBlankMessage(elem , msg)	{
		var v = elem.value ;
		var l = elem.value.length ;
		
		if( v == '') 
		{
			alert(msg) ;
			elem.focus() ;
			return false;
		}
	
		return true;
	}
	function checkAction(){
		return (   
				   checkBlankMessage(document.theForm.date_Y , '년도를 입력 하십시오')
				&& checkBlankMessage(document.theForm.date_M , '달을 입력 하십시오')
				&& checkBlankMessage(document.theForm.date_D , '일자를 입력 하십시오')
				&& checkBlankMessage(document.theForm.schedule_subject , '제목을 입력 하십시오')
				&& checkBlankMessage(document.theForm.schedule_content , '내용을 입력 하십시오')
		);
	}

	function submitForm(command) {
		document.theForm.schedule_date_time.value = 
			document.theForm.date_Y.value + "-" + 
			document.theForm.date_M.value + "-" + 
			document.theForm.date_D.value;
		if(command == "INIT") {
			document.theForm.type.value = 'INSERT';
			if(checkAction()) 
				document.theForm.submit();
		}else {
			document.theForm.type.value = 'UPDATE';
			if(checkAction()) 
				document.theForm.submit();
		}
	}
	
	function deleteForm() {
		document.theForm.type.value = 'DELETE';
		if(window.confirm('정말로 삭제 하시겠습니까?')) 
			document.theForm.submit();
	}
</SCRIPT>
