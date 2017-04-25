<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/msrs.js"></script> 
<title>MRBGS |Create Emp</title>
<script>
function SubmitForm(){
	if ($.trim($('#firstname').val()) == ''){
		alert("First name required");
		return false;
	}
	if ($.trim($('#lastname').val()) == ''){
		alert("Last name required");
		return false;
	}
	if ($.trim($('#dob').val()) == ''){
		alert("Date Of Birth required");
		return false;
	}
	if ($.trim($('#phone').val()) == ''){
		alert("Phone number required");
		return false;
	}
	if ($.trim($('#adress').val()) == ''){
		alert("Address required");
		return false;
	}
		
}
</script>
</head>



<body >
<!-- Top menu on small screens -->
<div class="msrs-content">

<h1 class="ymc-xxxlarge ymc-text-red"><b>Create Employee</b></h1>
<form:form method="post" modelAttribute="emp" id="createEmpform" name="createEmpform"  commandName="emp"
                           action="${pageContext.servletContext.contextPath}/home/createEmp" onsubmit="return SubmitForm();">
	<c:if test="${empid!=0}">
		<form:hidden path="empid"/>
		<form:hidden path="createdtime"/>
	</c:if>
		<table>
		<tr><td>title</td><td><form:select  path="title"><form:option value="Mr">Mr</form:option><form:option value="Mrs">Mrs</form:option><form:option value="Miss">Miss</form:option></form:select></td></tr>
        <tr><td>First Name</td><td> <form:input path="firstname" /></td></tr>
        <tr><td>Middle Name</td><td> <form:input path="middlename" /></td></tr>
        <tr><td>Last Name</td><td><form:input path="lastname" /></td></tr>
        <tr><td>Gender </td><td><form:select  path="gender"><form:option value="0">Male</form:option><form:option value="1">Female</form:option></form:select></td></tr>
        <tr><td>Date of Birthday</td><td><form:input onclick="opendate();" class="date-picker" path="dob" /></td></tr>
        <tr><td>phone</td><td><form:input  path="phone" /></td></tr>
        <tr><td>email</td><td><form:input path="email" /></td></tr>
        <tr><td>Address</td><td><form:textarea path="adress" /></td></tr>
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