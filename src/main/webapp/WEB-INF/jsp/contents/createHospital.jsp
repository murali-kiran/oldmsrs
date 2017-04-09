<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>

<title>MRBGS |Create Hospital</title>
</head>



<body >
<!-- Top menu on small screens -->
<div class="msrs-content">

<h1 class="ymc-xxxlarge ymc-text-red"><b>Create Hospital</b></h1>
<form:form method="post" modelAttribute="hospital" id="createHospitalform" name="createHospitalform"  commandName="hospital"
                           action="${pageContext.servletContext.contextPath}/home/createHospital">
	<c:if test="${hospitalid!=0}">
		<form:hidden path="hospitalid"/>
		<form:hidden path="createdtime"/>
	</c:if>
		<table>
		<tr><td>Name</td><td><form:input  path="name"/></td></tr>
        <tr><td>Hospital Type</td><td> <form:select path="hospitaltypeid" /></td></tr>
        <tr><td>Contact Number 1</td><td> <form:input path="phone1" /></td></tr>
        <tr><td>Contact Number 2</td><td><form:input path="phone2" /></td></tr>
        <tr><td>Fax </td><td><form:input path="faxno"/></td></tr>
        <tr><td>Email</td><td><form:input path="emailid" /></td></tr>
        <tr><td>Working Days</td><td><form:input path="workingdays"/></td></tr>
        <tr><td>Working Hours</td><td><form:input path="workinghours" /></td></tr>
        <tr><td>Flat no.</td><td><form:input path="addressline1" /></td></tr>
        <tr><td>Street</td><td><form:input path="addressline2" /></td></tr>
        <tr><td>City</td><td><form:input path="city" /></td></tr>
        <tr><td>District</td><td><form:input path="district" /></td></tr>
        <tr><td>state</td><td><form:input path="state" /></td></tr>
        <tr><td>Country</td><td><form:input path="country" /></td></tr>
        <tr><td colspan="2"><input type="submit" value="Submit" /> <input type="reset" value="Reset" /></td></tr>
        </table>
    </form:form>
    </div>
</body>
</html>