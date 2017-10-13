<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.car
{
padding-top:60px;
}
</style>
</head>
<body>

  <jsp:include page="Header.jsp"></jsp:include>
<div class="car">
  <form action="${pageContext.request.contextPath}/login" method="POST">
  Email Address:<br>
  <input type="text" name="username" >
  <br>
  Password:<br>
  <input type="password" name="password" >
  <br><br>
  <input type="submit" value="Submit">
</form> 

</div>

</body>
</html>