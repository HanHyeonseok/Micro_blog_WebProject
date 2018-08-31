<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free Bootstrap Themes by Zerotheme dot com - Free Responsive Html5 Templates">
    <meta name="author" content="https://www.Zerotheme.com">
   
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
   <script
     src="https://code.jquery.com/jquery-3.3.1.min.js"
     integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
     crossorigin="anonymous"></script>
     
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
   
    <title>zCreative | Free Bootstrap Templates</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="resources/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="resources/css/style.css" rel="stylesheet">
   

   
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" class="index-page">
<div class="wrap-body">

   <!--////////////////////////////////////Header-->
   <header>
      <!---Main Header--->
      <div class="main-header">
         <div class="logo">
            <img src="resources/images/logo.png" class="img-responsive">               
         </div>
         <!--Navigation-->
         <nav id="menu" class="navbar">
            <div class="container-fluid">
               <div class="navbar-header">
                 <span id="heading" class="visible-xs">Categories</span>
                 <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                  
               </div>
               <div class="collapse navbar-collapse navbar-ex1-collapse">
                  <ul class="nav navbar-nav">
                     <li class="active"><a href="index.html">Home</a></li>
                     <li><a href="calendar.jsp">Event Calendar</a></li>
                     <li><a href="bbslist.jsp">여행 후기 게시판</a></li>
                     <!-- if (아이디값) 'id' 님  마우스 갖다대면 밑으로 창내려와서 내정보, 로그아웃 누를수 있게만들기-->
                     <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">'get.id'님환영합니다</a>
                        <div class="dropdown-menu" style="margin-left: 5px; width:70px;">  <!-- margin-left 다이브위치조정 함수 -->
                           <div class="dropdown-inner">
                              <ul>
                                 <li><a href="mypage.jsp">My Page</li>
                                 <li><a href="index.jsp">LogOut</li> <!-- 세션 초기화 -->
                              </ul>
                           </div>
                        </div>
                     </li> 
                        
                     <!--else (아이디 = null) 로그인 출력 -->
                  <!-- <li><a href="login.jsp">Login&Sign Up</a></li> -->
                  </ul>
               </div>
            </div>
         </nav>
         <!--  image slide -->
         
         <!--  원본 이미지
         <div class="hero-background">
            Static Header
            <div class="header-text">
               <div class="header-text-inner">
                  <h1>Be Creative</h1>
               </div>
            </div>/header-text
         </div>
          -->
          
   <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
       <div class="carousel-inner">
          <div class="carousel-item active">
              <img class="d-block w-100" src="resources/images/1.jpg" alt="첫번째 슬라이드">
            </div>
          <div class="carousel-item">
             <img class="d-block w-100" src="resources/images/2.jpg" alt="두번째 슬라이드">
            </div>
            <div class="carousel-item">
               <img class="d-block w-100" src="resources/images/3.jpg" alt="세번째 슬라이드">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">이전</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">다음</span>
        </a>
   </div>
          
         <!--  /image slide -->
         
         
      </div>
   </header>
   <!-- /Section: intro -->
   
   
   <!--////////////////////////////////////Footer-->
   <footer id="footer">
      <div class="container">
         <div class="wrap-footer">
            <ul class="list-inline footer-link link">
               <li><a href="#">승필</a></li>
               <li><a href="#">서진</a></li>
               <li><a href="#">세영</a></li>
               <li><a href="#">현석</a></li>
               <li><a href="#">바울</a></li>
            </ul>
            <div class="copyright">
               <span>Copyright © 20xx - Designed by <a href="https://www.Zerotheme.com" target="_blank">Zerotheme</a></span>
            </div>
         </div> 
      </div>
   </footer>
   <!-- Footer -->
   <div id="page-top"><a href="#page-top" class="btn btn-toTop"><i class="fa fa-angle-double-up"></i></a></div>
   
   <!-- JQuery -->
    <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="resources/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="resources/js/mdb.min.js"></script>
   
   <!-- Definity JS -->
   <script type="text/javascript" src="resources/js/main.js"></script>
   
</div>
</body>
</html>                        
         