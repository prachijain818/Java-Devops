<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page isELIgnored="false" %>
<jsp:include page="Header.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class='container'>
    <div class='row' style='padding-top:50px; padding-bottom:50px;'>
        <div class='col-md-12'>
            <div id='mainContentWrapper'>
                <div class="col-md-8 col-md-offset-2">
                    <h2 style="text-align: center;">
                        Review Your Order & Complete Checkout
                    </h2>
                    <hr/>
               
                    <div class="shopping_cart">
                       <!--  user infoo starts here -->                            
                        <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                            <b>User Information</b>
                                        </a>
                                    </h4>
                                </div>
                              
                                 <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                         <div class="form-group">
                                         <label class="col-md-4 control-label" for="textinput">User Name:</label> ${us.firstname} 
                                         </div>
                                          <div class="form-group">
                                         <label class="col-md-4 control-label" for="textinput">Phone no. :</label> ${us.phoneno} 
                                         </div>
                                         <div class="form-group">
                                         <label class="col-md-4 control-label" for="textinput">Address :</label> ${us.address} 
                                         </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                            <!-- order summary starts here -->
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information »</a>
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            
                             <div class="panel-group" id="accordion">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Review
                                                Your Order</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="items">
                                                <div class="col-md-9">
                                                    <table class="table table-striped">
                          
                          
                                                     <tr>
                         
      <c:set var="calc" value="0"></c:set> 
     <c:forEach var="c" items="${cartli}">    
     <c:set var="calc" value="${calc+c.totalItems*c.price}"></c:set>
     </c:forEach>  
      <c:forEach var="c" items="${cartli}">
	<div class="row">

						<tr>
							<td data-th="Product">


								<div class="col-sm-2 ">
									<img
										src="${pageContext.request.contextPath}/resources/image/${c.proid}.png" height="100px" width="100px"  />
								</div>
								<div class="col-sm-10">
									<b>&nbsp &nbsp &nbsp  &nbsp  &nbsp &nbsp &nbsp  &nbsp  &nbsp ${c.cartproductname}</b>
									
								</div>

							</td>
							<td data-th="Price">${c.price}</td>
							<td data-th="Quantity">${c.totalItems}</td>
							<td data-th="Subtotal" class="text-center">${c.totalItems*c.price}</td>
						</tr>

					</div>
				</c:forEach>            </tr>
                                                        
                                                    </table>
                                                </div>
                                                <div class="col-md-3">
                                                    <div style="text-align: center;">
                                                        <h3>Order Total</h3>
                                                        <h3><span style="color:blue;"> Rs. ${calc}</span></h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            
                           
                          
                           
                            <!--  payment infoo starts here -->
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information »</a>
                                        </div>
                                    </h4>
                                </div>
                            </div>
                           <form   action="${pageContext.request.contextPath}/invoice" method="post">                            
                           <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                        <fieldset>
                                            <legend>What method would you like to pay with today?</legend>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="card-holder-name">Payment Type</label>
                                                <div class="col-sm-9">
                                                <select name="paymentType" id="paymentType" required>
                                                <option label="--Select--" />  
                                                <option value="NetBanking">Net Banking</option>
                                                <option value="DeditCard">Debit Card</option>
                                                <option value="CreditCard">Credit Card</option>
                                                  </select>
                                                 
                                                </div>
                                            </div>
                                           <input type="hidden" name="total" value="${calc}">
                                               
                                                <div class="form-group">
                                                    <div class="col-sm-offset-3 col-sm-9">
                                                    </div>
                                                </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-success " style="width:100%;">Pay
                                            Now
                                        </button>
                                        <br/>
                                       
                                    </div>
                                </div>
                            </div>
                            </form>
                           
                    </div>
                </div>
                
            </div>
        </div>
    </div>

</div>


</body>
 <jsp:include page="footer.jsp"></jsp:include>
</html>



































































































































<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<style>
.cart {
	padding-top: 100px
}
</style>

<body>

<div class="cart">

<h2>${us.address}</h2>
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
							<c:forEach var="cart" items="${cartli}">
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
										href="${pageContext.request.contextPath}/deleteItems/${cart.cartid}">
											<span class="glyphicon glyphicon-remove"></span>
									</a></td>

									<!-- <td>
										<button type="button" class="btn btn-danger">
											<span class="glyphicon glyphicon-remove"></span> Remove
										</button>
									</td> -->
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
									href="${pageContext.request.contextPath}/CheckOut" 
									class="btn btn-success btn-block">Checkout <i
										class="fa fa-angle-right"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>


