<%@page import="dao.CalendarDAO"%>
<%@page import="dao.CalendarDAOImpl"%>
<%@page import="dto.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendarupdate</title>
</head>
<body>

<%
//(memberDto)application.getAttribute("mem");
CalendarDto dto = (CalendarDto)application.getAttribute("cal");

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println("cal: "+ dto.getId());
System.out.println("content: " + dto.getContent());

/* 
private int seq;
private String id;
private String title;
private String content;
private String rdate; // 일정 날짜
private String wdate; // 기입한 날짜
 */
 
CalendarDAOImpl dao = CalendarDAO.getInstance();
boolean isS = dao.updateDay(new CalendarDto(seq, dto.getId(), title, content, dto.getRdate(), dto.getWdate()));


String rdate = dto.getRdate();
if(isS){
	//서버코드를 웹으로 넘기는 과정
	%>
	<script type="text/javascript">
	alert("일정수정완료");
	location.href="calendar.jsp";
	</script>
	<%
}else{
%>
	<script type="text/javascript">
	alert("일정수정실패!");
	location.href="calendar.jsp";
	</script>
	<%
}
%>

</body>
</html>