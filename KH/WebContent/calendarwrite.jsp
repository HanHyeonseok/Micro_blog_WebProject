
<%@page import="dao.CalendarDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#box{
		margin: 2px 0;
		border: 1px solid;
		border-color: #afeeee;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendarwrite.jsp</title>
</head>
<body>
<br>
<h3 align="center">일정쓰기</h3>
<%

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

MemberDto user = (MemberDto)session.getAttribute("login");

Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH);
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR);
int tmin = cal.get(Calendar.MINUTE);
%>

<form action="CalendarController" method="post" style="margin: 15px; margin-top: 50px" >
<div style= "padding: 5%; padding-bottom: 1%" id="box">
<input type="hidden" name="command" value="write">
<input type="hidden" name="id" value="<%=user.getId() %>">

<!-- Horizontal material form -->
    <!-- 제목 -->
    <div class="form-group row">
        <!-- Material input -->
        <label class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
            <div class="md-form mt-0">
                <input type="text" class="form-control" name="title" placeholder="제목 입력해주세요.">
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
            </div>
        </div>
    </div>
    <!--일정끝 -->

	<!--내용 작성-->
	<div class="md-form">
		<i class="fa fa-pencil prefix"></i>
			<textarea type="text" id="form10" class="md-textarea form-control" name="content" rows="8"></textarea>
			<label for="form10">내용</label>
	</div>
	<!--내용 작성끝-->
	
	<!--올리기버튼-->
	<div class="form-group row">
		<div class="col-sm-10" align="right">
				 <button type="submit" class="btn btn-outline-info btn-rounded waves-effect"><i class="fa fa-pencil" aria-hidden="true"></i> 올리기</button>
		</div>
	</div>
	<!--올리기버튼끝 -->
<!-- Horizontal material form -->
</div>
<%
String url = String.format("%s?year=%s&month=%s", "calendar.jsp", year, month);
%>
<a href="<%=url %>">일정보기</a>

</form>

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
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>