<form action="${pageContext.request.contextPath}/invoice" method="post">                            
                           <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                        <fieldset>
                                            <legend>What method would you like to pay with today?</legend>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="card-holder-name">Payment Type</label>
                                                <div class="col-sm-9">
                                                <select name="paymentType" id="paymentType">
                                                <option label="--Select--" /> 
                                                  
                                                <option value="CreditCard">Credit Card</option>
                                                <option value="DeditCard">Debit Card</option>
                                                
                                                  </select>
                                                 
                                                </div>
                                            </div>
                                           <input type="hidden" name="total" value="${calc}">
                                               
                                                <div class="form-group">
                                                    <div class="col-sm-offset-3 col-sm-9">
                                                    </div>
                                                </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-success btn-lg" style="width:100%;">Pay
                                            Now
                                        </button>
                                        <br/>
                                       
                                    </div>
                                </div>
                            </div>
                            </form>
              



<!-- <div class="container">
    <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#CardPayment">Credit/Debit Card</a></li>
    <li><a data-toggle="pill" href="#NetBanking">Net Banking</a></li>
  </ul>

  <div class="tab-content">

    <div id="CardPayment" class="tab-pane fade in active">


      <div class="container">
          <div class="row">

              <div class="col-xs-12 col-md-4">
                  <div class="panel panel-default credit-card-box">
                      <div class="panel-heading display-table" >
                          <div class="row display-tr" >
                              <h3 class="panel-title display-td" >Payment Details</h3>
                              <div class="display-td" >
                                  <img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
                              </div>
                          </div>
                      </div>
                      <div class="panel-body">
                          <form role="form" id="payment-form" method="POST" action="javascript:void(0);">
                              <div class="row">
                                  <div class="col-xs-12">
                                      <div class="form-group">
                                          <label for="cardNumber">CARD NUMBER</label>
                                          <div class="input-group">
                                              <input
                                                  type="tel"
                                                  class="form-control"
                                                  name="cardNumber"
                                                  placeholder="Valid Card Number"
                                                  autocomplete="cc-number"
                                                  required autofocus
                                              />
                                              <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-xs-7 col-md-7">
                                      <div class="form-group">
                                          <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                          <input
                                              type="tel"
                                              class="form-control"
                                              name="cardExpiry"
                                              placeholder="MM / YY"
                                              autocomplete="cc-exp"
                                              required
                                          />
                                      </div>
                                  </div>
                                  <div class="col-xs-5 col-md-5 pull-right">
                                      <div class="form-group">
                                          <label for="cardCVC">CV CODE</label>
                                          <input
                                              type="tel"
                                              class="form-control"
                                              name="cardCVC"
                                              placeholder="CVC"
                                              autocomplete="cc-csc"
                                              required
                                          />
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-xs-12">
                                      <div class="form-group">
                                          <label for="couponCode">COUPON CODE</label>
                                          <input type="text" class="form-control" name="couponCode" />
                                      </div>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-xs-12">
                                      <button class="subscribe btn btn-success btn-lg btn-block" type="button">Start Subscription</button>
                                  </div>
                              </div>
                              <div class="row" style="display:none;">
                                  <div class="col-xs-12">
                                      <p class="payment-errors"></p>
                                  </div>
                              </div>
                          </form>
                      </div>
                  </div>
              </div>
                  </div>
                      </div>
                          </div>


    <div id="NetBanking" class="tab-pane fade">

        <ul><img src="resources/image/sbi.jpg" alt="" width="35px" height="35px" > <input type="radio" name="bank"> SBI </ul>
      <ul><img src="resources/image/pnb.jpg" alt="" width="35px" height="35px" >  <input type="radio" name="bank"> PNB </ul>
      <ul><img src="resources/image/hdfc.jpg" alt="" width="35px" height="35px" > <input type="radio" name="bank"> HDFC </ul>
      <ul><img src="resources/image/icici.jpg" alt="" width="35px" height="35px" >  <input type="radio" name="bank"> ICICI </ul>

        </div>
  </div>
</div>
 -->

</div>
</body>
</html> --%>