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
</head>
<body>
<br> <br> <br>

<h1>Category List</h1>  
<table border="2" width="70%" cellpadding="2">  
<tr>
<th>CategoryName</th>


</tr>  
   <c:forEach var="cat" items="${clist}">
   <tr>  
   <td>${cat.categoryname}</td>
  
    
   
   </tr>
   </c:forEach>  
   </table>  

</body>
</html>