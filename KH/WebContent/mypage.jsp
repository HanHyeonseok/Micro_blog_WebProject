<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Honey Jam</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
	<!-- Card -->
	<div class="card">

		<!-- Card body -->
		<div class="card-body">

			<!-- Material form register -->
			<form action="MemberController">
				<p class="h4 text-center py-4">My Page</p>
				
				<!-- Material img view -->
				<div>
					<img
						style="width: 250px; height: 250px;"
						src="upload/<%=mem.getImg()%>" class="rounded-circle mr-3"
						alt="avatar">
				</div>
				

				<!-- Material id view text -->
				<div class="md-form">
					<i class="fa fa-user prefix grey-text"></i> <input type="text"
						name="id" id="id" class="form-control" value="<%=mem.getId() %>" readonly="readonly">					
				</div>
				
				<!-- Material name view text -->
				<div class="md-form">
					<i class="fa fa-user prefix grey-text"></i> <input type="text"
						name="name" id="name" class="form-control" value="<%=mem.getName() %>" readonly="readonly">
				</div>

				<!-- Material input email -->
				<div class="md-form">
					<i class="fa fa-envelope prefix grey-text"></i> <input type="text"
						name="email" id="email" class="form-control" value="<%=mem.getEmail() %>" readonly="readonly">
				</div>


				<!-- Material input phone -->
				<div class="md-form">
					<i class="fa fa-phone-square prefix grey-text"></i> <input
						type="text" name="phone" id="phone" class="form-control" value="<%=mem.getPhone() %>" readonly="readonly">				
				</div>

				<!-- Material input address -->
				<div class="md-form" >
					<i class="fa fa-address-book prefix grey-text"></i>
					<input class="form-control" type="text" id ="address_num" name="address"
					 placeholder="Address Number" readonly="readonly" 
					 value="<%=mem.getAddress().replace("-", "   ")%>">									
				</div>
							
				<!-- Sign up -->
				<div class="text-center py-4 mt-3">
					<button class="btn btn-primary" type="submit">Update</button>
					<input type="hidden" name="command" value="update">
					<button class="btn btn-primary" type="button" onclick="location.href='index.jsp'">Home</button>					
				</div>
			</form>
			<!-- Material form register -->

		</div>
		<!-- Card body -->

	</div>
	

	
	



<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>