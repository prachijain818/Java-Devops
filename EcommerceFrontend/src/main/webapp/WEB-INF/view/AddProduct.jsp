<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<%@ page isELIgnored="false"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <style>
 .pro{
 padding-top:100px}
 </style>
</head>

<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="pro">
	<div class="container">
		<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" href="#category">Category</a></li>
			<li><a data-toggle="pill" href="#supplier">Supplier</a></li>
			<li><a data-toggle="pill" href="#product">Product</a></li>
			
			<li class="dropdown"><a href="#" data-toggle="dropdown"> ViewLists<span class="caret"></span></a>
					<ul class="dropdown-menu" >
						<li><a href="viewCat"> CategoryList</a></li>
						<li><a href="viewSup"> SupplierList</a></li>
						<li><a href="viewP"> ProductList</a></li>
					</ul></li>
			
			
		</ul>

		<div class="tab-content">
			<div class="col-md-6">
				<div id="category" class="tab-pane fade in active">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Category</div>
						</div>

						<div style="padding-top: 30px" class="panel-body">
							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>

							<form:form action="${pageContext.request.contextPath}/admin/newCat " method="post" modelAttribute="cat">
								<table>
									<tr>
										<td><form:label path="categoryname">Category Name</form:label></td>
										<td><form:input path="categoryname" /></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="click" /></td>
									</tr>
								</table>
							</form:form>

						</div>
					</div>
				</div>



				<div id="supplier" class="tab-pane fade">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Supplier</div>
						</div>

						<div style="padding-top: 30px" class="panel-body">
							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>

							<form:form action="${pageContext.request.contextPath}/admin/newSup" method="post" modelAttribute="sup">
								<table>
									<tr>
										<td><form:label path="suppliername">Supplier Name</form:label></td>
										<td><form:input path="suppliername" /></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="click" /></td>
									</tr>
								</table>
							</form:form>
						</div>
					</div>
				</div>



				<div id="product" class="tab-pane fade">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Product</div>
						</div>

						<div style="padding-top: 30px" class="panel-body">
							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>

							<form:form action="${pageContext.request.contextPath}/admin/newPro " method="post" modelAttribute="pro"
								enctype="multipart/form-data">
								<table>
									<tr>
										<td><form:label path="productname">Product Name</form:label></td>
										<td><form:input path="productname" /></td>
							<tr>
									
										<%-- <form:select path="categoryname">
											<form:option value="NONE ">Category</form:option>

											<c:forEach var="cat" items="${clist}">
							    <form:options value="${cat.categoryid}">${cat.categoryname} </form:options> 
											</c:forEach>
                                          </form:select>  --%>



										<td><select name="categoryId" id="proCat">
 									<option selected="selected" hidden="hidden" value="0">--Select Category--</option>
 												<c:forEach var="cat" items="${clist}">
													<option value="${cat.categoryid}">${cat.categoryname}
													</option>
												</c:forEach>
										</select></td>
									</tr>
									
									
									<tr>
									<td><select name="supplierId" id="proSup">
 									<option selected="selected" hidden="hidden" value="0">--Select Supplier--</option>
 												<c:forEach var="sup" items="${slist}">
													<option value="${sup.supplierid}">${sup.suppliername}
													</option>
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
										<td><form:label path="image">Select an image:</form:label></td>
										<td><form:input type="file" id="image" path="image" /></td>
									</tr>

									<!-- <tr>
                <td>   <input type="file" name="fileToUpload" id="fileToUpload" onchange="fileSelected();"/>
    <div id="fileName"></div>
    <div id="fileSize"></div>
    <div id="fileType"></div>
    <div class="row">
      <input type="button" onclick="uploadFile()" value="Upload" />
    </div>
    <div id="progressNumber"></div> </td>
                                   </tr> -->


									<tr>
										<td colspan="2"><input type="submit" value="click" /></td>
									</tr>
								</table>
							</form:form>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>


</div>

</body>
</html>