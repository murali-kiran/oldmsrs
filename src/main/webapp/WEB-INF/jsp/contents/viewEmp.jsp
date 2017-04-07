<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<title>YMC INDIA</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/app.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/msrs.js"></script> --%>
<body>
	
<div class="msrs-content">
  <!-- Services -->
  <div class="ymc-container" id="services" style="margin-top:5px">
    <h1 class="ymc-xxxlarge ymc-text-red"><b>View Client</b></h1>
<table>
	<tr><td>ID : </td><td><c:out value="${ emp.empid}"/></td></tr>
	<tr><td>First Name : </td><td><c:out value="${ emp.firstname}"/></td></tr>
	<tr><td>Middle Name : </td><td><c:out value="${ emp.middlename}"/></td></tr>
	<tr><td>Last Name : </td><td><c:out value="${ emp.lastname}"/></td></tr>
	<tr><td>Gender : </td><td><c:out value="${ emp.gender}"/></td></tr>
	<tr><td>Date Of Birthday : </td><td><c:out value="${ emp.dob}"/></td></tr>
	<tr><td>Phone: </td><td><c:out value="${ emp.phone}"/></td></tr>
	<tr><td>Email: </td><td><c:out value="${ emp.email}"/></td></tr>
	<tr><td>Address: </td><td><c:out value="${ emp.adress}"/></td></tr>
</table>

	</div>
	</div>
</body>
</html>