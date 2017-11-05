<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ page isELIgnored="false"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/EcommerceFrontend/admin/editSave" method="POST" modelAttribute="command" enctype="multipart/form-data">
		<table>
			<tr>
				<td><form:hidden path="productid" /></td>
			</tr>
			<tr>
				<td><form:label path="productname">Product Name</form:label></td>
				<td><form:input path="productname" /></td>
			</tr>
			<tr>
				<td><select name="catId" id="proCat">
						<option selected="selected" value="0">--SelectCategory--</option>
						<c:forEach var="cat" items="${calist}">
							<option value="${cat.categoryid}">${cat.categoryname}</option>
						</c:forEach>
				</select></td>
			</tr>
		


			<tr>
				<td><select name="supId" id="proSup">
						<option selected="selected" value="0">--SelectSupplier--</option>
						<c:forEach var="sup" items="${sulist}">
							<option value="${sup.supplierid}">${sup.suppliername}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><form:label path="description">description</form:label></td>
				<td><form:input path="description" /></td>
			</tr>
			<tr>
				<td><form:label path="price">price</form:label></td>
				<td><form:input path="price" /></td>
			</tr>
			<tr>
				<td><form:label path="stock">stock</form:label></td>
				<td><form:input path="stock" /></td>
			</tr>
			<tr>
										<td><form:label path="image">Select an image:</form:label></td>
										<td><form:input type="file" id="image" path="image" /></td>
									</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Edit&Save" /></td>
			</tr>
		</table>
	</form:form>

</body>
 <jsp:include page="footer.jsp"></jsp:include>
</html>