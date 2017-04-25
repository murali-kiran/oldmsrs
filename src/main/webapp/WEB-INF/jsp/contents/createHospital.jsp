<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/msrs/css/jquery.tagsinput.css" />
  <script type="text/javascript" src="jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/jquery.tagsinput.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
  <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js'></script>
  <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/start/jquery-ui.css" />


<title>MRBGS |Create Hospital</title>

 <script type="text/javascript">
    function onAddTag(tag) {
      alert("Added a tag: " + tag);
    }
    function onRemoveTag(tag) {
      alert("Removed a tag: " + tag);
    }
    function onChangeTag(input,tag) {
      alert("Changed a tag: " + tag);
    }

    $(function() {
      $('#hospitalDeptString').tagsInput({width:'auto'});
    });
    
    function SubmitForm(){
    	if ($.trim($('#name').val()) == ''){
    		alert("Hospital name required");
    		event.preventDefault();
    		return false;
    	}
    	if ($.trim($('#hospitaltypeid').val()) == ''){
    		alert("Hospital Type required");
    		return false;
    	}
    	if ($.trim($('#phone1').val()) == ''){
    		alert("Phone1 required");
    		return false;
    	}
    	if ($.trim($('#faxno').val()) == ''){
    		alert("Fax number required");
    		return false;
    	}
    	if ($.trim($('#addressline1').val()) == ''){
    		alert("Flat Number required");
    		return false;
    	}
    	if ($.trim($('#addressline2').val()) == ''){
    		alert("Street required");
    		return false;
    	}
    	if ($.trim($('#hospitalDeptString').val()) == ''){
    		alert("Department required");
    		return false;
    	}
    		
    }
    
  </script>
</head>



<body >
<!-- Top menu on small screens -->
<div class="msrs-content">

<h1 class="ymc-xxxlarge ymc-text-red"><b>Create Hospital</b></h1>
<form:form method="post" modelAttribute="hospital" id="createHospitalform" name="createHospitalform"  commandName="hospital"
          onsubmit="return SubmitForm();" action="${pageContext.servletContext.contextPath}/home/createHospital">
	<c:if test="${hospitalid!=0}">
		<form:hidden path="hospitalid"/>
		<form:hidden path="createdtime"/>
	</c:if>
		<table>
		<tr><td>Name</td><td><form:input  path="name"/></td></tr>
        <tr><td>Hospital Type</td><td> <form:select path="hospitaltypeid" items="${hospitaltypes}" itemValue="hospitaltypeid" itemLabel="hospitaltype"/></td></tr>
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
        <tr><td>Departments:</td><td>
      	<form:input path="hospitalDeptString" class="tags" /></td></tr>
      	
		<%--<c:forEach items="${hospital.hospitalAccounts}" var="Account" varStatus="i" begin="0" >
	                <tr class="account">    
	                    <td><form:input path="hospitalAccounts[${i.index}].accountnumber" id="accountnumber${i.index}" /></td>
	                    <td><form:input path="hospitalAccounts[${i.index}].bank" id="bank${i.index}" /></td>
	                    <td><form:input path="hospitalAccounts[${i.index}].branch" id="branch${i.index}" /></td>
	                    <td><form:input path="hospitalAccounts[${i.index}].ifsccode" id="ifsccode${i.index}" /></td>
	                    
	                    <td><a href="#" class="removePerson">Remove Account</a></td>
	                </tr>
	    </c:forEach> --%>
      		
      	
        <tr><td colspan="2"><input type="submit" value="Submit" /> <input type="reset" value="Reset" /></td></tr>
        <!-- <tr><td> <a href="#" id="addAccount">Add Account</a>&nbsp;&nbsp;</td></tr> -->
        </table>
    </form:form>
    </div>
</body>
</html>
<!-- http://stackoverflow.com/questions/11495916/dynamically-add-rows-for-spring-form-using-jqury -->