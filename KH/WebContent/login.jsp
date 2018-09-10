<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<html>
<head>
<title>Honey Jam</title>
<meta name="google-signin-client_id" content="409625888327-vrvm3i95dbmhokdu7kqtmjcd73cmn0av.apps.googleusercontent.com">
</head>
<body>
	<div class="container" style="margin-bottom: 10px">
		<!-- Card -->
		<div class="card">

			<!-- Card body -->
			<div class="card-body "
				style="padding: 25%; padding-top: 5%; padding-bottom: 5%">

				<form action="MemberController?command=login" method="post">
					<p class="h4 text-center py-4">LOGIN</p>

					<!-- Material input text -->
					<div class="md-form">
						<i class="fa fa-user prefix grey-text"></i> <input type="text"
							name="id" id="materialFormCardNameEx" class="form-control">
						<label for="materialFormCardNameEx" class="font-weight-light">Your
							id</label>
					</div>

					<!-- Material input password -->
					<div class="md-form">
						<i class="fa fa-lock prefix grey-text"></i> <input type="password"
							name="pwd" id="materialFormCardPasswordEx" class="form-control">
						<label for="materialFormCardPasswordEx" class="font-weight-light">Your
							password</label>
					</div>

					<div class="text-center py-4 mt-3">
						<button class="btn btn-primary" type="submit">Login</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='join.jsp'">Sign up</button>
					</div>
				</form>
				<p
					class="font-small dark-grey-text text-right d-flex justify-content-center mb-3 pt-2">
					or Sign in with:</p>
				<div class="row my-3 d-flex justify-content-center">
					<!--Facebook-->
					<button type="button"
						class="btn btn-white btn-rounded mr-md-3 z-depth-1a">
						<i class="fa fa-facebook blue-text text-center"></i>
					</button>
					<!--Google +-->
					<div class="g-signin2" data-onsuccess="onSignIn"></div>
					<a href="#" onclick="signOut();">Sign out</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

			location.href = "MemberController?command=gooleLogin&id=" + profile.getId()
					+ "&pwd = " + profile.getEmail() + "&name="
					+ profile.getName() + "img="
					+ profile.getImageUrl();
		}
		function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }
	</script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>