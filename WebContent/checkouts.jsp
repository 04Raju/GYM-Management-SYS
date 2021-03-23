<%@page import="paytm_java.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*,java.sql.*,com.helpers.*" %>
 
 <%! int price,duration;
 	String desc,value;
 %>
 
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
	//out.println(PaytmConstants.MERCHANT_KEY);
	//out.println(parameters);
	
	value = request.getParameter("v");
	
	//out.println(values);
	//out.println(duration);
	Connection con= ConnectionProvider.getConnection();

//out.println(con);

Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from membership where Plans_Id='" + value +"'");  
while(rs.next()) 
{
	
	price=rs.getInt("Plan_Amount");
	duration=rs.getInt("Plan_Month");
	desc= rs.getString("Plan_Desc");
	
	//out.println(price+" "+duration+""+desc);
	
	
}
 %>
 


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check-out page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<div class="container">
<div class="row">
<div class="col-md-6 col-sm-12" >
<%-- cart --%>
<div class="card">
<div class="card-body">

<h3 class="text-center mb-4">Your Orders</h3><hr class="mb-5">

<h5 md-5>Order ID : <lable>ORDS_<%= randomInt %></h5>

<ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">MemberShip Details</h6><br>
                <small class="text-muted">24/7 Gym Support </small><br>
                <small class="text-muted">Duration	  : <%=duration%> Months</small><br>
                <small class="text-muted"><Br>Description :<Br> <%=desc%></small><br>
                <small class="text-muted">Including GST 18%</small><br>
              </div>
              <!--<span class="text-muted">&#8377 1000</span>-->
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <strong><span>Total (RS)</span></strong>
              <strong>&#8377 <%=price%></strong>
            </li>
          </ul>
</div>


</div>

</div>
<div class="col-lg-6 col-md-12 col-sm-12">
<%--billing details --%>
<div class="card">
<div class="card-body">

<h3 class="text-center mb-4">Billing Details</h3><hr class="mb-3 ">
<form method="post" action="pgRedirect.jsp">

<div class="row">
    <div class="col">
    <label for="exampleInputEmail1">First name</label>
     <input type="text"  class="form-control" placeholder="First name" required>
    </div>
    <div class="col">
    <label for="exampleInputEmail1">Last name</label>
      <input type="text"  class="form-control" placeholder="Last name" required>
    </div>
  </div>
<div class="form-group">
    <label for="exampleInputEmail1">phone</label>
    <input type="number" name="MOBILE_NO" size="10" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your phone number" required>
  </div>
 <div class="form-group">
    <label for="exampleInputEmail1">email</label>
    <input type="email" name="EMAIL"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your Email id" required>
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" required>
  </div>
   <div class="form-row">
    <div class="form-group col-md-3">
      <label for="inputZip">Pin-code</label>
      <input type="text" class="form-control" placeholder="500606"id="pincode" required>
    
    </div>
    
    <div class="form-group col-md-4">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" placeholder="City" id="inputCity" required>
    </div>
    <div class="form-group col-md-5">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        
        <option>Andhra Pradesh (AP)</option>
        <option>Arunachal Pradesh (AR)</option>
		<option>Assam (AS)</option>
		<option>Bihar (BR)</option>
		<option>Chhattisgarh (CG)</option>
		<option>Goa (GA)</option>
		<option>Gujarat (GJ)</option>
		<option>Haryana (HR)</option>
		<option>Himachal Pradesh (HP)</option>
		<option>Jammu and Kashmir (JK)</option>
		<option>Jharkhand (JH)</option>
		<option>Karnataka (KA)</option>
		<option>Kerala (KL)</option>
		<option>Madhya Pradesh (MP)</option>
		<option>Maharashtra (MH)</option>
		<option>Manipur (MN)</option>
		<option>Meghalaya (ML)</option>
		<option>Mizoram (MZ)</option>
		<option>Nagaland (NL)</option>
		<option>Odisha(OR)</option>
		<option>Punjab (PB)</option>
		<option>Rajasthan (RJ)</option>
		<option>Sikkim (SK)</option>
		<option>Tamil Nadu (TN)</option>
		<option>Telangana (TS)</option>
		<option>Tripura (TR)</option>
		<option>Uttar Pradesh (UP)</option>
		<option>Uttarakhand (UK)</option>
		<option>West Bengal (WB)</option>
      </select>
    </div>
   
    <input type="hidden" id="ORDER_ID" name="ORDER_ID" value="ORDS_<%= randomInt %>">
     <input type="hidden" id="CUST_ID" name="CUST_ID" value="RTS001">
     <input  type="hidden" id="INDUSTRY_TYPE_ID" name="INDUSTRY_TYPE_ID" value="Retail">
     <input  type="hidden" id="CHANNEL_ID" name="CHANNEL_ID" value="WEB">
     <input type="hidden" id="TXN_AMOUNT" name="TXN_AMOUNT" value=<%=price %>>
    <!--  <input type="hidden" id="months" name="months" value=<%=duration%>>
     <input type="hidden" id="price" name="price" value=<%=price%>> -->
   
   
    
    
    <button type="submit" class="btn btn-primary btn-lg btn-block">Place-Order</button>
    
  </div>
  

</form>
</div>


</div>
</div>
</div>

</div>

<!--  <script type="text/javascript">
function demo(){
	var pincode = document.querySelector("#pincode").value;
	alert("pincode ="+pincode)
	$.ajax((
		type:"GET",
		url : "https://api.postalpincode.in/pincode/"+pincode,
		success : function(response){
			console.log(response);
		}
	));
	
}

</script>-->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>