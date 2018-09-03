<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

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
</style>
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
					<form id="regi_bbs" action="#" method="get">

						<!-- layer header -->
						<div
							style="padding: 15px; text-align: left; font-family: inherit; border-bottom: 1px solid;">
							<h4>
								<i class="fa fa-pencil" aria-hidden="true"></i> New Post
							</h4>
						</div>
						<!-- layer title -->
						<div class="card-body d-flex flex-row" style="padding: 10px">
							<!-- Avatar -->
							<img
								src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">

							<!-- userId -->
							<h5 style="font-family: inherit; margin: 0; padding-top: 10px">#
								작성자ID</h5>
						</div>
						<!-- input title -->
						<div class="z-depth-1" style="padding: 10px">
							<div class="md-form mb-5" style="margin-top: 10px;">
								<input type="text" id="title" class="form-control validate"
									style="margin-top: 20px; padding-top: 10px; padding-bottom: 10px">
								<label data-error="wrong" data-success="right" for="form32">Title</label>
							</div>
							<!-- input content -->
							<div class="md-form" style="margin-bottom: 10px">
								<textarea type="text" id="content"
									class="md-textarea form-control" rows="4"></textarea>
								<label data-error="wrong" data-success="right" for="form8">Your
									message</label>
							</div>
							<!-- Hash Tag -->
							<input class="form-control form-control-sm" type="text"
								placeholder="Small input" style="margin-bottom: 10px">

							<!-- file List -->
							<div style="border: 1px solid #BEBDBD; padding: 10px">
								<h6>
									<i class="fa fa-save" aria-hidden="true"></i> Image-files-name
								</h6>
							</div>
							<!-- write layer buttons -->
							<div class="btn-group" role="group" aria-label="Basic example"
								style="margin-top: 15px">
								<button type="button" class="btn btn-outline-info waves-effect"
									style="margin-right: 7px; padding: 15px; width: 100px">이미지</button>
								<a href="#"
									onclick="document.getElementById('regi_bbs').submit()"><button
										type="button" class="btn btn-outline-info waves-effect"
										style="padding: 15px; width: 100px">글쓰기</button></a>
							</div>
						</div>
					</form>
				</div>
				<!-- // BbsWrite layer -->

				<!-- View BBS -->
				<div class="col-md-6">
					<!-- 1번 -->
					<div class="card promoting-card" style="margin-bottom: 15px">

						<!-- Card content -->
						<div class="card-body d-flex flex-row">

							<!-- Avatar -->
							<img
								src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">

							<!-- Content -->
							<div>

								<!-- Title -->
								<h4 class="card-title font-weight-bold mb-2"># User ID</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay" style="margin: 10px">
							<a href="bbsdetail.jsp"> <img
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								class="img-fluid " alt="placeholder">
								<div
									class="mask flex-center waves-effect waves-light rgba-red-slight">
									<p class="white-text">[클릭] 게시글 보기</p>
								</div>
							</a>
						</div>

						<!-- Card content -->
						<div align="right" style="padding-right: 10px">
							<div class="btn-group btn-group-sm" role="group"
								aria-label="Basic example">
								<button type="button" class="btn btn-unique btn-sm">
									<i class="fa fa-heart" aria-hidden="true"></i> Like : 125
								</button>
							</div>
						</div>
						<div class="card-body" style="padding-top: 0px">
							<div>
								<!-- Text -->
								<p>
									# Title<br>일본에서 꼭 먹어야 하는 음식!
								</p>
							</div>
						</div>
					</div>

					<!-- 2번 -->
					<div class="card promoting-card" style="margin-bottom: 15px">

						<!-- Card content -->
						<div class="card-body d-flex flex-row">

							<!-- Avatar -->
							<img
								src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">

							<!-- Content -->
							<div>

								<!-- Title -->
								<h4 class="card-title font-weight-bold mb-2"># User ID</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay" style="margin: 10px">
							<a href="bbsdetail.jsp"> <img
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								class="img-fluid " alt="placeholder">
								<div
									class="mask flex-center waves-effect waves-light rgba-red-slight">
									<p class="white-text">[클릭] 게시글 보기</p>
								</div>
							</a>
						</div>

						<!-- Card content -->
						<div align="right" style="padding-right: 10px">
							<div class="btn-group btn-group-sm" role="group"
								aria-label="Basic example">
								<button type="button" class="btn btn-unique btn-sm">
									<i class="fa fa-heart" aria-hidden="true"></i> Like : 125
								</button>
							</div>
						</div>
						<div class="card-body" style="padding-top: 0px">
							<div>
								<!-- Text -->
								<p>
									# Title<br>일본에서 꼭 먹어야 하는 음식!
								</p>
							</div>
						</div>
					</div>
					<!-- 3번 -->

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
					<!-- first -->
					<div class="card promoting-card">

						<!-- Card content -->
						<div class="card-body d-flex flex-row">

							<!-- Avatar -->
							<img
								src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">

							<!-- Content -->
							<div>
								<!-- Title -->
								<h4 class="card-title font-weight-bold mb-2"># User ID
									</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>
							</div>
						</div>
						<div class="btn-group btn-group-sm" role="group"
							aria-label="Basic example" style="padding-left: 10px">
							<button type="button" class="btn btn-unique btn-sm" disabled>Like
								: 125</button>
							<button type="button" class="btn btn-unique btn-sm" disabled>View
								: 1920</button>
						</div>
						<!-- Card image -->
						<div class="view overlay" style="margin: 10px">
							<a href="bbsdetail.jsp"> <img
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								class="img-fluid " alt="placeholder">
								<div
									class="mask flex-center waves-effect waves-light rgba-red-slight">
									<p class="white-text">[클릭] 게시글 보기</p>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- // best bbsList -->
			</div>
			<!-- //  Main Content -->
		</div>
		<!-- // Main layout-->
		<%@ include file="/WEB-INF/include/footer.jsp"%>
		<!-- JQuery -->
		<script type="text/javascript" src="resources/js/sticky-kit.min.js"></script>
		<script type="text/javascript">
			$(".sticky_column").stick_in_parent();
		</script>
</body>
</html>