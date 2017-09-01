<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <style>
    *{
      margin: 0;
      padding: 0;
      outline: none;
      border: none;
        box-sizing: border-box;
    }
    *:before,
    *:after{
    	box-sizing: border-box;
    }
    html,
    body{
    	min-height: 100%;
    }

    .container1{
    	margin: 8% auto;
    	width: 210px;
    	height: 140px;
    	position: relative;
    	perspective: 1000px;
    }
    #carousel{
    	width: 100%;
    	height: 100%;
    	position: absolute;
    	transform-style: preserve-3d;
    	animation: rotation 20s infinite linear;
    }
    #carousel:hover{
    	animation-play-state: paused;
    }
    #carousel figure{
    	display: block;
    	position: absolute;
    	width: 90%;
    	height: 50%px;
    	left: 10px;
    	top: 10px;
    	background: black;
    	overflow: hidden;
    	border: solid 5px black;
    }
    #carousel figure:nth-child(1){transform: rotateY(0deg) translateZ(288px);}
    #carousel figure:nth-child(2) { transform: rotateY(40deg) translateZ(288px);}
    #carousel figure:nth-child(3) { transform: rotateY(80deg) translateZ(288px);}
    #carousel figure:nth-child(4) { transform: rotateY(120deg) translateZ(288px);}
    #carousel figure:nth-child(5) { transform: rotateY(160deg) translateZ(288px);}
    #carousel figure:nth-child(6) { transform: rotateY(200deg) translateZ(288px);}
    #carousel figure:nth-child(7) { transform: rotateY(240deg) translateZ(288px);}
    #carousel figure:nth-child(8) { transform: rotateY(280deg) translateZ(288px);}
    #carousel figure:nth-child(9) { transform: rotateY(320deg) translateZ(288px);}

    img{
    	-webkit-filter: grayscale(1);
    	cursor: pointer;
    	transition: all .5s ease;
    }
    img:hover{
    	-webkit-filter: grayscale(0);
      transform: scale(1.2,1.2);
    }

    @keyframes rotation{
    	from{
    		transform: rotateY(0deg);
    	}
    	to{
    		transform: rotateY(360deg);
    	}
    }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>
    <script src="resources/js/bootstrap.min.js">
    </script>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.css" rel="stylesheet">
    
    

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/customstylesheet.css">
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
   <div class="container">
   <button type="button" class="navbar-toggle"
   data-toggle="collapse"
   data-target=".navbar-collapse">
   <span class="sr-only"> Toggle navigation</span>
   <span class="icon-bar"> </span>
   <span class="icon-bar"> </span>
   <span class="icon-bar"> </span>
   </button>

    <a class="navbar-brand" href="#"> Bathing accessories</a>

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
 			    <li class="dropdown">
 			       <a href="#" class="dropdown-toggle"
 				    data-toggle="dropdown"> Faucets
 					<b class="caret"> </b></a>
 					 <ul class="dropdown-menu">
 					   <li><a href="#"> Continental</a> </li>
 					   <li><a href="#"> Sensor Taps</a> </li>
 					   <li><a href="#"> Soft Touch</a> </li>
               <li><a href="#"> Clarion</a> </li>
                <li><a href="#"> Fusion</a> </li>
                 <li><a href="#"> Solo</a> </li>
 					 </ul>
 			   </li>
         <li class="dropdown">
            <a href="#" class="dropdown-toggle"
           data-toggle="dropdown"> Showers
         <b class="caret"> </b></a>
          <ul class="dropdown-menu">
            <li><a href="#"> Body Showers</a> </li>
            <li><a href="#"> Air Showers</a> </li>
            <li><a href="#"> Rain Showers</a> </li>
            <li><a href="#"> Multi Function Showers</a> </li>
              <li><a href="#"> Hand Showers</a> </li>
                <li><a href="#"> Hydrolite Showers</a> </li>
          </ul>
        </li>
        <li class="dropdown">
           <a href="#" class="dropdown-toggle"
          data-toggle="dropdown"> Other Products<span class="caret"></span></a>
         <ul class="dropdown-menu">
           <li><a href="#"> Sanitaryware</a> </li>
           <li><a href="#"> Water Heaters</a> </li>
           <li><a href="#"> Bathtubs</a> </li>
           <li><a href="#"> Spas</a> </li>
             <li><a href="#"> Saunas</a> </li>
               <li><a href="#"> Whirlpools</a> </li>
         </ul>
       </li>

       <li><a href="admin.html"> Admin</a></li>

       </ul>


        <ul class="nav navbar-nav navbar-right">
             <li> <a href="SignUp.html">
                <span class="glyphicon glyphicon-user"></span> SignUp</a></li>
            <li> <a href="LogIn.html">
                 <span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
     </div>
</div>
</nav>


<div class="container1">
    	<div id="carousel">
			<figure><img src="resources/images\Insta-image.jpg" alt="" width="200px" height="300px"></figure>
      <figure><img src="resources/images\Insta-image-1.jpg" alt="" height="300px"></figure>
    	<figure><img src="resources/images\Insta-image-2.jpg" alt="" height="300px"></figure>
    	<figure><img src="resources/images\Insta-image-3.jpg" alt="" height="300px"></figure>
      <figure><img src="resources/images\Insta-image-4.jpg" alt="" height="300px"></figure>
      <figure><img src="resources/images\Insta-image-5.jpg" alt="" height="300px"></figure>
      <figure><img src="resources/images\Insta-image-6.jpg" alt="" height="300px"></figure>
      <figure><img src="resources/images\Insta-image-7.jpg" alt="" height="300px"></figure>

		</div>
	</div>





<div class="navbar  navbar-inverse navbar-fixed-bottom">
     <div class="container">
       <div class="navbar-text navbar-right">
     <a href="https://www.facebook.com"> <i class="fa fa-facebook-square" style="font-size:48px;"></i></a>
		<a  href="https://twitter.com"> <i class="fa fa-twitter-square" style="font-size:48px;"></i></a>
		<a  href="https://www.youtube.com"> <i class="fa fa-youtube-square" style="font-size:48px;"></i> </a>

  </div>
	 </div>
   </div>


  </body>
</html>
