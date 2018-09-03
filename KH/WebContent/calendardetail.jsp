<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDAO"%>
<%@page import="dao.CalendarDAOImpl"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendardetail</title>
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
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

CalendarDAOImpl dao = CalendarDAO.getInstance();
CalendarDto dto = dao.getDay(seq);

%> 

<h1>디테일 보기</h1>
<hr>
<table border="1">
<col width="200"><col width="500">

<tr>
	<td>제목</td>
	 <td><%=dto.getTitle() %></td> 
</tr>

<tr>
	<td>일정</td>
	<td><%=toDates(dto.getRdate()) %></td>
</tr>

<tr>
	<td>내용</td>
	<td>
		<textarea rows="20" cols="60" readonly="readonly"><%=dto.getContent() %> 
		</textarea>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="button" value="수정" onclick="location.href='CalendarController?command=update&seq=<%=dto.getSeq() %>'">
        <input type="button" value="삭제" onclick="location.href='CalendarController?command=delete&seq=<%=dto.getSeq()%>'">
        <input type="button" value="취소" onclick="location.href='calendar.jsp'">		
        
	</td>
</tr>

</table>
<br><br><br>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>