<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<html>
<%@ page isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only"> Toggle navigation</span> <span
				class="icon-bar"> </span> <span class="icon-bar"> </span> <span
				class="icon-bar"> </span>
		</button>

		<a class="navbar-brand" href="${pageContext.request.contextPath}/index"> <b style="text-shadow: 1px 2px red;"> Chthonic Ceramics </b></a>

		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				
				
			
				
				<security:authorize access="hasAuthority('ADMIN')">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="/#/"><span
					class="glyphicon glyphicon-user"></span> ADMIN<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><%-- <a href="${contextRoot}/admin/addP"><span
							class="glyphicon glyphicon-list"></span>Product Management</a> --%>
							<a href="${pageContext.request.contextPath}/admin/addP "> Admin</a></li>
							<li><a href="<c:url value="/logout"/>">  Logout</a></li>
							
				</ul></li>
				</security:authorize>
				
		
		
		<li>
	
		 <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h4 style="color:white">Hi  :${pageContext.request.remoteUser}</h4> 
            <li><a href="<c:url value="/logout"/>">  Logout</a></li>
            
        </c:if>
      
</li>
		
		 
		
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> Category <span class="caret"></span></a>
					<ul class="dropdown-menu">		
							<li><c:forEach var="cat" items="${catlist}">
		<li value="${cat.categoryid}">	<a href="${pageContext.request.contextPath}/viewCatPro/${cat.categoryid}">${cat.categoryname}</a></li>
							</c:forEach></li>
					
					</ul></li>
			
				

			</ul>


			<ul class="nav navbar-nav navbar-right">
			<li><a href="${pageContext.request.contextPath}/cart"> <span class="glyphicon glyphicon-shopping-cart"></span>
						Your Cart </a></li>
						<c:if test="${pageContext.request.userPrincipal.name == null}">
				<li><a href="${pageContext.request.contextPath}/addU"> <span class="glyphicon glyphicon-user"></span>
						SignUp </a></li>
				<li><a href="${pageContext.request.contextPath}/login" > <span class="glyphicon glyphicon-log-in"></span>
				        Login</a></li>
				        </c:if>
			</ul>
		</div>
	</div>
	</nav>

</body>
</html>