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
<%
MemberDto user = (MemberDto)session.getAttribute("login");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.active-pink-textarea-2 textarea.md-textarea {
    border-bottom: 1px solid #afeeee;
    box-shadow: 0 1px 0 0 #afeeee;
}
.active-pink-textarea-2.md-form label.active {
    color: #1e90ff;
}
.active-pink-textarea-2.md-form label {
    color: black;
}
.active-pink-textarea-2.md-form .prefix {
    color: #1e90ff;
}
#box{
		margin: 2px 0;
		
		border: 1px solid;
		border-color: #afeeee;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendardetail</title>
</head>
<body>
<br>
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
<h3 align="center">디테일 보기</h3>
<div style= "padding: 8%; padding-bottom: 1%; margin: 5px" id="box">
    <!-- 제목 -->
    <div class="form-group row">
        <!-- Material input -->
        <label class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
            <div class="md-form mt-0">
                <input type="text" class="form-control" value="<%=dto.getTitle() %>">
            </div>
        </div>
    </div>
    <!-- 제목끝 -->
        <!--일정 -->
    <div class="form-group row">
    <!-- Material input -->
    	<label class="col-sm-2 col-form-label">일정</label>
    		<div class="col-sm-10">
      		  <div class="md-form mt-0">
      		   <input type="text" class="form-control" value=" <%=toDates(dto.getRdate()) %>">
      		 
      		 </div>
        </div>
    </div>
    <!--일정끝 -->
    <!--내용들어오기-->
	<div class="md-form mb-4 pink-textarea active-pink-textarea-2">
 	  <i class="fa fa-angle-double-right prefix"></i>
  	 	 <textarea type="text" id="form23" class="md-textarea form-control" rows="10"><%=dto.getContent() %> </textarea>
  	  <label for="form23">내용보기</label>
	</div>
	<!--내용들어오기 끝-->
    <div align="center">
	<!--버튼부분  -->
		<%if(user.getAuth()==1){ %>
		<button type="button" class="btn btn-outline-info waves-effect"  onclick="location.href='CalendarController?command=update&seq=<%=dto.getSeq() %>'"><i class="fa fa-undo" aria-hidden="true"></i>수정</button>
		<button type="button" class="btn btn-outline-info waves-effect" onclick="location.href='CalendarController?command=delete&seq=<%=dto.getSeq()%>'"><i class="fa fa-trash-o" aria-hidden="true"></i>삭제</button>
	
		<%} %>
		<button type="button" class="btn btn-outline-info waves-effect" onclick="location.href='calendar.jsp'"><i class="fa fa-undo" aria-hidden="true"></i>목록</button>
</div>	
</div>
<br>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>