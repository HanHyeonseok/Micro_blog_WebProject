
<%@page import="dao.CalendarDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendarwrite.jsp</title>
</head>
<body>

<h3>일정쓰기</h3>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

//MemberDto user = new MemberDto("111","111",null,null,3); 
// MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH);
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR);
int tmin = cal.get(Calendar.MINUTE);
%>

<form action="CalendarController" method="post">
<input type="hidden" name="command" value="write">

<table border="1">
<col width="200"><col width="500">

<tr>
	<td>제목</td>
	<td>
		<input type="text" size="60" name="title">
	</td>
</tr>

<tr>
	<td>일정</td>
	<td>
	
	<select name="year">
	<%
    for(int i = tyear - 5;i < tyear + 6; i++){
        %>
        <option <%=year.equals(i + "")?"selected='selected'":"" %> 
            value="<%=i %>"><%=i %></option>        
        <%    
    }    
    %>   
	</select>년	
	
	<select name="month">
	<%
	for(int i = 1;i <= 12; i++){
		%>
		<option <%=month.equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>
	</select>월
	
	<select name="day" id="day">
	<%
	for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
		%>
		<option <%=day.equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>
	</select>일
	
	<select name="hour">
	<%
	for(int i = 0;i < 24; i++){
		%>
		<option <%=(thour + "").equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>
	</select>시
	
	<select name="min">
	<%
	for(int i = 0;i < 60; i++){
		%>
		<option <%=(tmin + "").equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>
	</select>분
	
	</td>
</tr>

<tr>
	<td>내용</td>
	<td>
		<textarea rows="20" cols="60" name="content"></textarea>
	</td>
</tr>

<tr>
	<td colspan="2">
		<input type="submit" value="글쓰기">
	</td>
</tr>


</table>

</form>

 <%
String url = String.format("%s?year=%s&month=%s", "calendar.jsp", year, month);
%>

<a href="<%=url %>">일정보기</a>

<script type="text/javascript">

// 지정된 달의 끝 날짜를 설정
setDay();

$("#day").val("<%=day %>"); 
 
$(document).ready(function() {
	$("select[name='month']").change(setDay);
});

function setDay() {
	var lastday = (new Date($("select[name='year']").val()+ "", 
			$("select[name='month']").val()+"", 0)).getDate();
	// 적용
	var str = "";
	for(i = 1;i <= lastday; i++){
	str += "<option value='" + i + "'>" + i + "</option>";
	}
	$("select[name='day']").html(str);
}
</script>
<br><br><br>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>