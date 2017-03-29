<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<title>MRBGS</title>
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
</div>


	<h1 class="ymc-xxxlarge ymc-text-red"><b>Claim List</b></h1>
		<table style="border: 1px solid;"
			class="table table-bordered table-striped">
			<tr>
				<!-- <th>ID</th> -->
				<th>Claim Date</th>
				<th>Details</th>
				<th>Created Date</th>
				<!-- <th>Email</th>
				<th>Phone</th>
				<th>View</th> -->
			</tr>

			<c:forEach items="${claims}" var="claim">
				<tr>
					<td><c:out value="${claim.firstdayofincident}" /></td>
					<td><c:out value="${claim.details}" /></td>
					<td><c:out value="${claim.createdtime}" /></td>
					<%-- <td><c:out value="${claim.email}" /></td>
					<td><c:out value="${claim.phone}" /></td> 
					<td><a href="viewEmp?empid=<c:out value="${emp.empid}" />">view</a></td>--%>
				</tr>
			</c:forEach>
		</table>


<div style="padding-top:10px;"></div>
<div ><input type="button" style="float:right;" onclick="showCreateClaim();" value="Create Claim" > </div>

<div id="incidentdiv" style="display:none;">
<h1>Create Claim</h1>
	<form:form modelAttribute="incident" id="incidentform"
					name="incidentform" commandName="incident"	>
					<table>
						<tr>
							<td>Benifit Type:</td>
							<%-- <td><form:input path="benefitType" /></td> --%>
							<td><form:select path="benefitType" items="${benifitTypes}" itemValue="benefittypeid" itemLabel="benefittype" /></td>
						</tr>
						<tr>
							<td>Home Visit Required:</td>
							<%-- <td><form:input path="ishomevisitrequired" /></td> --%>
							<td><form:select path="ishomevisitrequired">
							    <form:option value="1" label="Yes" />
							    <form:option value="0" label="No" />
							</form:select></td>
						</tr>
						<tr>
							<td>Incident Date:</td>
							<td><form:input path="firstdayofincident" class="date-picker" /></td>
						</tr>
						<tr>
							<td>Address1:</td>
							<td><form:input path="officeLocation1" /></td>
						</tr>
						<tr>
							<td>Address2:</td>
							<td><form:input path="officeLocation2" /></td>
						</tr>
						<tr>
							<td>Details:</td>
							<td><form:textarea rows="4" cols="60" path="details" /><input type="hidden" id="empid" value="${emp.empid}" /></td>
						</tr>
						<tr>
							<td><input id="incidentbtn" type="button" value="Save Claim" /> <input
								type="reset" value="Reset" /></td>
						</tr>
					</table>
				</form:form>
	</div>

<div style="padding-top:10px;"></div>
<h1 class="ymc-xxxlarge ymc-text-red"><b>Dependent List</b></h1>
		<table style="border: 1px solid;"
			class="table table-bordered table-striped">
			<tr>
				<!-- <th>ID</th> -->
				<th>Dependent Name</th>
				<th>Age</th>
				<th>Relationship</th>
				 <th>Address</th>
				<th>Pincode</th>
				<th>State</th> 
			</tr>

			<c:forEach items="${dependents}" var="dependent">
				<tr>
					<td><c:out value="${dependent.name}" /></td>
					<td><c:out value="${dependent.age}" /></td>
					<td><c:out value="${dependent.relationship}" /></td>
					<td><c:out value="${dependent.address1}" /></td>
					<td><c:out value="${dependent.pincode}" /></td> 
					<td><c:out value="${dependent.state}" /></td> 
					<%-- <td><a href="viewEmp?empid=<c:out value="${emp.empid}" />">view</a></td> --%>
				</tr>
			</c:forEach>
		</table>
<div><input style="margin-left:300px;float:right;" type="button" onclick="showCreateDependent();" value="Create Dependent" ></div>
<div id="dependentdiv" style="display:none;">
<h1>Create Dependent</h1>
	<form:form modelAttribute="dependent" id="dependentform"
					name="dependentform" commandName="dependent"	>
					<table>
						<tr>
							<td>Name:</td>
							<td><form:input path="name" /></td>
						</tr>
						<tr>
							<td>Age:</td>
							<td><form:input path="age" /></td>
						</tr>
						<tr>
							<td>Relationship:</td>
							<td><form:input path="relationship" /></td>
						</tr>
						<tr>
							<td>Address1:</td>
							<td><form:textarea rows="4" cols="60" path="address1" /></td>
						</tr>
						<tr>
							<td>Address2:</td>
							<td><form:textarea rows="4" cols="60" path="address2" /></td>
						</tr>
						<tr>
							<td>Pincode:</td>
							<td><form:input path="pincode" /></td>
						</tr>
						<tr>
							<td>District:</td>
							<td><form:input path="district" /></td>
						</tr>
						<tr>
							<td>State:</td>
							<td><form:input path="state" /></td>
						</tr>
						<tr>
							<td><input id="dependentbtn" type="button" value="Save Dependent" /> </td>
						</tr>
					</table>
				</form:form>
	</div>


<div style="padding-top:20px;"></div>
    <script>
	 $("#incidentbtn").click(function(e){
		 e.preventDefault();
		 var incident = {}
		 incident["empid"] = $("#empid").val();
		 incident["details"] = $("#details").val();
		 incident["firstdayofincident"] = $("#firstdayofincident").val();
		 incident["ishomevisitrequired"] = $("#ishomevisitrequired").val();
		 incident["benefitType"] = {"benefittypeid":$("#benefitType").val()};
		 incident["officeLocation1"] = {"officelocationid" : $("#officeLocation1").val()};
		 incident["officeLocation2"] =  {"officelocationid" : $("#officeLocation2").val()};
		 //alert("iii:"+JSON.stringify(incident));
		 var url = "/oldmsrs/rest/createIncident";
		 var jsonData = callAjaxPost1(incident, url);
		 alert("Details:"+jsonData.details);
	 });
	 
	 $("#dependentbtn").click(function(e){
		 e.preventDefault();
		 var dependent = {}
		 dependent["empid"] = $("#empid").val();
		 dependent["name"] = $("#name").val();
		 dependent["relationship"] = $("#relationship").val();
		 dependent["age"] = $("#age").val();
		 dependent["address1"] = $("#address1").val();
		 dependent["address2"] = $("#address2").val();
		 dependent["pincode"] = $("#pincode").val();
		 dependent["district"] = $("#district").val();
		 dependent["state"] = $("#state").val();
		 //alert("iii:"+JSON.stringify(dependent));
		 var url = "/oldmsrs/rest/createDependent";
		 var jsonData = callAjaxPost1(dependent, url);
		 alert("Details:"+jsonData.name);
	 });
	 
	 function callAjaxPost1(data, url) {
			//alert("in ajax123");
			var jsondata = "";
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(data) {
					jsondata = data;
					alert("Data Saved!");
				},
				error : function(error) {
					alert("Data Not Saved Due To:"+error);
				}
			});
			//return jsondata;
		}
	
	</script>
 </div>
</body>
</html>