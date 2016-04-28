<%--------------------------------------------------------------------------------------------- --%>
<%--                                                                             				--%>
<%--------------------------------------------------------------------------------------------- --%>
<%@ page language="java" %>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page errorPage="Error.jsp"%>
<%@ page import="javax.servlet.jsp.jstl.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8"/>

<%--------------------------------------------------------------------------------------------- --%>
<%-- DateSource Setting                                                                      	--%>
<%--------------------------------------------------------------------------------------------- --%>
<sql:setDataSource
    var="dataSource"
    driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"    
    url="jdbc:sqlserver://localhost:1433;DatabaseName=mydatabase"
    user="myuser"
    password="mypassword"/> 

<%--------------------------------------------------------------------------------------------- --%>
<%-- Parameter Setting                                                                       	--%>
<%--------------------------------------------------------------------------------------------- --%>
<c:set var="type" 				value="${param.type}"/>
<c:set var="curYear" 			value="${param.curYear}"/>
<c:set var="curMonth" 			value="${param.curMonth}"/>
<c:set var="curDay" 			value="${param.curDay}"/>

<c:set var="schedule_id" 		value="${param.schedule_id}"/>
<c:set var="schedule_date_time" value="${param.schedule_date_time}"/>
<c:set var="schedule_subject" 	value="${param.schedule_subject}"/>
<c:set var="schedule_content" 	value="${param.schedule_content}"/>


<%--------------------------------------------------------------------------------------------- --%>
<%-- Do Logic                                                                          			--%>
<%--------------------------------------------------------------------------------------------- --%>
<c:choose>
	<%-- SELECT --%>
	<c:when test="${type == 'SELECT'}">		
		<sql:query var="select" dataSource="${dataSource}">
			SELECT 
				schedule_id, convert(CHAR(10),schedule_date_time, 120) as schedule_date_time,
				YEAR(schedule_date_time) as curYear, MONTH(schedule_date_time) as curMonth, 
				DAY(schedule_date_time) as curDay, 
				schedule_subject, schedule_content
			FROM 
				tb_schedule
			WHERE 
				schedule_id=?
			<sql:param value="${schedule_id}"/>
		</sql:query>
		<c:set var="schedule_id" 		value="${select.rows[0].schedule_id}"/>
		<c:set var="schedule_date_time" value="${select.rows[0].schedule_date_time}"/>
		<c:set var="curYear" 			value="${select.rows[0].curYear}"/>
		<c:set var="curMonth" 			value="${select.rows[0].curMonth}"/>
		<c:set var="curDay" 			value="${select.rows[0].curDay}"/>
		<c:set var="schedule_subject" 	value="${select.rows[0].schedule_subject}"/>
		<c:set var="schedule_content" 	value="${select.rows[0].schedule_content}"/>
	</c:when>
	<%-- UPDATE --%>
	<c:when test="${type == 'UPDATE'}">
		<sql:update var="update" dataSource="${dataSource}">
			UPDATE 
				tb_schedule 
			SET 
				schedule_date_time=?, schedule_subject=?, schedule_content=?
			WHERE 
				schedule_id=?
			<sql:param value="${schedule_date_time}"/>
			<sql:param value="${schedule_subject}"/>			
			<sql:param value="${schedule_content}"/>
 			<sql:param value="${schedule_id}"/>
		</sql:update>
		<SCRIPT LANGUAGE="JavaScript">
			opener.location.href='View.jsp?curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth}"/>&curDay=<c:out value="${curDay}"/>';
			self.close();
		</SCRIPT>
	</c:when>
	<%-- INSERT --%>
	<c:when test="${type == 'INSERT'}">
		<sql:query var="nextval" dataSource="${dataSource}">
			select schedule_id= isnull(max(cast(schedule_id as int)), 0)+1 from tb_schedule
		</sql:query>
		<sql:update var="insert"  dataSource="${dataSource}">
			INSERT  INTO tb_schedule
				(schedule_id, schedule_date_time, schedule_subject, schedule_content)
			VALUES(?, ?, ?, ?)
			<sql:param value="${nextval.rows[0].schedule_id}"/>
			<sql:param value="${schedule_date_time}"/>
			<sql:param value="${schedule_subject}"/>
			<sql:param value="${schedule_content}"/>
		</sql:update>
		<c:set var="schedule_id" value="${nextval.rows[0].schedule_id}"/>
		<SCRIPT LANGUAGE="JavaScript">
			opener.location.href='View.jsp?curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth}"/>&curDay=<c:out value="${curDay}"/>';
			self.close();
		</SCRIPT>
	</c:when>
	<%-- DELETE --%>
	<c:when test="${type == 'DELETE'}">
		<sql:update var="delete" dataSource="${dataSource}">
			DELETE FROM tb_schedule WHERE schedule_id=?
			<sql:param value="${schedule_id}"/>
		</sql:update>
		<SCRIPT LANGUAGE="JavaScript">
			opener.location.href='View.jsp?curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth}"/>&curDay=<c:out value="${curDay}"/>';
			self.close();
		</SCRIPT>
	</c:when>
	<c:otherwise>
		<c:set var="type" value="INIT"/>
	</c:otherwise>
</c:choose>

<%--------------------------------------------------------------------------------------------- --%>
<%-- Redirect                                                                                   --%>
<%--------------------------------------------------------------------------------------------- --%>
<FORM METHOD=POST NAME='theForm' ACTION='UpdateForm.jsp'>
	<INPUT TYPE="hidden" NAME='type' 				VALUE='<c:out value="${type}"/>'>

	<INPUT TYPE="hidden" NAME='schedule_id' 		VALUE='<c:out value="${schedule_id}"/>'>
	<INPUT TYPE="hidden" NAME='schedule_date_time' 	VALUE='<c:out value="${schedule_date_time}"/>'>
	<INPUT TYPE="hidden" NAME='curYear' 			VALUE='<c:out value="${curYear}"/>'>
	<INPUT TYPE="hidden" NAME='curMonth' 			VALUE='<c:out value="${curMonth}"/>'>
	<INPUT TYPE="hidden" NAME='curDay' 				VALUE='<c:out value="${curDay}"/>'>
	<INPUT TYPE="hidden" NAME='schedule_subject' 	VALUE='<c:out value="${schedule_subject}"/>'>
	<INPUT TYPE="hidden" NAME='schedule_content' 	VALUE='<c:out value="${schedule_content}"/>'>
</FORM>

<SCRIPT LANGUAGE="JavaScript">
	document.theForm.submit();
</SCRIPT>