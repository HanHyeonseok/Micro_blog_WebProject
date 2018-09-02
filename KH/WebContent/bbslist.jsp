<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Material Design Bootstrap</title>
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
.div-hearder-navbar {
	margin-top: 15px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 5px;
	background-color: #f6f6f6;
}

/* Necessary for full page carousel*/
html, header, .view {
	height: 100%;
}

body {
	height: 100%;
	background: url('') no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

/* Carousel*/
.carousel, .carousel-item, .carousel-item.active {
	height: 100%;
}

.carousel-inner {
	height: 100%;
}

.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.navbar-toggler-icon {
	color: #E6E5E3;
	border-color: #E6E5E3;
	background-color: #E6E5E3;
}

.collapse-content .fa.fa-heart:hover {
  color: #f44336 !important;
}
.collapse-content .fa.fa-share-alt:hover {
  color: #0d47a1 !important;
}

@media ( min-width : 800px) and (max-width: 850px) {
	.navbar
	:not
	 
	(
	.top-nav-collapse
	 
	)
	{
	background
	:
	 
	#1C2331
	 
	!
	important
	;
	
	
}
}
</style>
</head>
<body>
	<div class="container">
		<!--Main Navigation-->
		<header>
		<div class="div-hearder-navbar" align="center">
			<img
				src="https://user-images.githubusercontent.com/38531104/44904424-3f8a1800-ad4a-11e8-8bde-fbbbff45912b.png"
				class="img-fluid" alt="Responsive image">
		</div>
		<!--Navbar--> <nav class="navbar navbar-expand-lg navbar-dark"
			style="backgroud-color : white; margin-left : auto; margin-right : auto; margin-bottom : 15px;">

		<!-- Collapse button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#basicExampleNav" aria-controls="basicExampleNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Collapsible content -->
		<div
			class="collapse navbar-collapse justify-content-center font-weight-bold"
			id="basicExampleNav">

			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item hoverable"><a class="nav-link"
					href="index.jsp"
					style="color: black; padding-left: 25px; padding-right: 25px;">Home</a></li>
				<li class="nav-item hoverable"><a class="nav-link" href="#"
					style="color: black; padding-left: 25px; padding-right: 25px;">Event</a></li>
				<li class="nav-item hoverable"><a class="nav-link"
					href="bbslist.jsp"
					style="color: black; padding-left: 25px; padding-right: 25px;">Board</a></li>
				<li class="nav-item hoverable"><a class="nav-link" href="#"
					style="color: black; padding-left: 25px; padding-right: 25px;">Login</a></li>

				<!-- Dropdown -->
				<!-- <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu dropdown-primary"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div>
				</li> -->

			</ul>
			<!-- Links -->

		</div>
		</nav> <!--/.Navbar--> </header>
		<!-- // Main Navigation-->

		<!--Main layout-->
		<div>

			<!-- Search Bar -->
			<div class="row"
				style="padding-left: 15px; padding-right: 15px; margin-top: 25px; margin-bottom: 50px">
				<div class="col-md-8" id="allpost">
					<a href="bbslist.jsp" class="grey-text">All Posts</a>
				</div>
				<div class="col-md-4">
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
				style="margin-top: 15px; padding-left: 15px; padding-right: 15px;">

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
						<div class="card-body d-flex flex-row"
							style="padding: 10px; padding-top: 25px">
							<!-- Avatar -->
							<img
								src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg"
								class="rounded-circle mr-3" height="50px" width="50px"
								alt="avatar">

							<!-- userId -->
							<h4 style="font-family: inherit"># 작성자ID</h4>
						</div>
						<!-- input title -->
						<div class="md-form mb-5" style="margin-top: 10px">
							<input type="text" id="title" class="form-control validate">
							<label data-error="wrong" data-success="right" for="form32">Title</label>
						</div>
						<!-- input content -->
						<div class="md-form" style="margin-bottom: 10px">
							<textarea type="text" id="content"
								class="md-textarea form-control" rows="4"></textarea>
							<label data-error="wrong" data-success="right" for="form8">Your
								message</label>
						</div>
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
								style="margin-right: 7px">사진등록</button>
							<a href="#"
								onclick="document.getElementById('regi_bbs').submit()"><button
									type="button" class="btn btn-outline-info waves-effect">글쓰기</button></a>
						</div>
					</form>
				</div>
				<!-- // BbsWrite layer -->

				<!-- View BBS -->
				<div class="col-md-6">
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
								<h4 class="card-title font-weight-bold mb-2">New spicy
									meals</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top rounded-0"
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body">

							<div class="collapse-content">

								<!-- Text -->
								<p class="card-text collapse" id="collapseContent">Recently,
									we added several exotic new dishes to the menu of our
									restaurant. They come from countries such as Mexico, Argentina,
									and Spain. Come to us, have a delicious wine and enjoy the
									juicy meals from around the world.</p>
								<!-- Button -->
								<a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed"
									data-toggle="collapse" href="#collapseContent"
									aria-expanded="false" aria-controls="collapseContent">내용보기</a> <i
									class="fa fa-share-alt text-muted float-right p-1 my-1"
									data-toggle="tooltip" data-placement="top"
									title="Share this post"></i> <i
									class="fa fa-heart text-muted float-right p-1 my-1 mr-3"
									data-toggle="tooltip" data-placement="top" title="I like it"></i>

							</div>

						</div>

					</div>
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
								<h4 class="card-title font-weight-bold mb-2">New spicy
									meals</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top rounded-0"
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body">

							<div class="collapse-content">

								<!-- Text -->
								<p class="card-text collapse" id="collapseContent">Recently,
									we added several exotic new dishes to the menu of our
									restaurant. They come from countries such as Mexico, Argentina,
									and Spain. Come to us, have a delicious wine and enjoy the
									juicy meals from around the world.</p>
								<!-- Button -->
								<a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed"
									data-toggle="collapse" href="#collapseContent"
									aria-expanded="false" aria-controls="collapseContent">내용보기</a> <i
									class="fa fa-share-alt text-muted float-right p-1 my-1"
									data-toggle="tooltip" data-placement="top"
									title="Share this post"></i> <i
									class="fa fa-heart text-muted float-right p-1 my-1 mr-3"
									data-toggle="tooltip" data-placement="top" title="I like it"></i>

							</div>

						</div>

					</div><div class="card promoting-card">

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
								<h4 class="card-title font-weight-bold mb-2">New spicy
									meals</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top rounded-0"
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body">

							<div class="collapse-content">

								<!-- Text -->
								<p class="card-text collapse" id="collapseContent">Recently,
									we added several exotic new dishes to the menu of our
									restaurant. They come from countries such as Mexico, Argentina,
									and Spain. Come to us, have a delicious wine and enjoy the
									juicy meals from around the world.</p>
								<!-- Button -->
								<a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed"
									data-toggle="collapse" href="#collapseContent"
									aria-expanded="false" aria-controls="collapseContent">내용보기</a> <i
									class="fa fa-share-alt text-muted float-right p-1 my-1"
									data-toggle="tooltip" data-placement="top"
									title="Share this post"></i> <i
									class="fa fa-heart text-muted float-right p-1 my-1 mr-3"
									data-toggle="tooltip" data-placement="top" title="I like it"></i>

							</div>

						</div>

					</div><div class="card promoting-card">

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
								<h4 class="card-title font-weight-bold mb-2">New spicy
									meals</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top rounded-0"
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body">

							<div class="collapse-content">

								<!-- Text -->
								<p class="card-text collapse" id="collapseContent">Recently,
									we added several exotic new dishes to the menu of our
									restaurant. They come from countries such as Mexico, Argentina,
									and Spain. Come to us, have a delicious wine and enjoy the
									juicy meals from around the world.</p>
								<!-- Button -->
								<a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed"
									data-toggle="collapse" href="#collapseContent"
									aria-expanded="false" aria-controls="collapseContent">내용보기</a> <i
									class="fa fa-share-alt text-muted float-right p-1 my-1"
									data-toggle="tooltip" data-placement="top"
									title="Share this post"></i> <i
									class="fa fa-heart text-muted float-right p-1 my-1 mr-3"
									data-toggle="tooltip" data-placement="top" title="I like it"></i>

							</div>

						</div>

					</div><div class="card promoting-card">

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
								<h4 class="card-title font-weight-bold mb-2">New spicy
									meals</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>

							</div>

						</div>

						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top rounded-0"
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>

						<!-- Card content -->
						<div class="card-body">

							<div class="collapse-content">

								<!-- Text -->
								<p class="card-text collapse" id="collapseContent">Recently,
									we added several exotic new dishes to the menu of our
									restaurant. They come from countries such as Mexico, Argentina,
									and Spain. Come to us, have a delicious wine and enjoy the
									juicy meals from around the world.</p>
								<!-- Button -->
								<a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed"
									data-toggle="collapse" href="#collapseContent"
									aria-expanded="false" aria-controls="collapseContent">내용보기</a> <i
									class="fa fa-share-alt text-muted float-right p-1 my-1"
									data-toggle="tooltip" data-placement="top"
									title="Share this post"></i> <i
									class="fa fa-heart text-muted float-right p-1 my-1 mr-3"
									data-toggle="tooltip" data-placement="top" title="I like it"></i>

							</div>

						</div>

					</div>
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
								<h4 class="card-title font-weight-bold mb-2">New spicy
									meals</h4>
								<!-- Subtitle -->
								<p class="card-text">
									<i class="fa fa-clock-o pr-2"></i>07/24/2018
								</p>
							</div>
						</div>
						<div class="btn-group btn-group-sm" role="group"
							aria-label="Basic example" style="padding-left: 10px">
							<button type="button" class="btn btn-unique btn-sm">Like
								: 125</button>
							<button type="button" class="btn btn-unique btn-sm">View
								: 1920</button>
						</div>
						<!-- Card image -->
						<div class="view overlay" style="margin: 10px">
							<img class="card-img-top rounded-0"
								src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
					</div>
				</div>
				<!-- // best bbsList -->
			</div>
			<!-- //  Main Content -->
		</div>
		<!-- // Main layout-->

		<!-- Footer -->
		<footer class="page-footer font-small unique-color-dark pt-4"
			style="margin-top :15px;  margin-left: auto; margin-right: auto;">
		<!-- Footer Elements -->
		<div class="container">

			<!-- Call to action -->
			<ul class="list-unstyled list-inline text-center py-2">
				<li class="list-inline-item">
					<h5 class="mb-1">Register for free</h5>
				</li>
				<li class="list-inline-item"><a href="#!"
					class="btn btn-outline-white btn-rounded">Sign up!</a></li>
			</ul>
			<!-- Call to action -->

		</div>
		<!-- Footer Elements --> <!-- Copyright -->
		<div class="footer-copyright text-center py-3">
			© 2018 Copyright: <a
				href="https://mdbootstrap.com/bootstrap-tutorial/">
				MDBootstrap.com</a>
		</div>
		</footer>
	</div>
	<!-- Copyright -->
	<!-- // Footer-->

	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
	<!-- JQuery -->
	<script type="text/javascript" src="resources/js/sticky-kit.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="resources/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="resources/js/mdb.min.js"></script>
	<script type="text/javascript">
		/* $("#layer_fixed_1").stick_in_parent(); */
		$(".sticky_column").stick_in_parent();
	</script>
</body>
</html>