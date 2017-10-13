<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<jsp:include page="Header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

<div class="container">
<div class="row">
          <div style="margin-top:50px;" class="col-md-6 col-md-offset-3">
<%--  <form:form action="<c:url value='newUser'/>" method="post" modelAttribute="cmd"> --%> 


<form:form action="newUser" method="post" modelAttribute="cmd"> 
<legend>Sign Up</legend>
<div class="row">
       <div class="col-xs-6 col-md-6">
                 <form:label path="firstname"></form:label>
                 <form:input path="firstname" placeholder="First Name"/> 
                 <form:errors path="firstname" cssStyle="color:#ff0000;"></form:errors></div>
       <div class="col-xs-6 col-md-6">
                   <form:label path="lastname"></form:label>
                   <form:input path="lastname" placeholder="Last Name"/>  
                    <form:errors path="lastname" cssStyle="color:#ff0000;"></form:errors> </div>
 </div>
   <div style="margin-top:10px;">
    <form:label path="email"></form:label>
    <form:input path="email" placeholder="Email"/> 
     <form:errors path="email" cssStyle="color:#ff0000;"></form:errors></div>
  
   <div style="margin-top:10px;">
    <form:label path="password"></form:label>
    <form:input path="password" placeholder="Password"/> 
     <form:errors path="password" cssStyle="color:#ff0000;"></form:errors></div>
  
   <div style="margin-top:10px;">
    <form:label path="address"></form:label>
    <form:input path="address" placeholder="Address"/>
     <form:errors path="address" cssStyle="color:#ff0000;"></form:errors> </div>
  
   <div style="margin-top:10px;">
    <form:label path="phoneno"></form:label>
    <form:input path="phoneno" placeholder="Phone Number"/>
     <form:errors path="phoneno" cssStyle="color:#ff0000;"></form:errors> </div>
    
     <div style="margin-top:10px;">
  	<button class="btn btn-lg btn-success btn-block signup-btn" type="submit">Create My Account </button> </div>
  	
</form:form>
</div>
</div>
</div>
</body>
</html>