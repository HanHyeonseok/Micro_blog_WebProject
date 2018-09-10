<%@page import="dto.FavoriteDto"%>
<%@page import="dao.BbsDAOImpl"%>
<%@page import="dao.BbsDAO"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/include/header.jsp" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free Bootstrap Themes by Zerotheme dot com - Free Responsive Html5 Templates">
    <meta name="author" content="https://www.Zerotheme.com">
	
    <title>Detail Data</title>
	
	
    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	
	<!-- Custom CSS -->
	<link href="resources/css/style.css" rel="stylesheet">
	
	<!-- Animate.css -->
	<!-- <link href="resources/css/animate.css" rel="stylesheet" media="all" type="text/css"> -->
	
	<!-- Custom Fonts -->
    <!-- <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
	
	
	<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">
	
	
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
    
<style type="text/css">
.div-hearder-navbar {
	margin-top: 15px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 15px;
	background-color: #f6f6f6;
}

.contents {
	max-width: 780px;
    margin: 0 auto;
    text-align: center;
}

img {
	max-width: 100%; /* 이미지의 최대사이즈 */
    width /***/: auto; /* IE8 */
    height: auto;
    vertical-align: bottom;
}
/* Necessary for full page carousel*/


/* comment classes */

.media .avatar {
    width: 64px;
}
.shadow-textarea textarea.form-control::placeholder {
    font-weight: 300;
}
.shadow-textarea textarea.form-control {
    padding-left: 0.8rem;
}

.green-border-focus .form-control:focus {
    border: 1px solid #8bc34a;
    box-shadow: 0 0 0 0.2rem rgba(139, 195, 74, .25);
}
</style>



</head>

<!-- <script>
	(function () {
		var scripts = ["/static/general/bf-core.min.js", "/static/containers/QMI797.js"];
		for(var i = 0; i < scripts.length; i++){
			var script = document.createElement("scripts");
			script.src = "//brandflow.net" + scripts[i] + "?ts=" + Date.now() + "#";
			script.async = false;
			document.head.appendChild(script);
		}
	})();
</script> -->


<body id="page-top" class="index-page">

<%
	
	BbsDto dto = (BbsDto)request.getAttribute("dto");
	
	if (mem == null) {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	
	BbsDAOImpl bbsdao = BbsDAO.getInstance();
	FavoriteDto likeDto = bbsdao.getCheckLike(mem.getId(), dto.getSeq());
%>

<div class="wrap-body">


	
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content">
		
		<div class="box-content">
			<div class="container">
				<!-----------------Content-------------------->
				<article class="single-post">
					<div class="wrap-post"><!--Start Box-->
						<div class="entry-header text-center">
							<h1 class="entry-title"><%=dto.getTitle() %></h1>
							<!-- <span class="entry-meta">
								<ul class="list-inline link">
									<li>By <a href="#">Tufo</a></li>
									<li><a href="#">September, 22 2017</a></li>
									<li><a href="#">0 comments</a></li>
								</ul>
							</span> -->
						</div>
						
						<!--Carousel Wrapper-->
<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-1z" data-slide-to="1"></li>
        <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
        <!--First slide-->
        <div style="height: auto; max-width: 780px; " class="carousel-item active contents">
            <img class="d-block w-100" src="upload/<%=dto.getFilename() %>" alt="이미지가 없습니다">
        </div>
        <!--/First slide-->
        <!--Second slide-->
      <!--   <div class="carousel-item">
            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(129).jpg" alt="Second slide">
        </div>
        /Second slide
        Third slide
        <div class="carousel-item">
            <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).jpg" alt="Third slide">
        </div>  /Third slide -->
        
    </div>
    <!--/.Slides-->
    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->
</div>
<!-- card Content -->
<div class="card-body text-center wow fadeIn" data-wow-delay="0.2s" style="animation-name: none; visibility: visible;">
          
						
						<div align="left" class="btn-group" role="group" aria-label="Basic example">
						    <button type="button" class="btn btn-purple btn-rounded btn-sm"><i class="fa fa-television" aria-hidden="true"></i>&nbsp View : <%=dto.getReadcount() %></button>
						    <button type="button" class="btn btn-purple btn-rounded btn-sm heart"><i class="fa fa-heart-o heart-1" aria-hidden="true"></i>&nbsp Like : <%-- <%=likeDto.getLikeNo() %> --%></button>
						    <button type="button" class="btn btn-purple btn-rounded btn-sm"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp Date : <%=dto.getWdate() %></button>
						    <button type="button" class="btn btn-purple btn-rounded btn-sm"><i class="fa fa-user fa-sm pr-2" aria-hidden="true"></i>&nbsp Author : <%=dto.getId() %></button>
						</div>
						
						
						<!-- 사진 추가/수정 -->
			
						 <form class="md-form">
						    <div class="file-field big" align="center">
						        <a class="btn-floating btn-lg pink lighten-1 mt-0 float-left">
						            <i class="fa fa-paperclip" aria-hidden="true"></i>
						            <input type="file" multiple>
						        </a>
						        <div class="file-path-wrapper">
						           <input class="file-path validate" type="text" placeholder="Upload one or more files">
						        </div>
						    </div>
						</form>
									
					
