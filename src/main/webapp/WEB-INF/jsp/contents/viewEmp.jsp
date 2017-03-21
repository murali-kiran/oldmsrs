<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<title>YMC INDIA</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/app.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/msrs/css/style_new.css" />
<body>
	
<div class="msrs-content">
  <!-- Services -->
  <div class="ymc-container" id="services" style="margin-top:5px">
    <h1 class="ymc-xxxlarge ymc-text-red"><b>View Client</b></h1>
<table>
	<tr><td>EmpID : </td><td><c:out value="${ emp.empid}"/></td></tr>
	<tr><td>First Name : </td><td><c:out value="${ emp.firstname}"/></td></tr>
	<tr><td>Last Name : </td><td><c:out value="${ emp.lastname}"/></td></tr>
	<tr><td>DOB : </td><td><c:out value="${ emp.dob}"/></td></tr>
	<tr><td>DOJ : </td><td><c:out value="${ emp.doj}"/></td></tr>
	<tr><td>DOR : </td><td><c:out value="${ emp.dor}"/></td></tr>
	<tr><td>PHONE: </td><td><c:out value="${ emp.phone}"/></td></tr>
</table>

<h1>Appointment Details</h1>
<table>
	<tr><td><c:out value="${ emp.firstname}"/></td> <td><c:out value="${ emp.phone}"/></td></tr>
</table>	
</div></div>
</body>

</html>