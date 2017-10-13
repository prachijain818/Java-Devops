<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form action="/EcommerceFrontend/editSaveItems" method="POST" modelAttribute="command">
<table>
  <tr>
    <td><form:hidden path="cartid"/></td>
  </tr>
     <tr>
    <td><form:label path="cartquantity">Quantity</form:label></td>
    <td><form:input path="cartquantity"/></td>
  </tr>
   <tr>
  	<td colspan="2"><input type="submit" value="Edit&Save"/></td>
  </tr>
</table>
</form:form>
</body>
</html>