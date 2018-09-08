<%@page import="dao.BbsDAO"%>
<%@page import="dao.BbsDAOImpl"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BbsDAOImpl dao = BbsDAO.getInstance();
List<BbsDto> bestList = dao.getBestList(); 
%>
<%
	if (bestList.size() > 0 && bestList.size() < 3) {

	for (int i = 0; i < bestList.size(); i++) {
%>
<div class="card promoting-card" style="margin-bottom: 10px">
	<!-- Card content -->
	<div class="card-body d-flex flex-row">
		<!-- Avatar -->
		<%
			if (bestList.get(i).getProfilename().equals("null")) {
		%>
		<img
			src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
			class="rounded-circle mr-3" height="50px" width="50px" alt="">
		<%
			} else {
		%>
		<img src="upload/<%=bestList.get(i).getProfilename()%>"
			class="rounded-circle mr-3" height="50px" width="50px"
			alt="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png">
		<%
			}
		%>
		<!-- Content -->
		<div>
			<!-- Title -->
			<h4 class="card-title font-weight-bold mb-2"><%=bestList.get(i).getId()%></h4>
			<!-- Subtitle -->
			<p class="card-text">
				<i class="fa fa-clock-o pr-2"></i><%=bestList.get(i).getWdate()%>
			</p>
		</div>
	</div>
	<div class="btn-group btn-group-sm" role="group"
		aria-label="Basic example" style="padding-left: 10px">
		<button type="button" class="btn btn-unique btn-sm" disabled>
			Like :
			<%=bestList.get(i).getFavorite()%></button>
		<button type="button" class="btn btn-unique btn-sm" disabled>
			View :
			<%=bestList.get(i).getReadcount()%></button>
	</div>
	<!-- Card image -->
	<div class="view overlay" style="margin: 10px" align="center">
		<a
			href="BbsController?command=detail&sequence=<%=bestList.get(i).getSeq()%>">
			<img src="upload/<%=bestList.get(i).getFilename()%>"
			class="img-fluid " alt="placeholder">
			<div
				class="mask flex-center waves-effect waves-light rgba-red-slight">
				<p class="white-text">[클릭] 게시글 보기</p>
			</div>
		</a>
	</div>
</div>
<%
}
} else if (bestList.size() >= 3) {
	for (int i = 0; i < 3; i++) {
%>
<!-- first -->
<div class="card promoting-card" style="margin-bottom: 10px">

	<!-- Card content -->
	<div class="card-body d-flex flex-row">

		<!-- Avatar -->
<%
	if (bestList.get(i).getProfilename().equals("null")) {
%>
		<img
			src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
			class="rounded-circle mr-3" height="50px" width="50px" alt="">
<%
} else {
%>
		<img src="upload/<%=bestList.get(i).getProfilename()%>"
			class="rounded-circle mr-3" height="50px" width="50px"
			alt="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png">
<%
}
%>
	<!-- Content -->
		<div>
			<!-- Title -->
			<h4 class="card-title font-weight-bold mb-2"><%=bestList.get(i).getId()%></h4>
			<!-- Subtitle -->
			<p class="card-text">
				<i class="fa fa-clock-o pr-2"></i><%=bestList.get(i).getWdate()%>
			</p>
		</div>
	</div>
	<div class="btn-group btn-group-sm" role="group"
		aria-label="Basic example" style="padding-left: 10px">
		<button type="button" class="btn btn-unique btn-sm" disabled>
			Like :
			<%=bestList.get(i).getFavorite()%></button>
		<button type="button" class="btn btn-unique btn-sm" disabled>
			View :
			<%=bestList.get(i).getReadcount()%></button>
	</div>
	<!-- Card image -->
	<div class="view overlay" style="margin: 10px" align="center">
		<a
			href="BbsController?command=detail&sequence=<%=bestList.get(i).getSeq()%>">
			<img src="upload/<%=bestList.get(i).getFilename()%>"
			class="img-fluid " alt="placeholder">
			<div
				class="mask flex-center waves-effect waves-light rgba-red-slight">
				<p class="white-text">[클릭] 게시글 보기</p>
			</div>
		</a>
	</div>
</div>
<%
}
}
%>