<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDAO"%>
<%@page import="dao.BbsDAOImpl"%>
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
<%
	if (request.getAttribute("bbsWriteResult") == "false") {
		out.println("<script type='text/javascript'>alert('게시글 등록에 실패하였습니다.');</script>");
		request.setAttribute("bbsWriteResult", "");
	}

	if (mem == null) { 
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	
	BbsDAOImpl dao = BbsDAO.getInstance();
	List<BbsDto> list = dao.getBbsList();
	List<BbsDto> bestList = dao.getBestList();
%>
</head>
<body>
	<div class="container" style="padding: 0px">
		<!--Main layout-->
		<div style="padding-left: 10px; padding-right: 10px">

			<!-- Search Bar -->
			<div class="row" style="margin-bottom: 20px; padding: 20px">
				<div class="col-md-8" id="allpost" style="padding: 10px">
					<a href="bbslist.jsp" class="grey-text">All Posts</a>
				</div>
				<div class="col-md-4" style="padding: 0px">
					<form class="form-inline form-sm active-pink-2">
						<input class="form-control form-control-sm mr-3 w-75" type="text"
							placeholder="Search" aria-label="Search"> <a href="#"><i
							class="fa fa-search" aria-hidden="true"></i></a>
					</form>
				</div>
			</div>
			<!-- // Search Bar -->

			<!-- Main Content -->
			<div id="main_content" class="row"
				style="margin-top: 15px; padding-bottom: 15px">

				<!-- BbsWrite layer -->
				<div class="col-md-3 sticky_column" data-sticky_column
					style="height: 640px;">
					<form action="BbsController?command=bbsWrite" method="post"
						id="regi_bbs" enctype="multipart/form-data">

						<!-- layer header -->
						<div
							style="padding: 15px; text-align: left; font-family: inherit; border-bottom: 1px solid;">
							<h4>
								<i class="fa fa-pencil" aria-hidden="true"></i> New Post
							</h4>
						</div>
						<!-- layer title -->
						<div class="card-body d-flex flex-row" style="padding: 10px">
							<input type="hidden" name="userImg" value="<%=mem.getImg() %>">
							<!-- Avatar -->
							<%
								if(mem.getImg() == null){
									%>
							<img
								src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">
							<%
								}else{
							%>
							<img
								src="upload/<%=mem.getImg()%>"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">
							<%
							}
							%>

							<!-- userId -->
							<input type="hidden" name="userId" value="<%=mem.getId()%>">
							<h5 style="font-family: inherit; margin: 0; padding-top: 10px"><%=mem.getId()%></h5>
						</div>
						<!-- input title -->
						<div class="z-depth-1" style="padding: 10px">
							<input class="form-control form-control-sm" type="text"
								placeholder="Title"
								style="margin-top: 20px; padding-top: 10px; padding-bottom: 10px"
								name="title">
							<!-- input content -->
							<div class="form-group shadow-textarea" style="margin-top: 10px;">
								<textarea name="content" class="form-control z-depth-1"
									id="exampleFormControlTextarea6" rows="3" placeholder="Content"
									style="height: 200px"></textarea>
							</div>
							<!-- Hash Tag -->
							<input class="form-control form-control-sm" type="text"
								placeholder="#HashCode" name="hashtag"
								style="margin-bottom: 10px">

							<!-- write layer buttons -->
							<div style="margin: 5px; font-size: 10px">
								<input type="file" name="files">
							</div>
							<div align="center">
								<a href="#"
									onclick="document.getElementById('regi_bbs').submit()"><button
										type="button" class="btn btn-outline-info waves-effect"
										style="padding: 5px; width: 100px">게시글 올리기</button></a>
							</div>
						</div>
					</form>
				</div>
				<!-- // BbsWrite layer -->

				<!-- View BBS -->
				<div class="col-md-6">
					<!-- 1번 -->
					<%
						for(int i = 0; i < list.size(); i++){
							%>
					<div class="card promoting-card" style="margin-bottom: 15px">

						<!-- Card content -->
						<div class="card-body d-flex flex-row">

							<!-- Avatar -->
							<%
								if(list.get(i).getFilename() == null){
									%>
							<img
								src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">
							<%
								}else{
							%>
							<img
								src="upload/<%=list.get(i).getFilename()%>"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">
							<%
							}
							%>

							<!-- Content -->
							<div>

								<!-- Title -->
								<h4 class="card-title font-weight-bold mb-2"><%=list.get(i).getId() %></h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i><%=list.get(i).getWdate() %>
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay" style="margin: 10px" align="center">
							<a href="BbsController?command=detail&sequence=<%=list.get(i).getSeq()%>"> <img
								src="upload/<%=list.get(i).getFilename()%>" class="img-fluid "
								alt="이미지 없음">
								<div
									class="mask flex-center waves-effect waves-light rgba-red-slight">
									<p class="white-text">[클릭] 게시글 보기</p>
								</div>
							</a>
						</div>

						<!-- Card content -->
						<div align="right"
							style="padding-right: 10px; margin-top: 5px; margin-bottom: 5px;">
							<div class="btn-group btn-group-sm" role="group"
								aria-label="Basic example">
								<button type="button" class="btn btn-unique btn-sm">
									<i class="fa fa-heart" aria-hidden="true"></i>
									<%=list.get(i).getFavorite() %>
								</button>
							</div>
						</div>
						<div class="card-body" style="padding-top: 0px">
							<div>
								<!-- Text -->
								<p>
									<%=list.get(i).getTitle() %>
								</p>
							</div>
						</div>
					</div>
					<%
						}
					%>

				</div>
				<!-- // View BBS -->

				<!-- best bbsList -->
				<div class="col-md-3">
					<!-- best bbsList title -->
					<div
						style="border-bottom: 1px solid; padding: 15px; padding-bottom: 0px; margin-bottom: 10px">
						<h3 style="font-family: inherit">
							<img alt=""
								src="https://user-images.githubusercontent.com/38531104/44955785-291fc000-aef4-11e8-9ee2-e3f0d2eba058.png">
							best 3
						</h3>
					</div>
					<%
						for(int i = 0; i < 3; i++ ){
							%>
					<!-- first -->
					<div class="card promoting-card" style="margin-bottom: 10px">

						<!-- Card content -->
						<div class="card-body d-flex flex-row">

							<!-- Avatar -->
							<%
								if(bestList.get(i).getFilename() == null){
									%>
							<img
								src="https://user-images.githubusercontent.com/38531104/45137275-e0615300-b1e2-11e8-9dbb-05378ea956b6.png"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">
							<%
								}else{
							%>
							<img
								src="upload/<%=bestList.get(i).getFilename()%>"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">
							<%
							}
							%>

							<!-- Content -->
							<div>
								<!-- Title -->
								<h4 class="card-title font-weight-bold mb-2"><%=bestList.get(i).getId() %></h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i><%=bestList.get(i).getWdate() %>
								</p>
							</div>
						</div>
						<div class="btn-group btn-group-sm" role="group"
							aria-label="Basic example" style="padding-left: 10px">
							<button type="button" class="btn btn-unique btn-sm" disabled>
								Like :
								<%=bestList.get(i).getFavorite() %></button>
							<button type="button" class="btn btn-unique btn-sm" disabled>
								View :
								<%=bestList.get(i).getReadcount() %></button>
						</div>
						<!-- Card image -->
						<div class="view overlay" style="margin: 10px">
							<a href="BbsController?command=detail&sequence=<%=list.get(i).getSeq()%>"> <img
								src="upload/<%=bestList.get(i).getFilename()%>"
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
					%>
				</div>
				<!-- // best bbsList -->

			</div>
			<!-- //  Main Content -->
		</div>
		<!-- // Main layout-->
	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
	<!-- JQuery -->
	<script type="text/javascript" src="resources/js/sticky-kit.min.js"></script>
	<script type="text/javascript">
		$(".sticky_column").stick_in_parent();
	</script>
</body>
</html>