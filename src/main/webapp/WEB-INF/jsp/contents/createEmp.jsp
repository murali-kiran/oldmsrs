<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>

<title>MRBGS |Create Emp</title>
<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/msrs/css/style_new.css" /> --%>
</head>



<body >
<!-- Top menu on small screens -->
<div class="msrs-content">

<h1 class="ymc-xxxlarge ymc-text-red"><b>Create Employee</b></h1>
<form:form method="post" modelAttribute="emp" id="createEmpform" name="createEmpform"  commandName="emp"
                           action="${pageContext.servletContext.contextPath}/home/createEmp">
	<c:if test="${empid!=0}">
		<form:hidden path="empid"/>
		<form:hidden path="createdtime"/>
	</c:if>
		<table>
        <tr><td>First Name</td><td> <form:input path="firstname" /></td></tr>
        <tr><td>Last Name</td><td><form:input path="lastname" /></td></tr>
        <tr><td>Gender </td><td><form:select  path="gender"><form:option value="0">Male</form:option><form:option value="1">Female</form:option></form:select></td></tr>
        <tr><td>Date of Birthday</td><td><form:input class="date-picker" path="dob" /></td></tr>
        <tr><td>phone</td><td><form:input  path="phone" /></td></tr>
        <tr><td>email</td><td><form:input path="email" /></td></tr>
        <tr><td>Aathar</td><td><form:input  path="aatharnumber" /></td></tr>
        <tr><td>PanCard</td><td><form:input path="pancard" /></td></tr>
        <tr><td>Date of Joining</td><td><form:input class="date-picker" path="doj" /></td></tr>
        <tr><td>Date of Releaving</td><td><form:input class="date-picker" path="dor" /></td></tr>
        <tr><td>Address</td></tr>
        <tr><td>Home/Plat/Street</td><td><form:input path="adress1" /></td></tr>
        <tr><td>City</td><td><form:input path="adress2" /></td></tr>
        <tr><td>District</td><td><form:input path="district" /></td></tr>
        <tr><td>State</td><td><form:input path="state" /></td></tr>
        <tr><td>Pincode</td><td><form:input path="pincode" /></td></tr>
	
        <tr><td colspan="2"><input type="submit" value="Submit" /> <input type="reset" value="Reset" /></td></tr>
        </table>
    </form:form>
    </div>
    
    <script>
$(function() {
   /*  $('.date-picker').datepicker( {
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'MM yy',
        onClose: function(dateText, inst) { 
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
        }
    }); */
    
    $('.date-picker').datepicker();
});
</script>
</body>
</html>