<html>
<jsp:include page="Header.jsp"></jsp:include>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page isELIgnored="false" %>
<head>
<style>
.con{
padding-bottom:100px;
}


</style>
</head>
<body>
 <div class="con">
<div class="container">
 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->

    <div class="carousel-inner">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/image/Insta-image-1.jpg" alt="Los Angeles" style="width:100%; height:450px">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/image/Insta-image-4.jpg" alt="Chicago" style="width:100%; height:450px">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/image/Insta-image-6.jpg" alt="New york" style="width:100%; height:450px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

<br><br>



 <c:forEach var="pro" items="${productlist}">
  <div class="col-sm-4"> 

     <a href="${pageContext.request.contextPath}/prodetails/${pro.productid}">
      <img src="${pageContext.request.contextPath}/resources/image/${pro.productid}.png" height="250px"
      width="250px"> </a> 			
        				<h4> ${pro.productname}     </h4> 				
        	
         </div>
   
   </c:forEach>  
    

</div>
 </div>
</body>
 <jsp:include page="footer.jsp"></jsp:include>

</html>
