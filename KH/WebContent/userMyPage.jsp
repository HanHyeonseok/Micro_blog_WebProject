<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDAO"%>
<%@page import="dao.BbsDAOImpl"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<html>
<head>
<title>Honey Jam</title>
<%
	String id = request.getParameter("userId");

	MemberDAOImpl memdao = MemberDAO.getInstance();
	BbsDAOImpl bbsdao = BbsDAO.getInstance();

	MemberDto memdto = memdao.getUserDto(id);
	List<BbsDto> bbslist = bbsdao.getUserBbsList(id);
%>
</head>
<body>
	<div class="container" style="padding: 0px">
		<!-- Main layout -->
		<div style="padding-left: 10px; padding-right: 10px">
			<!-- Main content -->
			<div id="main_content" class="row">
				<!-- User Profile DtoList -->
				<div class="col-md-6 sticky_column" data-sticky_column
					style="height: 640px;">
					<!-- Profile Div -->
					<div class="modal-dialog modal-sm cascading-modal modal-avatar"
						role="document">
						<!--Content-->
						<div class="modal-content">
							<!--Header-->
							<div class="modal-header">
								<%
									if (memdto.getImg() == null) {
								%>
								<img
									src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
									class="rounded-circle" alt="avatar">
								<%
									} else {
								%>
								<img
									style="width: auto; height: auto; max-height: 120px; max-width: 120px"
									src="upload/<%=memdto.getImg()%>" class="rounded-circle"
									alt="avatar">
								<%
									}
								%>
							</div>
							<!--Body-->
							<div class="modal-body text-center mb-1">
								<h5 class="mt-1 mb-2"><%=memdto.getId()%></h5>
								<div class="md-form ml-0 mr-0">
									<table>
										<colgroup>
											<col style="width: 30%">
											<col style="width: 70%">
										</colgroup>
										<tbody>
											<tr>
												<th>Name</th>
												<td style="text-align: left;"><%=memdto.getName()%></td>
											</tr>
											<tr>
												<th>Phone</th>
												<td style="text-align: left;"><%=memdto.getPhone()%></td>
											</tr>
											<tr>
												<th>Email</th>
												<td style="text-align: left;"><%=memdto.getEmail()%></td>
											</tr>
											<tr>
												<th>Address</th>
												<td style="text-align: left;"><%=memdto.getAddress()%></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--/.Content-->
					</div>
					<!-- // Profile Div -->
				</div>
				<!-- // User Profile DtoList -->
				<!-- User BbsList View -->
				<div class="col-md-6">
					<div>
						<%
							for (int i = 0; i < bbslist.size(); i++) {
						%>
						<div class="card promoting-card" style="margin-bottom: 15px">

							<!-- Card content -->
							<div class="card-body d-flex flex-row">

								<!-- Avatar -->
								<%
									if (bbslist.get(i).getProfilename().equals("null")) {
								%>
								<img
									src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
									class="rounded-circle mr-3" height="50px" width="50px" alt="">
								<%
									} else {
								%>
								<img
									style="width: auto; height: auto; max-height: 50px; max-width: 50px"
									src="upload/<%=bbslist.get(i).getProfilename()%>"
									class="rounded-circle mr-3" height="50px" width="50px"
									alt="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png">
								<%
									}
								%>
								<!-- Content -->
								<div>
									<!-- Title -->
									<a href="userMyPage.jsp?userId=<%=bbslist.get(i).getId()%>"
										style="color: black" class="card-title font-weight-bold mb-2"><%=bbslist.get(i).getId()%></a>
									<!-- Subtitle -->
									<p class="card-text">
										<i class="fa fa-clock-o pr-2"></i><%=bbslist.get(i).getWdate()%>
									</p>
								</div>
							</div>
							<!-- Card image -->
							<div class="view overlay" style="margin: 10px" align="center">
								<a
									href="BbsController?command=detail&sequence=<%=bbslist.get(i).getSeq()%>">
									<img
									style="width: auto; height: auto; max-height: 270px; max-width: 480px"
									src="upload/<%=bbslist.get(i).getFilename()%>"
									class="img-fluid " alt="이미지 없음">
								</a>
								<div
									class="mask flex-center waves-effect waves-light rgba-red-slight">
									<p class="white-text">[클릭] 게시글 보기</p>
								</div>
							</div>

							<!-- Card content -->
							<div align="right"
								style="padding-right: 10px; margin-top: 5px; margin-bottom: 5px;">
								<div class="btn-group btn-group-sm" role="group"
									aria-label="Basic example">
									<button type="button" class="btn btn-unique btn-sm">
										<i class="fa fa-heart" aria-hidden="true"></i>
										<%=bbslist.get(i).getFavorite()%>
									</button>
								</div>
							</div>
							<div class="card-body" style="padding-top: 0px">
								<div>
									<!-- Text -->
									<p>
										<%=bbslist.get(i).getTitle()%>
									</p>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
				<!-- // User BbsList View -->
			</div>
			<!-- // Main content -->
		</div>
		<!-- // Main layout -->
	</div>
	<!-- pageController -->
	<div style="position: fixed; bottom: 100px; right: 80px;">
		<div style="font-size: 40px">
			<a href="#header" style="color: #AEADAD;"><i
				class="fa fa-arrow-circle-o-up" aria-hidden="true"></i></a><br> <a
				href="#footer" style="color: #AEADAD;"><i
				class="fa fa-arrow-circle-o-down" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- // pageController -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
	<!-- JQuery -->
	<script type="text/javascript" src="resources/js/sticky-kit.min.js"></script>
	<script type="text/javascript">
		$(".sticky_column").stick_in_parent();
	</script>
</body>
</html>