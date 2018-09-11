<%@page import="dto.FavoriteDto"%>
<%@page import="dao.BbsDAOImpl"%>
<%@page import="dao.BbsDAO"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/include/header.jsp" %>

<html>

<head>
	
    <title>Honey Jam</title>
	
	
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">
	
	
	
    
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



<body id="page-top" class="index-page">

<%
	
	BbsDto dto = (BbsDto)request.getAttribute("dto");
	
	if (mem == null) {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
	
	BbsDAOImpl bbsdao = BbsDAO.getInstance();
	//FavoriteDto likeDto = bbsdao.getCheckLike(mem.getId(), dto.getSeq());
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
						    <button type="button" class="btn btn-purple btn-rounded btn-sm heart" id="btn_fav" onclick="check_like()" value="<%=dto.getFavorite() %>"><i class="fa fa-heart-o heart-1" aria-hidden="true"></i></button>
						    <input type="button" class="btn btn-purple btn-rounded btn-sm heart" id="favcount" value="<%=dto.getFavorite() %>" readonly="readonly"><!-- <i class="fa fa-heart-o heart-1" aria-hidden="true"></i> -->
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
						</div>
					</div>
				</article>
			</div>	
			
		</div>
		
	</div>
	
	<!-- 내용 수정 -->
	
<div align="right">
<button type="button" class="btn btn-rounded btn-amber"><i class="fa fa-th-list pr-2" aria-hidden="true"></i>목록</button>

<%if(mem.getId().equals(dto.getId())){ %> 

<button type="button" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-rounded"><i class="fa fa-trash"></i>삭제</button>

<button type="button" data-toggle="modal" data-target="#updateModal" class="btn btn-primary"><i class="fa fa-magic mr-1"></i>내용 수정</button>

<% 
}
%>
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

<!-- 내용 수정 Modal -->
<form method="post" action="BbsController?command=update&sequence=<%=dto.getSeq() %>">
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

    <!-- Add .modal-dialog-centered to .modal-dialog to vertically center the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document">


 	<div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">내용 수정</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body">
          
          <div class="form-group green-border-focus">
	    <label for="exampleFormControlTextarea5"><input name="title" type="text" value="<%=dto.getTitle() %>"></label>
	    <textarea name="content" class="form-control" id="updateForm" rows="15"><%=dto.getContent() %></textarea>
	</div>
	
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <input id="changeBbs" type="submit" class="btn btn-primary" value="Save Changes">
          </div>
      </div>
      
  </div>
</div>
</form>

<!-- 내용 수정 Modal -->
	
	<!-- 게시글 삭제 Modal -->
							
<form method="post" action="BbsController?command=delete&sequence=<%=dto.getSeq() %>">
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-sm" role="document">

      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title w-100" id="myModalLabel">Message</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          	게시글을 삭제하시겠습니까? <br> 다시 복구할 수 없습니다.
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" value="아니요">
          <input type="submit" class="btn btn-primary btn-sm" value="예">
        </div>
      </div>
    </div>
  </div>
 </form>
	<!-- 게시글 삭제 Modal -->
	
	<div>
		<input type="hidden" id="m_id" value="<%=mem.getId() %>">
		<input type="hidden" id="b_seq" value="<%=dto.getSeq() %>">
		<input type="hidden" id="b_fav" value="<%=dto.getFavorite() %>">
	</div>
	
	  <!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

<script type="text/javascript">
		
function check_like() {
	var id = $("#m_id").val();
    var bbsSeq  = $("#b_seq").val();
    var favorite = $("#b_fav").val();

    
    alert("id =" + id);
    alert("bbsSeq =" + bbsSeq);
    alert("favorite =" + favorite);
         
    $.ajax({
       url : "BbsController?command=favorite",
       type : "get",
       data : {
          id : id ,
          bbsSeq : bbsSeq,
          favorite : favorite
       },
       success : function(obj) {

          var jsonObj = JSON.parse(obj);
          if (jsonObj.duplicated == 1) {
             alert("체크했었음 -> 좋아요 취소");
             $("#favcount").val(jsonObj.favorite);
          }

          else {
             alert("체크 가능  -> 좋아요");
             $("#favcount").val(jsonObj.favorite);
             
          }
          
         // document.location.reload();

       },

       error : function(xhr, status) {
          alert(xhr + " : " + status)
       }
    })
	
}




	
</script>
		

<!-- Definity JS -->
<script type="text/javascript" src="resources/js/sticky-kit.min.js"></script>	
	
</body>
</html>

<%@ include file="/WEB-INF/include/footer.jsp" %>

  
  