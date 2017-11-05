<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <jsp:include page="Header.jsp"></jsp:include>
 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ page isELIgnored="false" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>

<style>
.cart {
	padding-top: 150px;
	padding-bottom: 500px;
}
</style>
</head>

<body>

<div class="cart">
   <c:forEach var="pro" items="${prolist}">
   
  <div class="col-sm-3"> 

     <a href="${pageContext.request.contextPath}/prodetails/${pro.productid}">
      <img src="${pageContext.request.contextPath}/resources/image/${pro.productid}.png" height="250px"
      width="250px"> </a> 		
        				<h4> ${pro.productname}</h4>
         </div>
   </c:forEach>  
     </div>
</body>
 <jsp:include page="footer.jsp"></jsp:include>
</html>
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    <%--  <div class="container">
	<div class="row">
      
    
        <div class="col-sm-3">
      
        <c:forEach var="product" items="${prolist}">
        	<article class="col-item">
        		
        	
        			 <a href="<c:url value="/productDescription/${product.id}"/>">  
 <img src="${pageContext.request.contextPath}/resources/images/${product.id}.png" height="400px" width="400px" class="img-responsive" alt="Product Image" />  </a>
        		
        		<div class="info">
        			<div class="row">
        				<div class="price-details col-md-6">
        					
        					<h1>${product.productName}</h1>
        					<span class="price-new"> <i class="fa fa-inr"></i>${product.productPrice}</span>
        				</div>
        			</div>
        			
        		</div>
        		
        	</article>
        	</c:forEach>
        	
        </div>
	</div>
</div>

 --%>