<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JAM</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<!-- Card -->
<div class="card">

    <!-- Card body -->
    <div class="card-body">

        <!-- Material form register -->
        <form action="MemberController" onsubmit="return joincheck()">
            <p class="h4 text-center py-4">Sign up</p>

            <!-- Material input text -->
            <div class="md-form">
                <i class="fa fa-user prefix grey-text"></i>
                <input type="text" name="id" id="id" class="form-control">
                <label for="id" class="font-weight-light">Your id</label>
                <div align="left"><button class="btn btn-primary" type="button" onclick="idcheck()">id check</button></div>
            </div>


            <!-- Material input password -->
            <div class="md-form">
                <i class="fa fa-lock prefix grey-text"></i>
                <input type="password" name="pwd" id="pwd" class="form-control" onkeyup = "pwcheck()">
                <label for="pwd" class="font-weight-light">Your password</label>
            </div>
            
            <!-- Material input password confirm -->
            <div class="md-form">
                <i class="fa fa-lock prefix grey-text"></i>
                <input type="password" id="pwd2" class="form-control" onkeyup = "pwcheck()">
                <label for="pwd2" class="font-weight-light">Your email</label>
            </div>
      
            
             <!-- Material input password confirm message -->
            <div class="md-form">
                <i class="fa fa-exclamation-triangle prefix grey-text"></i>
                <input type="text" id="pwdname" class="form-control" value="" placeholder="비밀번호를 동일하게 입력하세요" disabled>
                <label for="pwdname" class="font-weight-light"></label>
            </div>
            
            <!-- Material input name -->
            <div class="md-form">
               <i class="fa fa-user prefix grey-text"></i>
                <input type="text" name="name" id=""name"" class="form-control">
                <label for=""name"" class="font-weight-light">Confirm your name</label>
            </div>
            
            
             <!-- Material input email -->
            <div class="md-form">
                <i class="fa fa-envelope prefix grey-text"></i>
                <input type="text" name="email" id="email" class="form-control">
                <label for="email" class="font-weight-light">Confirm your email</label>
            </div>
            
            
            <!-- Material input phone -->
            <div class="md-form">
                <i class="fa fa-phone-square prefix grey-text"></i>
                <input type="text" name="phone" id="phone" class="form-control">
                <label for="phone" class="font-weight-light">Confirm your phone</label>
            </div>
            
            
             <!-- Material input address -->
            <div class="md-form">
                <i class="fa fa-address-book prefix grey-text"></i>
                <input type="text" name="address" id="address" class="form-control">
                <label for="address" class="font-weight-light">Confirm your address</label>
            </div>
            

            <div class="text-center py-4 mt-3">
                <button class="btn btn-primary" type="submit">Sign Up</button>
                <input type="hidden" name="command" value="join">
            </div>
        </form>
        <!-- Material form register -->

    </div>
    <!-- Card body -->

</div>
<!-- Card -->




<script type="text/javascript">

var idok = "false";
var passwordcheck = "false";

function idcheck() {
	
	var id = $("#id").val();
	
	
	if(id=="" || null){
		
		alert("빈칸은 허용하지않습니다.");
		
		return false;
		
	}
	
	
	$.ajax({	
		url : "MemberController?command=idCheck",
		type:"get",
		data : {
			id:$("#id").val()
		},	
		success : function(obj){
			
			var jsonObj = JSON.parse(obj);
			if(jsonObj.duplicated){
				alert("아이디가 중복됩니다."); 
				$("#id").val(""); 
				idok = "false"; 
			}
		
			else{
				   alert("중복되는 아이디가 없습니다.");
				    idok = "ok";

			}

			 
			},
		
		error: function(xhr , status){
			alert(xhr + " : " + status)
		}
	})
		
}


function joincheck(){  //id 및 비밀번호 확인후 회원가입 처리페이지로 이동
	  
	
	 
	  if(idok == "false"){
		  
		  alert("ID체크를 하세요");
		  
		  return false;
	  } 
	  
	  
if(passwordcheck == "false"){
		  
		  alert("비밀번호 체크를 하세요");
		  
		  return false;
	  } 
	  
	  
	  
	  
	  
	  return true;
	  
	  
}



function pwcheck(){  //비밀번호 재입력 확인 메소드
	  
	  
	  var pw1 = "";
	  var pw2 = "";
	  
	 
	  
	  pw1 = $("#pwd").val();
	  
	  pw2 = $("#pwd2").val();
	  
	   
	  
	  if(pw1 == pw2 &&  pw1 != ""){
		  
		  
   $("#pwdname").val("비밀번호가 일치합니다").css("color","blue");;
		  
		  
		  passwordcheck= "true";
		  
		  		  
	  } else {  $("#pwdname").val("비밀번호가 불일치합니다").css("color","red");
	  passwordcheck= "false";
	  }
	    	  
}

</script>
<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>