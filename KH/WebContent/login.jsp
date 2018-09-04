<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<!-- Card -->
<div class="card">

    <!-- Card body -->
    <div class="card-body">
	<form action="MemberController" method="post">
            <p class="h4 text-center py-4">Sign in</p>

            <!-- Material input text -->
            <div class="md-form">
                <i class="fa fa-user prefix grey-text"></i>
                <input type="text" name="id" id="materialFormCardNameEx" class="form-control">
                <label for="materialFormCardNameEx" class="font-weight-light">Your id</label>
            </div>
            
            

            <!-- Material input password -->
            <div class="md-form">
                <i class="fa fa-lock prefix grey-text"></i>
                <input type="password" name="pwd" id="materialFormCardPasswordEx" class="form-control">
                <label for="materialFormCardPasswordEx" class="font-weight-light">Your password</label>
            </div>

            <div class="text-center py-4 mt-3">
      			<button class="btn btn-primary" type="submit">Sign in</button>
                <button type="button" class="btn btn-primary" onclick="location.href='join.jsp'">Sign up</button>
                <input type="hidden" name="command" value="login">
            </div>
        </form>
        
        <p class="font-small dark-grey-text text-right d-flex justify-content-center mb-3 pt-2"> or Sign in with:</p>

            <div class="row my-3 d-flex justify-content-center">
                <!--Facebook-->
                <button type="button" class="btn btn-white btn-rounded mr-md-3 z-depth-1a"><i class="fa fa-facebook blue-text text-center"></i></button>
                <!--Twitter-->
                <button type="button" class="btn btn-white btn-rounded mr-md-3 z-depth-1a"><i class="fa fa-twitter blue-text"></i></button>
                <!--Google +-->
                <button type="button" class="btn btn-white btn-rounded z-depth-1a"><i class="fa fa-google-plus blue-text"></i></button>
            </div>
	</div>
</div>
        

<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>