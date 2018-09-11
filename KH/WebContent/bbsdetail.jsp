<%@page import="dto.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp"%>
<%
   BbsDto dto = (BbsDto)request.getAttribute("dto");
   List<ReplyDto> commentview = (List<ReplyDto>)request.getAttribute("Replylist");
%>

<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
   content="Free Bootstrap Themes by Zerotheme dot com - Free Responsive Html5 Templates">
<meta name="author" content="https://www.Zerotheme.com">

<title>Detail Data</title>


<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
   type="text/css">

<!-- Custom CSS -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- Animate.css -->
<!-- <link href="resources/css/animate.css" rel="stylesheet" media="all" type="text/css"> -->

<!-- Custom Fonts -->
<!-- <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->


<!-- Font Awesome -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css"
   rel="stylesheet">



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
/*댓글부분 css  */
.purple-border textarea {
   border: 1px solid #ba68c8;
}

.purple-border .form-control:focus {
   border: 1px solid #ba68c8;
   box-shadow: 0 0 0 0.2rem rgba(186, 104, 200, .25);
}
/* 댓글부분 css부분 끝 */

/* 파일 버튼 css */
.btn-file {
   position: relative;
   overflow: hidden;
}

.btn-file input[type=file] {
   cursor: inherit;
   display: none;
}
/* 파일 버튼 css 끝 */
.div-hearder-navbar {
   margin-top: 15px;
   margin-left: auto;
   margin-right: auto;
   margin-bottom: 15px;
   background-color: #f6f6f6;
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
   <div class="container" style="margin-bottom: 30px">
      <div class="wrap-body">



         <!-- /////////////////////////////////////////Content -->
         <div id="page-content">

            <div class="box-content">
               <div class="container">
                  <!-----------------Content-------------------->
                  <article class="single-post">
                     <div class="wrap-post">
                        <!--Start Box-->
                        <div class="entry-header text-center">
                           <h1 class="entry-title"><%=dto.getTitle() %></h1>
                           <!-- <span class="entry-meta">
                        <ul class="list-inline link">
                  `         <li>By <a href="#">Tufo</a></li>
                           <li><a href="#">September, 22 2017</a></li>
                           <li><a href="#">0 comments</a></li>
                        </ul>
                     </span> -->
                        </div>
                        <!--Carousel Wrapper-->
                        <div id="carousel-example-1z"
                           class="carousel slide carousel-fade" data-ride="carousel">
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
                                    src="upload/<%=dto.getFilename() %>" alt="이미지가 없습니다">
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
                           <a class="carousel-control-prev" href="#carousel-example-1z"
                              role="button" data-slide="prev"> <span
                              class="carousel-control-prev-icon" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                           </a> <a class="carousel-control-next" href="#carousel-example-1z"
                              role="button" data-slide="next"> <span
                              class="carousel-control-next-icon" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                           </a>
                           <!--/.Controls-->
                        </div>
                        <!-- card Content -->
                        <div class="card-body text-center wow fadeIn"
                           data-wow-delay="0.2s"
                           style="animation-name: none; visibility: visible;">


                           <div align="left" class="btn-group" role="group"
                              aria-label="Basic example">
                              <button type="button"
                                 class="btn btn-purple btn-rounded btn-sm">
                                 <i class="fa fa-television" aria-hidden="true"></i>&nbsp View
                                 : 123
                              </button>
                              <button type="button"
                                 class="btn btn-purple btn-rounded btn-sm heart">
                                 <i class="fa fa-heart-o heart-1" aria-hidden="true"></i>&nbsp
                                 Like : 123
                              </button>
                              <button type="button"
                                 class="btn btn-purple btn-rounded btn-sm">
                                 <i class="fa fa-pencil" aria-hidden="true"></i>&nbsp Date :
                                 1989/11/11
                              </button>
                              <button type="button"
                                 class="btn btn-purple btn-rounded btn-sm">
                                 <i class="fa fa-user fa-sm pr-2" aria-hidden="true"></i>&nbsp
                                 Author : Seojin
                              </button>
                           </div>


                           <!-- 사진 추가/수정 -->

                           <a class=" btn btn-default btn-file"> <i
                              class="fa fa-paperclip" aria-hidden="true"></i> <label
                              for="ex_file">파일수정</label> <input type="file" id="ex_file">
                           </a>


                        </div>


                        <!-- / card Content -->


                        <!--/.Carousel Wrapper-->
                        <br> <br>
                        <!-- 글내용들어오는곳  -->
                        <div class="entry-content">
                           <p align="center"><%=dto.getContent()%></p>


                        </div>
                  </article>
               </div>

            </div>

         </div>

         <!-- 내용 수정 -->

         <div align="right">
            <button type="button" data-toggle="modal" data-target="#updateModal"
               class="btn btn-secondary">내용 수정</button>
         </div>


         <!--댓글부분 시작  -->
         <div class="media">
            <div class="media-body">


               <div class="diary-commant">
                  <h4>댓글</h4>
                  <div class="diary-commant"
                     style="padding: 30px; -moz-border-radius: 10px; -webkit-border-radius: 10px; text-align: center; background: #E6E6FA !important;">

                     <%
               for(int i=0; i<commentview.size(); i++ ){
                  System.out.println(mem.getId());
                  System.out.println(commentview.get(i).getId());
            %>
                     <div class="commant-view"
                        style="margin-bottom: 20px; padding-left: 38px; padding-right: 38px;">
                        <div class="commant-id"
                           style="text-align: left; font-weight: 700; margin-bottom: 8px; display: table; width: 100%;">

                           <p style="float: left;"><%=commentview.get(i).getId() %></p>
                           <p
                              style="float: left; margin-left: 10px; font-weight: 300; font-size: 12px; margin-top: 5px;">
                              <%=commentview.get(i).getWdate().substring(0,16) %></p>


                           <% 
                           if(commentview.get(i).getId().equals(mem.getId())){
                              System.out.print(commentview.get(i).getId());
                              %>
                           <form
                              action="BbsController?command=deletecomment&dtoseq=<%=dto.getSeq() %>&coseq=<%=commentview.get(i).getSeq() %>"
                              method="post">
                              <!-- <input type="hidden" name="command" value="deletecomment"> -->
                              <%-- <input type="hidden" name="seq" value="<%=dto.getSeq() %>"> --%>
                              <%-- <input type="hidden" name="commentseq"
                                 value="<%=commentview.get(i).getSeq() %>"> --%>
                              <button type="submit"
                                 class="btn btn-outline-secondary waves-effect px-3"
                                 style="float: right; cursor: pointer;">
                                 <i class="fa fa-close" aria-hidden="true"></i>
                              </button>
                           </form>
                           <%} %>


                        </div>

                        <div class="commant-content"
                           style="width: 88%; word-break: break-all; text-align: left; color: #696969">
                           <%=commentview.get(i).getContent() %>
                        </div>
                        <hr>
                     </div>

                     <%
                           }
                        %>
                     <form action="BbsController" method="get">
                        <input type="hidden" name="command" value="commentwrite">

                        <div class="form-group purple-border"
                           style="text-align: left; margin-left: 40px; font-weight: 700; margin-bottom: 8px;">
                           <label for="exampleFormControlTextarea4"><%=mem.getId() %></label>
                           
                           <textarea class="form-control" id="exampleFormControlTextarea4"
                              name="dcomment"
                              style="width: 80%; height: 80px; vertical-align: text-bottom;"></textarea>
                           <input type="hidden" name="seq" value="<%=dto.getSeq()%>">

                           <button type="submit" class="btn btn-secondary px-3"
                              style="height: 68px; vertical-align: text-bottom;">
                              <i class="fa fa-commenting" aria-hidden="true"></i>댓글달기
                           </button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
         <!--댓글부분 끝  -->


      </div>
   </div>



   <!-- Modal -->
   <div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

      <!-- Add .modal-dialog-centered to .modal-dialog to vertically center the modal -->
      <div class="modal-dialog modal-dialog-centered" role="document">


         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLongTitle">내용 수정</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">

               <div class="form-group green-border-focus">
                  <label for="exampleFormControlTextarea5"><input
                     type="text" value="<%=dto.getTitle() %>"></label>
                  <textarea class="form-control" id="exampleFormControlTextarea5"
                     rows="15"><%=dto.getContent() %></textarea>
               </div>

            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
            </div>
         </div>
      </div>
   </div>


   <!-- JS -->
   <!-- ========== Scripts ========== -->



   <!-- JQuery -->
   <script type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- Bootstrap tooltips -->
   <script type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
   <!-- Bootstrap core JavaScript -->
   <script type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
   <!-- MDB core JavaScript -->
   <script type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>

   <script type="text/javascript">

         $(function () {
            
         
         $(".heart").click(function() {

                $(".heart-1").replaceWith("<i class='fa fa-heart' aria-hidden='true'></i>");
               
         }), (function() {

                $(".heart-1").replaceWith("<i class='fa fa-heart-o' aria-hidden='true'></i>");

         });   
         
         });
                     
      </script>

   <!-- Definity JS -->
   <script src="resources2/js/main.js"></script>
</body>
</html>

<%@ include file="/WEB-INF/include/footer.jsp"%>





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

1. 좋아요 누를시 해당 seq게시물의 favorite +1 구현 

2. 내용 수정시 모달 프레임에 해당 게시물 content , title 구현

3. image 파일 수정/삽입 버튼 누를시 해당 게시물의 image fileName 변경 구현

4. 댓글 how 구상

5. 게시글 footer 부분 "다음글 보기"로 할것인지 구상



-->