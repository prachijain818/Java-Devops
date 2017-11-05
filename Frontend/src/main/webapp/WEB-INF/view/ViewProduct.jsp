<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <jsp:include page="Header.jsp"></jsp:include>
<html>
<%@ page isELIgnored="false" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.car{
padding-top: 50px;
	padding-bottom:100px;
	}</style>
</head>

<body>
<div class="car">
<h1>Product List</h1>  
<table border="2" width="70%" cellpadding="2">  
<tr>
<th>ProductId</th>
<th>ProductName</th>


<th>Description</th>
<th>Price</th>
<th>Image</th>
<th colspan="2">Action</th>
</tr>  
   <c:forEach var="pro" items="${list}">
   <tr>  
   <td>${pro.productid}</td>
   <td>${pro.productname}</td>  
  
 
    <td>${pro.description}</td> 
     <td>${pro.price}</td>
     <td><img src="${pageContext.request.contextPath}/resources/image/${pro.productid}.png" height="50px"
      width="50px"></td>
         
   <td><a href="editP/${pro.productid}">Edit</a></td>  
   <td><a href="deleteP/${pro.productid}">Delete</a></td>  
   </tr>
   </c:forEach>  
   </table>  
   <br/>
   <a href="addP">Add New Product</a>
</div>
</body>
 <jsp:include page="footer.jsp"></jsp:include>
</html>