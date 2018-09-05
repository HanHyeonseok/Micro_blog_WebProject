<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDAO"%>
<%@page import="dao.CalendarDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Honey Jam</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="resources/css/style.css" rel="stylesheet">

<style type="text/css">
.sortable tr {
    cursor: pointer;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous">
</script>
  
</head>
<body>
<%!
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String s = mdate.substring(0, 4) + "-" 	// yyyy
			+ mdate.substring(4, 6) + "-"	// MM
			+ mdate.substring(6, 8) + " " 	// dd
			+ mdate.substring(8, 10) + ":"	// hh
			+ mdate.substring(10, 12) + ":00"; 
	
	Timestamp d = Timestamp.valueOf(s);
	
	return sdf.format(d);	
}
%>
	<!--Main layout-->
	<div class="container" style="padding: 0px">
		<!--Carousel Wrapper-->
		<div id="carousel-example-1z" class="carousel slide carousel-fade"
			data-ride="carousel"
			style="margin-left: auto; margin-right: auto; margin-bottom: 15px;">
			<!--Indicators-->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-1z" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-1z" data-slide-to="1"></li>
				<li data-target="#carousel-example-1z" data-slide-to="2"></li>
			</ol>
			<!--/.Indicators-->
			<!--Slides-->
			<div class="carousel-inner" role="listbox">
				<!--First slide-->
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="https://mdbootstrap.com/img/Photos/Slides/img%20(141).jpg"
						alt="First slide">
				</div>
				<!--/First slide-->
				<!--Second slide-->
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://mdbootstrap.com/img/Photos/Slides/img%20(136).jpg"
						alt="Second slide">
				</div>
				<!--/Second slide-->
				<!--Third slide-->
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://mdbootstrap.com/img/Photos/Slides/img%20(137).jpg"
						alt="Third slide">
				</div>
				<!--/Third slide-->
			</div>
			<!--/.Slides-->
			<!--Controls-->
			<a class="carousel-control-prev" href="#carousel-example-1z"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carousel-example-1z"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			<!--/.Controls-->
		</div>
		<%
		CalendarDAOImpl caldao = CalendarDAO.getInstance();
		List<CalendarDto> list = caldao.indexCalList();
		%>
		
		<!--/.Carousel Wrapper-->
		
		
		
		<!-- List Table -->
		<div class="z-depth-1" style="margin-bottom: 15px; display: flex; flex-wrap: wrap;">
			<!-- Calendar List Table -->
			<div class="col-md-6" style="padding: 5px;">
				<table class="table table-hover sortable">
					<colgroup>
						<col style="width: 30%">
						<col style="width: 70%">
					</colgroup>
					<thead>
						<tr style="background-color: #F6F6F6;">
							<th scope="col" align="center">일정</th>
							<th scope="col" align="center">행사</th>
						</tr>
					</thead>
					<tbody>
					<%if(list == null || list.size() == 0){%>
					<tr>
						<td colspan="2">일정이 없습니다</td>
					</tr>
					<%}
					for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<th><%=toDates(list.get(i).getRdate()) %></th>
						<th><a href="calendardetail.jsp?seq=<%=list.get(i).getSeq() %>"><%=list.get(i).getTitle() %></a></th>
					</tr>				
					<%
					}
					%>
			
						<!-- <td colspan="2" align="center"># 여기는 페이징 단축키</td>
						</tr> -->

					</tbody>
				</table>
			</div>
			<!-- // Calendar List Table -->
			<div class="col-md-6" style="padding: 5px;">
				<table class="table table-hover sortable">
					<colgroup>
						<col style="width: 30%">
						<col style="width: 70%">
					</colgroup>
					<thead>
						<tr style="background-color: #F6F6F6;">
							<th scope="col">순위</th>
							<th scope="col">제목</th>
						</tr>
					</thead>
					<tbody>
						<tr class="toDetail">
							<td>1</td>
							<td>서울 남산 야경에 빠져..</td>
						</tr>
						<tr class="toDetail">
							<td>2</td>
							<td>부산 광안리 해변에 앉아 맥주한잔..</td>
						</tr>
						<tr class="toDetail">
							<td>3</td>
							<td>제주도 서귀포 드라이브 풍경..</td>
						</tr>
						<tr>
							<td colspan="2" align="center"># 여기는 페이징 단축키</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- // List Table -->
	</div>
	
	
	<script type="text/javascript">
		$(function () {
			$(".toDetail").click(function () {
				window.location.href = 'bbsdetail.jsp';
			});
		});	
	</script>
	
	
	<!-- // Main layout-->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>