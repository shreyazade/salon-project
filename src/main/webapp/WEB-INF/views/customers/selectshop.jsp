<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>




<!DOCTYPE html>
<html lang="en">
<head>
  <title>Connect To Organic Salon</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<style>
body{
   background-image:url("/image/About.jpg"); 
}</style>
<body>

<nav class="navbar navbar-dark bg-success">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Connect To Organic Salon</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
     
    </ul>
    <ul class="nav navbar-nav navbar-right">
           <li><a href="<spring:url value='/user/login'/>">Log Out</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">

<sf:form method="post" action="selectservices">
<caption><h2>Select Shop from ${sessionScope.shop_locations} and from respective areas</h2></caption>
<div >
		<caption><h2>Shops List</h2></caption>
		
		<div class="container">
				<table border="1" class="table table-striped table-bordered">
	
		<tr>
			<th>Shop Name</th><th>Owner Name</th><th>location</th><th>area</th><th>address</th><th>Shop Status</th><th>Select</th>
		</tr>
	
		<c:forEach var="s" items="${requestScope.shops_list}">
			<tr>
				<td>${s.shopName}</td>
				<td>${s.ownerName}</td>
				<td>${s.locations}</td>
				<td>${s.areas}</td>
				<td>${s.addresses}</td>
				<td>${s.status}</td>
				<td><input type="radio" value="${s.shopId}" name="shopId"></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<%--
	
	<select name="shop">
	<c:forEach var="s" items="${requestScope.shops_list}">
		<option value="${s.shopId}">${s.shopName}</option>
	</c:forEach>
	</select>
	
	--%>
		<input type="submit" class="btn btn-success" value="submit">
	</div>

	</sf:form>
 
</div>

</body>
</html>
