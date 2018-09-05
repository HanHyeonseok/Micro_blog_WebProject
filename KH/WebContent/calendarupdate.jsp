<%@page import="java.util.Calendar"%>
<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDAO"%>
<%@page import="dao.CalendarDAOImpl"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendarupdate</title>
</head>
<body>

<%!
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	
	String s = mdate.substring(0, 4) + "-" 	// yyyy
			+ mdate.substring(4, 6) + "-"	// MM
			+ mdate.substring(6, 8) + " " 	// dd
			+ mdate.substring(8, 10) + ":"	// hh
			+ mdate.substring(10, 12) + ":00"; 
	Timestamp d = Timestamp.valueOf(s);
	
	return sdf.format(d);	
}

public String toOne(String msg){	// 08 -> 8
	return msg.charAt(0)=='0'?msg.charAt(1) + "": msg.trim();
}
%>

<%
request.setCharacterEncoding("utf-8");


CalendarDto dto = (CalendarDto)request.getAttribute("dto");

CalendarDAOImpl dao = CalendarDAO.getInstance();

%> 

<%
String year = dto.getRdate().substring(0, 4);
String month = dto.getRdate().substring(4, 6);
String day = dto.getRdate().substring(6, 8);

System.out.println(dto.getRdate());
System.out.println(year + month + day);

//MemberDto user = new MemberDto("111","111",null,null,3); 
// MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH);
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR);
int tmin = cal.get(Calendar.MINUTE);
%>

<h1>수정하기</h1>
<hr>
<form action="CalendarController" method="post">
<input type="hidden" name="command" value="updateAF">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<table border="1" align="center">
<col width="200"><col width="500">

<tr>
	<td>제목</td>
	 <td><input type="text" name="title" value="<%=dto.getTitle() %>"></td> 
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
		<option <%=toOne(month).equals(i + "")?"selected='selected'":"" %> 
			value="<%=i %>"><%=i %></option>		
		<%	
	}	
	%>
	</select>월
	
	<select name="day" id="day">
	<%
	for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
		%>
		<option <%=toOne(day).equals(i + "")?"selected='selected'":"" %> 
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
		<textarea rows="20" cols="60" name="content"><%=dto.getContent() %> 
		</textarea>
	</td>
</tr>

<tr>
<td colspan="2"><input type="submit" value="수정"></td>
</tr>


</table>
</form>
<br><br><br>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>