</div>
               		   
                
<!-- / card Content -->


<!--/.Carousel Wrapper-->
						<div class="entry-content">
							<p><%=dto.getContent()%></p>
							
							<!-- <div class="excerpt">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum exercitation ullamco laboris nisi ut aliquip.</p></div>
							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
							<blockquote><p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet vultatup duista.</p></blockquote>
							<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril.</p>
							
							<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse lorem ipsum dolor sit amet.</p>
							<p>Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum hendrerit in vulputate velit esse molestie.</p>
							<p><code>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</code></p>
							<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
							<div class="note">
							  <ol>
								<li>Lorem ipsum</li>
								<li>Sit amet vultatup nonumy</li>
								<li>Duista sed diam</li>
							  </ol>
							  <div class="clear"></div>
							</div>
							<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
							<p>Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores.</p> -->
						</div>
					</div>
				</article>
			</div>	
			
		</div>
		
	</div>
	
	<!-- 내용 수정 -->
	
<div align="right">
	<button type="button" data-toggle="modal" data-target="#updateModal" class="btn btn-secondary">내용 수정</button>
</div>
		
		
		
<div class="media">
    <img class="d-flex rounded-circle avatar z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg" alt="Avatar">
    <div class="media-body">
        <h5 class="mt-0 font-weight-bold blue-text">Anna Smith</h5>
        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

        <div class="media mt-3 shadow-textarea">
            <img class="d-flex rounded-circle avatar z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg" alt="Generic placeholder image">
            <div class="media-body">
                
               
               <!-- reply 작성자 --> 
                <h5 class="mt-0 font-weight-bold blue-text">Danny Tatuum</h5>
                <div class="form-group basic-textarea rounded-corners">
                    <textarea class="form-control z-depth-1" id="reply" rows="3" placeholder="Write your comment..."></textarea><div align="right"><button type="button" class="btn btn-info">등록</button></div>
                </div>
                
                
                
            </div>
        </div>
    </div>
</div>
<div class="media">
    <img class="d-flex rounded-circle avatar z-depth-1-half mr-3" src="https://mdbootstrap.com/img/Photos/Avatars/avatar-10.jpg" alt="Avatar">
    <div class="media-body">
        <h5 class="mt-0 font-weight-bold blue-text">Caroline Horwitz</h5>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis odit minima eaque dignissimos recusandae officiis commodi nulla est, tempore atque voluptas non quod maxime, iusto, debitis aliquid? Iure ipsum, itaque.
    </div>
</div><br><br>

    <!--Grid row-->
    <div class="row">

      <!--Grid column-->
      <div class="col-lg-2 col-md-12 mb-4">

        <!--Image-->
        <div class="view overlay z-depth-1-half">
          <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(73).jpg" class="img-fluid" alt="">
<%--           <a href="BbsController?command=detailOnClick&sequence=<%=//list.get(index).getSeq()%>">
 --%>            <div class="mask rgba-white-light"></div>
          </a>
        </div>

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-2 col-md-6 mb-4">

        <!--Image-->
        <div class="view overlay z-depth-1-half">
          <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(78).jpg" class="img-fluid" alt="">
          <a href="">
            <div class="mask rgba-white-light"></div>
          </a>
        </div>

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-2 col-md-6 mb-4">

        <!--Image-->
        <div class="view overlay z-depth-1-half">
          <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(79).jpg" class="img-fluid" alt="">
          <a href="">
            <div class="mask rgba-white-light"></div>
          </a>
        </div>

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-2 col-md-12 mb-4">

        <!--Image-->
        <div class="view overlay z-depth-1-half">
          <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(81).jpg" class="img-fluid" alt="">
          <a href="">
            <div class="mask rgba-white-light"></div>
          </a>
        </div>

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-2 col-md-6 mb-4">

        <!--Image-->
        <div class="view overlay z-depth-1-half">
          <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(82).jpg" class="img-fluid" alt="">
          <a href="">
            <div class="mask rgba-white-light"></div>
          </a>
        </div>

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-2 col-md-6 mb-4">

        <!--Image-->
        <div class="view overlay z-depth-1-half">
          <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(84).jpg" class="img-fluid" alt="">
          <a href="">
            <div class="mask rgba-white-light"></div>
          </a>
        </div>

      </div>
      <!--Grid column-->

    </div>
    <!--Grid row-->

