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
	margin-bottom: 15px;
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
				<li class="nav-item hoverable"><a class="nav-link" href="index.jsp"
					style="color: black; padding-left: 25px; padding-right: 25px;">Home</a></li>
				<li class="nav-item hoverable"><a class="nav-link" href="#"
					style="color: black; padding-left: 25px; padding-right: 25px;">Event</a></li>
				<li class="nav-item hoverable"><a class="nav-link" href="bbslist.jsp"
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
		<main> <!--Carousel Wrapper-->
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
		<!--/.Carousel Wrapper--> </main>
		<!-- // Main layout-->

		<!--Footer-->
		<!-- Footer -->
		<footer class="page-footer font-small unique-color-dark pt-4"
			style="margin-left: auto; margin-right: auto;"> <!-- Footer Elements -->
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
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="resources/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="resources/js/mdb.min.js"></script>
</body>
</html>