<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>

<%
MemberDto mypageMem = (MemberDto)session.getAttribute("login");
System.out.println(mypageMem.getId());
System.out.println(mypageMem.getPwd());
System.out.println(mypageMem.getName());
System.out.println(mypageMem.getEmail());
System.out.println(mypageMem.getAddress());
System.out.println(mypageMem.getPhone());
System.out.println(mypageMem.getImg());
System.out.println(mypageMem.getAuth());
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Update</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!-- Card -->
	<div class="card">

		<!-- Card body -->
		<div class="card-body">

			<!-- Material form register -->
			<form action="MemberController">
				<p class="h4 text-center py-4">Member Update</p>

				<!-- Material input text -->			
				<div class="md-form">
					<i class="fa fa-user prefix grey-text"></i> <input type="text"
						name="id" id="id" class="form-control" value="<%=mypageMem.getId() %>" readonly="readonly" required>					
				</div>		

				<!-- Material input password -->
				<div class="md-form">
					<i class="fa fa-lock prefix grey-text"></i> <input type="password"
						name="pwd" id="pwd" class="form-control" onkeyup="pwcheck()" required>
					<label for="pwd" class="font-weight-light">Your password</label>
				</div>

				<!-- Material input password confirm -->
				<div class="md-form">
					<i class="fa fa-lock prefix grey-text"></i> <input type="password"
						id="pwd2" class="form-control" onkeyup="pwcheck()" required> <label
						for="pwd2" class="font-weight-light">Your password confirm</label>
				</div>


				<!-- Material input password confirm message -->
				<div class="md-form">
					<i class="fa fa-exclamation-triangle prefix grey-text"></i> <input
						type="text" id="pwdname" class="form-control" value=""
						placeholder="비밀번호를 동일하게 입력하세요" disabled> <label
						for="pwdname" class="font-weight-light"></label>
				</div>

				<!-- Material input name -->			
				<div class="md-form">
					<i class="fa fa-user prefix grey-text"></i> <input type="text"
						name="name" id="name" class="form-control" value="<%=mypageMem.getName() %>" required>
				</div>
				
				<!-- Material input email -->
				<div class="md-form">
					<i class="fa fa-envelope prefix grey-text"></i> <input type="text"
						name="email" id="email" class="form-control" value="<%=mypageMem.getEmail() %>" required>
				</div>

				<!-- Material input phone -->
				<div class="md-form">
					<i class="fa fa-phone-square prefix grey-text"></i> <input
						type="text" name="phone" id="phone" class="form-control" value="<%=mypageMem.getPhone() %>" required>				
				</div>
				<!-- address '-'split -->
				<%
				String add = mypageMem.getAddress();
				String[] addSplit = add.split("-");
				String address_num = addSplit[0];
				String address = addSplit[1];
				String Detail_Address = addSplit[2];
				%>
				<!-- Material input address -->
				<div class="md-form" style="float: left;">
					<i class="fa fa-address-book prefix grey-text"></i>
					<input class="form-control" type="text" id ="address_num" name="address_num"
					 placeholder="Address Number" readonly="readonly" value="<%=address_num %>" required>									
				</div>
						<!-- address search button -->						
				<div class="md-form" style="padding-top: 20px">										
				<button type="button" class="btn btn-outline-default waves-effect" onclick="sample6_execDaumPostcode()"><i class="fa fa-search" aria-hidden="true"></i></button>
				</div>				
				<div class="md-form">				
					<input class="form-control" type="text" id ="address" name="address"
					 placeholder="Confirm your address" readonly="readonly" value="<%=address %>" required>				
				</div>
				<div class="md-form">
					<input class="form-control" type="text" id ="Detail_Address" name="Detail_Address" value="<%=Detail_Address %>"
					 placeholder="Address Detail" required>						
				</div>				
			
				<!-- Sign up -->
				<div class="text-center py-4 mt-3">
					<button class="btn btn-primary" type="submit">Update Complete</button>
					<input type="hidden" name="command" value="memberUpdate">
					<input type="hidden" name="auth" value="<%=mem.getAuth() %>">
				</div>
			</form>
			<!-- Material form register -->

		</div>
		<!-- Card body -->

	</div>
	<!-- search address func -->
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_num').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('Detail_Address').focus();
            }
        }).open();
    }
    
    
</script>
	<!-- Card -->
	



	<script type="text/javascript">
		var idok = "false";
		var passwordcheck = "false";

		function idcheck() {

			var id = $("#id").val();

			if (id == "" || null) {

				alert("빈칸은 허용하지않습니다.");

				return false;

			}

			$.ajax({
				url : "MemberController?command=idCheck",
				type : "get",
				data : {
					id : $("#id").val()
				},
				success : function(obj) {

					var jsonObj = JSON.parse(obj);
					if (jsonObj.duplicated) {
						alert("아이디가 중복됩니다.");
						$("#id").val("");
						idok = "false";
					}

					else {
						alert("중복되는 아이디가 없습니다.");
						idok = "ok";

					}

				},

				error : function(xhr, status) {
					alert(xhr + " : " + status)
				}
			})

		}

		function joincheck() { //id 및 비밀번호 확인후 회원가입 처리페이지로 이동

			if (idok == "false") {

				alert("ID체크를 하세요");

				return false;
			}

			if (passwordcheck == "false") {

				alert("비밀번호 체크를 하세요");

				return false;
			}

			return true;

		}

		function pwcheck() { //비밀번호 재입력 확인 메소드

			var pw1 = "";
			var pw2 = "";

			pw1 = $("#pwd").val();

			pw2 = $("#pwd2").val();

			if (pw1 == pw2 && pw1 != "") {

				$("#pwdname").val("비밀번호가 일치합니다").css("color", "blue");
				;

				passwordcheck = "true";

			} else {
				$("#pwdname").val("비밀번호가 불일치합니다").css("color", "red");
				passwordcheck = "false";
			}

		}

		function addCheck() {

		}
	</script>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>