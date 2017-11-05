<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
 .pro{
 padding-top:80px;
 padding-bottom:100px;}
 </style>
</head>
<jsp:include page="Header.jsp"></jsp:include>

<body>
<div class="pro">
<div class="container">

<div class=" panel panel-heading">
        <center> <h4 class="panel-title">Invoice</h4> </center>
    </div>
     
  <div class="row clearfix">
    <div class="col-md-12">
      <table class="table table-bordered table-hover" id="tab_logic">
        <thead>
          <tr>
            <th class="text-center"> Product </th>
            <th class="text-center"> Quantity </th>
            <th class="text-center"> Price </th>
            <th class="text-center"> SubTotal </th>
              <!-- <th class="text-center"> Grand Total </th> -->
          </tr>
        </thead>
        <tbody>
          
          <c:forEach var="c" items="${cart}">
          <tr>
           <td> ${c.cartproductname}</td>
            <td> ${c.totalItems}</td>
             <td> ${c.price}</td>
              <td> ${c.totalItems*c.price} </td>
               <%-- <td> ${tabl.totalamount}</td> --%>
               </tr>
          </c:forEach>
          
        </tbody>
      </table>
    </div>
  </div>

<br><br>
   <div class="col-md-6 col-md-offset-3">
    <div class="panel-body">
     <form   action="${pageContext.request.contextPath}/Thankyou" method="post">                            
     <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">User Name:</label> ${use.firstname} 
          </div>
           <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Phone no. :</label> ${use.phoneno} 
          </div>
          <div class="form-group">
          <label class="col-md-4 control-label" for="textinput">Address :</label> ${use.address} 
          
         </div>
         <div class="form-group">
         <label class="col-md-4 control-label" for="textinput">Grand Total :</label> ${tabl.totalamount} 
         </div>
         
          <button type="submit" class="btn btn-success btn-lg" style="width:100%;"> Confirm                                        
          </button>
          <br/>
          </form>
          </div>
          </div>
           </div> 
           </div>
                             
</body>
 <jsp:include page="footer.jsp"></jsp:include>
</html>