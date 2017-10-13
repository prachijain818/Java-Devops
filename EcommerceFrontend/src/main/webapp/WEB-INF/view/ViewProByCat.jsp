<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ page isELIgnored="false" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h1>Product List</h1>  
   <c:forEach var="pro" items="${prolist}">
   <tr>  
  

     <td><a href="${pageContext.request.contextPath}/prodetails/${pro.productid}">
      <img src="${pageContext.request.contextPath}/resources/image/${pro.productid}.png" height="250px"
      width="250px"> </a> </td>
          
   </tr>
   </c:forEach>  
     


</body>
</html>