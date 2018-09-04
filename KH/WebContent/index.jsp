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
</head>
<body>
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
		%>
		<!--/.Carousel Wrapper-->
		<!-- List Table -->
		<div class="z-depth-1" style="margin-bottom: 15px; display: flex; flex-wrap: wrap;">
			<!-- Calendar List Table -->
			<div class="col-md-6" style="padding: 5px;">
				<table class="table table-hover">
					<colgroup>
						<col style="width: 30%">
						<col style="width: 70%">
					</colgroup>
					<thead>
						<tr style="background-color: #F6F6F6;">
							<th scope="col">일정</th>
							<th scope="col">행사내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2018-07-27</td>
							<td>★ 현석이탄생일..!!</td>
						</tr>
						<tr>
							<td>2018-09-25</td>
							<td>추석명절 이벤트..!!</td>
						</tr>
						<tr>
							<td>2018-12-25</td>
							<td>크리스마스 이벤트..!!</td>
						</tr>
						<tr>
							<td colspan="2" align="center"># 여기는 페이징 단축키</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- // Calendar List Table -->
			<div class="col-md-6" style="padding: 5px;">
				<table class="table table-hover">
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
						<tr>
							<td>1</td>
							<td>서울 남산 야경에 빠져..</td>
						</tr>
						<tr>
							<td>2</td>
							<td>부산 광안리 해변에 앉아 맥주한잔..</td>
						</tr>
						<tr>
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
	<!-- // Main layout-->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>