<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

    <!-- Add .modal-dialog-centered to .modal-dialog to vertically center the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">

<form action="BbsController?command=update">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">내용 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            
            <div class="form-group green-border-focus">
			    <label for="exampleFormControlTextarea5"><input type="text" value="<%=dto.getTitle() %>"></label>
			    <textarea class="form-control" id="updateForm" rows="15"><%=dto.getContent() %></textarea>
			</div>
			
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <input type="submit" class="btn btn-primary" value="Save Changes">
            </div>
        </div>
        </form>
    </div>
</div>
		
		
		<!-- JS -->
	<!-- ========== Scripts ========== -->
	
	
	
	  <!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

		<script type="text/javascript">
			
			<%-- function like_func(){
				
				$.ajax({
					url : "BbsController?command=Like",
					type : "POST",
					cache : false,
					dataType : "json",
					data : { bbsSeq : <%=dto.getSeq() %>,
						     memId : <%=mem.getId() %> },
				    success: function (obj) {
						System.out.println("성공");
				    	var jsonObj = JSON.parse(obj);
				    	
				    	System.out.println(jsonObj.result.getId());
				    		
				    	
					}
				});
				
			} --%>
		
			
$(function () {

	$('.heart').click(function () {
		
		$.ajax({
			url : "BbsController?command=Like",
			type : "POST",
			cache : false,
			dataType : "json",
			data : { bbsSeq : <%=dto.getSeq() %>,
				     memId : <%=mem.getId() %> },
		    success: function (obj) {
				System.out.println("성공");
		    	var jsonObj = JSON.parse(obj);
		    	
		    	System.out.println(jsonObj.result.getId());
		    			    	
			}
		});
		
	});
});
			
		
			<%-- $(document).on('click', '.heart', function() {

				var k = 0;
				
				
					<% System.out.println("기능");%>
					if (k == 0) {
						<% System.out.println(" i = 0 ");%>
						$(".heart-1")
								.replaceWith(
										"<i class='fa fa-heart' aria-hidden='true'></i>");
						k = 1;

					}

					else if (k == 1) {
						<% System.out.println(" i = 1 ");%>
						$(".heart-1")
								.replaceWith(
										"<i class='fa fa-heart-o' aria-hidden='true'></i>");
						k = 0;
					}
				}); --%>
		</script>
		

		<!-- Definity JS -->
		<script src="resources2/js/main.js"></script></body>
</html>

<%@ include file="/WEB-INF/include/footer.jsp" %>





<!-- Java Script  업데이트 완료 버튼 후 "수정완료" 메세지 모달

 
$("#centralModalSuccess").on('show.bs.modal', function(){
    alert("Hello World!");
}); 


 -->
 
 
 <!-- 
 
--Central Modal Medium Success

<div class="modal fade" id="centralModalSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-notify modal-success" role="document">
        
        --Content
        
        <div class="modal-content">
            
            --Header
            <div class="modal-header">
                <p class="heading lead">Modal Success</p>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true" class="white-text">&times;</span>
                                        </button>
            </div>

            --Body
            
            <div class="modal-body">
                <div class="text-center">
                    <i class="fa fa-check fa-4x mb-3 animated rotateIn"></i>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit iusto nulla aperiam
                        blanditiis ad consequatur in dolores culpa, dignissimos, eius non possimus fugiat.
                        Esse ratione fuga, enim, ab officiis totam.</p>
                </div>
            </div>

            --Footer
            
            <div class="modal-footer justify-content-center">
                <a type="button" class="btn btn-primary">Get it now <i class="fa fa-diamond ml-1"></i></a>
                <a type="button" class="btn btn-outline-primary waves-effect" data-dismiss="modal">No, thanks</a>
            </div>
        </div>
        
        --Content
        
    </div>
</div>

<!-- Central Modal Medium Success-->


<!-- Button trigger modal 

<div class="text-center">
    <a href="" class="btn btn-default btn-rounded" data-toggle="modal" data-target="#centralModalSuccess">Launch Modal Success <i class="fa fa-eye ml-1"></i></a>
</div>
 
  -->

  
<!-- 

1. 좋아요 누를시 해당 seq게시물의 favorite +1 구현 (Ajax)

2. 내용 수정시 모달 프레임에 해당 게시물 content , title 구현

3. image 파일 수정/삽입 버튼 누를시 해당 게시물의 image fileName 변경 구현

4. 댓글 how 구상 (Ajax)

5. 게시글 footer 부분 "다음글 보기"로 할것인지 구상



-->  
  