<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<%@page import="com.helpers.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
 integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   <link rel="stylesheet" href="CSS/owl.carousel.css">
    <link rel="stylesheet" href="CSS/owl.theme.green.css">
    <link rel="Stylesheet" href="CSS/Style.css">
    <script src="JS/jquery.min.js"></script>
      <script src="JS/owl.carousel.min.js"></script>
<title> MemberShip </title>
</head>
<body>

<div class="main">
  <div class="container-fluid p-5">
          <div class="row">
          <div class="owl-carousel owl-theme">
<%
Connection con= ConnectionProvider.getConnection();

//out.println(con);

Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from membership");  
while(rs.next()) 
{
%>
<div class="item" id="items">
       <div class="col-lg-3 col-md-3 col-sm-12">
        <div class="card mt-2" style="width: 18rem; height:22rem">
        <div class="card-header">
        <h4 class="my-2 font-weight-normal text-center "><%=rs.getString("Plan_Month") %> Months</h4>
      </div>
      
          <!-- <img src="Posters/<?php echo$row['Sub_Poster']?>"width="12rem" height="25rem"class="card-img-top" alt="<?php echo$row['Sub_Poster']?>"> -->
             <div class="card-body">
                 <p class="card-text"><Strong>Type : </strong><%=rs.getString("Plan_Title") %></p>
                <p class="card-text"><Strong> Description : </strong><br><%=rs.getString("Plan_Desc") %></p>
                <h4 class="card-text text-center mt-6"><span id=spanrupee> &#8377 </span><Strong><%=rs.getInt("Plan_Amount") %>/-</strong></h4>
                 <a href="checkouts.jsp?v=<%=rs.getString("Plans_Id") %>" class="btn btn-lg btn-block btn-primary"><i class="fa fa-download"></i>Get Started</a>
              
              </div>
              </div> <!--card div -->
         </div>
  </div>
<%
}
%>
</div>
</div>
</div>
</div>

<script type="text/javascript">
   $(document).ready(function(){
            $('.owl-carousel').owlCarousel({
    loop:false,
    margin:50,
    dots:false,
    nav:false,
    stagePadding:10,
    autoplay:false,
     autoplayTimeout :1000,
    responsive:{
        0:{
            margin:-200,
            items:1

            
        },
        600:{
          margin:-25,
            items:3
           
        },
        1000:{
          margin:250,
            items:4
        }
    }
})

  });

</script>
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

  </body>
</html>