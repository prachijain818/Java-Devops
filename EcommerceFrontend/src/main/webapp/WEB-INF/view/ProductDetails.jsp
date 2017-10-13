<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <jsp:include page="Header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ page isELIgnored="false" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%--  <script src="<c:url value='/resources/js/numeric.js'/>"></script>
 --%>
 <script type="text/javascript">

 </script>
 
 
 <style>
 .det{
 padding-top:90px}
.title-attr{margin-top:0;margin-bottom:0;color:black;}
.btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0;}
.btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0;}
form.section > div {width:100%;display:inline-flex;}
form.section > div > input {margin:0;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
</style>
</head>
<body>


<div class="det">

<form action="${pageContext.request.contextPath}/InCart/${pro.productid}" method="post">

<img src="${pageContext.request.contextPath}/resources/image/${productid}.png" height="300px"
      width="300px">
 
      ${pro.productname}
    ${pro.description} 
     ${pro.price}
     
   <h4> Quantity </h4>
   <div class="section" style="padding-bottom:20px;">
                        <h6 class="title-attr"><small>Select Quantity</small></h6>                    
                        <div>
                        
                            <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                            <input value="1" name="stock" />
                            <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                        </div>
                    </div>           

<input type="submit" value="AddToCart" />

</form>
</div>

<br>
<script type="text/javascript">
$(document).ready(function(){
          
            //-- Click on QUANTITY
            $(".btn-minus").on("click",function(){
                var now = $(".section > div > input").val();
                if ($.isNumeric(now)){
                    if (parseInt(now) -1 > 0){ now--;}
                    $(".section > div > input").val(now);
                }else{
                    $(".section > div > input").val("1");
                }
            })            
            $(".btn-plus").on("click",function(){
                var now = $(".section > div > input").val();
                var limit = ${pro.stock}
                 if ($.isNumeric(now) && now<limit){
                    $(".section > div > input").val(parseInt(now)+1);
                }else{
                	alert("out of stock");
                    $(".section > div > input").val("1");
                }
            })                        
        }) 
</script>
</body>
</html>