<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<jsp:include page="Header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
.cart {
	padding-top: 100px
}
</style>
</head>


<body>

	<div class="cart">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-10 col-md-offset-1">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart" items="${cartinfo}">
								<tr>
									<td> <div class="col-sm-2 "> <img
										src="${pageContext.request.contextPath}/resources/image/${cart.proid}.png"
										height="100px" width="100px" /> </div>
							                    
							                    
							             <div class="col-sm-10">
							             <h3>${cart.cartproductname}</h3>
									<p>${cart.cartproductdesc}</p>
								</div>
							           		<a href="#">Product name</a>
											<span>Status: </span><span class="text-success"><strong>In
													Stock</strong></span>
										</td>

									<td data-th="Quantity">${cart.totalItems}</td>
									<td data-th="Price">${cart.price}</td>
									<td data-th="Subtotal" class="text-center">${cart.finalAmount}</td>
									<td class="text-center"><a class='btn btn-info btn-xs'
										href="${pageContext.request.contextPath}/deleteCart/${cart.cartid}">
											<span class="glyphicon glyphicon-remove"></span>
									</a></td>

									<td>
										<button type="button" class="btn btn-danger">
											<span class="glyphicon glyphicon-remove"></span> Remove
										</button>
									</td>
								</tr>
						
							</c:forEach>
						</tbody>
						
						<tfoot>
								<tr>
								<td><a href="${pageContext.request.contextPath}/"
									class="btn btn-warning"><i class=""></i> Continue Shopping</a></td>
								<td colspan="2" class="hidden-xs"></td>
								<td class="hidden-xs text-center"><strong>${cart.grandAmount}</strong></td>
								<td><a
									href="${pageContext.request.contextPath}/CheckOut/${product.productid}"
									class="btn btn-success btn-block">Checkout <i
										class="fa fa-angle-right"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>
</html>