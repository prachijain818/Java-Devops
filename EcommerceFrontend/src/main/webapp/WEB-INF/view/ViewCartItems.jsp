<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ page isELIgnored="false" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Cart Items</h1>  
<table border="2" width="70%" cellpadding="2">  
<tr>
<th>CartId</th>
<th>CartName</th>
<th colspan="2">Action</th>
</tr>  
   <c:forEach var="ca" items="${list}">
   <tr>  
   <td>${ca.cartid}</td>
   <td>${ca.cartquantity}</td>   
   <td><a href="editItems/${ca.cartid}">Edit</a></td>  
   <td><a href="deleteItems/${ca.cartid}">Delete</a></td>  
   </tr>
   </c:forEach>  
   </table>  
   <br/>
   <a href="InCart">Add In Cart</a>


</body>
</html>