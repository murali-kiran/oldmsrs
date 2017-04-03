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
			class="table table-bordered table-striped" id="claimtable">
			<tr>
				<!-- <th>ID</th> -->
				<th>Claim Date</th>
				<th>Details</th>
				<th>Created Date</th>
				<th>View</th>
				<!-- <th>Email</th>
				<th>Phone</th>
				<th>View</th> -->
			</tr>

			<c:forEach items="${claims}" var="claim">
				<tr>
					<td><c:out value="${claim.firstdayofincident}" /></td>
					<td><c:out value="${claim.details}" /></td>
					<td><c:out value="${claim.createdtime}" /></td>
					<td style="text-decoration: underline;cursor: pointer;" onclick="editclaim('${claim.incidentid}', '${claim.details}', '${claim.firstdayofincident}',
					 '${claim.ishomevisitrequired}', '${claim.benefitType.benefittypeid}', '${claim.officeLocation1.officelocationid}',
					  '${claim.officeLocation2.officelocationid}');"><c:out value="Edit" /></td>
					<%-- <td><c:out value="${claim.email}" /></td>
					<td><c:out value="${claim.phone}" /></td> 
					<td><a href="viewEmp?empid=<c:out value="${emp.empid}" />">view</a></td>--%>
				</tr>
			</c:forEach>
		</table>


<div style="padding-top:10px;"></div>
<div ><input type="button" style="float:right;" onclick="showCreateClaim1();" value="Create Claim" > </div>

<div id="incidentdiv" style="display:none;">
<h1>Create Claim</h1>
	<form:form modelAttribute="incident" id="incidentform"
					name="incidentform" commandName="incident"	>
					<table>
						<tr>
							<td>Benifit Type:</td>
							<%-- <td><form:input path="benefitType" /></td> --%>
							<td>
								<input type="hidden" name="incidentid" id="incidentid" />
								<form:select path="benefitType" items="${benifitTypes}" itemValue="benefittypeid" itemLabel="benefittype" />
							</td>
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
		<table style="border: 1px solid;" id="dependenttable"
			class="table table-bordered table-striped">
			<tr>
				<!-- <th>ID</th> -->
				<th>Dependent Name</th>
				<th>Age</th>
				<th>Relationship</th>
				 <th>Address</th>
				<th>Pincode</th>
				<th>State</th> 
				<th>View</th> 
			</tr>

			<c:forEach items="${dependents}" var="dependent">
				<tr>
					<td><c:out value="${dependent.name}" /></td>
					<td><c:out value="${dependent.age}" /></td>
					<td><c:out value="${dependent.relationship}" /></td>
					<td><c:out value="${dependent.address1}" /></td>
					<td><c:out value="${dependent.pincode}" /></td> 
					<td><c:out value="${dependent.state}" /></td> 
					<td style="text-decoration: underline;cursor: pointer;" onclick="editdependent('${dependent.nomineeid}', '${dependent.name}',
					 '${dependent.age}', '${dependent.relationship}', '${dependent.address1}','${dependent.address2}' ,
					 '${dependent.district}','${dependent.pincode}',
					  '${dependent.state}');"><c:out value="Edit" /></td>
				</tr>
			</c:forEach>
		</table>
<div><input style="margin-left:300px;float:right;" type="button" onclick="showCreateDependent(${fn:length(requestScope.dependents)});" value="Create Dependent" ></div>
<div id="dependentdiv" style="display:none;">
<h1>Create Dependent</h1>
	<form:form modelAttribute="dependent" id="dependentform"
					name="dependentform" commandName="dependent"	>
					<table>
						<tr>
							<td>Name:</td>
							<td><form:input path="name" /><input type="hidden" name="" id="" value="nomineeid" /> </td>
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
		 var incident = {};
		 incident["empid"] = $("#empid").val();
		 incident["details"] = $("#details").val();
		 incident["firstdayofincident"] = $("#firstdayofincident").val();
		 incident["ishomevisitrequired"] = $("#ishomevisitrequired").val();
		 incident["benefitType"] = {"benefittypeid":$("#benefitType").val()};
		 incident["officeLocation1"] = {"officelocationid" : $("#officeLocation1").val()};
		 incident["officeLocation2"] =  {"officelocationid" : $("#officeLocation2").val()};
		 //alert("iii:"+JSON.stringify(incident));
		 var url = "/oldmsrs/rest/createIncident";
		 var jsonData = callAjaxPost1(incident, url, 'claim');
		// var htmlrow ="<tr> <td>" + $("#details").val() + "</td><td>" + $("#details").val() + "</td><td>" + $("#details").val() + "</td> </tr>";         
         //$('#claimtable').append(htmlrow);
         //$('#incidentform')[0].reset();
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
		 var jsonData = callAjaxPost1(dependent, url, 'dependent');
		 alert("Details:"+jsonData.name);
	 });
	 
	 function callAjaxPost1(data, url, obj) {
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
					/*if(obj == 'claim'){
						var htmlrow ="<tr> <td>" + jsondata.firstdayofincident + "</td><td>" + jsondata.details + "</td><td>" + jsondata.createdtime + "</td> </tr>";         
				        $('#claimtable').append(htmlrow);
					}else{
						var htmlrow ="<tr> <td>" + jsondata.name + "</td><td>" + jsondata.relationship + "</td><td>" + jsondata.age + "</td> <td>" + jsondata.address1 + "</td><td>" + jsondata.pincode + "</td><td>" + jsondata.state + "</td> </tr>";         
				        $('#dependenttable').append(htmlrow);
					}*/
					//location.href = "http://localhost:8080/oldmsrs/home/viewEmp?empid="+$("#empid").val();
					setTimeout(function(){// wait for 5 secs(2)
				           location.reload(); // then reload the page.(3)
				    }, 2000);
				},
				error : function(error) {
					alert("Data Not Saved Due To:"+error);
				}
			});
			//return jsondata;
		}
	 //var showCreateClaim = true;
	 function editclaim(id, details, incidentdate, homevisitreq, benifittype, off1, off2  ) {
		// alert(id);
		
	 	$('#incidentid').val(id);
	 	$('#ishomevisitrequired').val(homevisitreq);
	 	$('#firstdayofincident').val(incidentdate);
	 	$('#officeLocation1').val(off1);
	 	$('#officeLocation2').val(off2);
	 	$('#details').val(details);
	 	$('#benefitType').val(benifittype);
	 	
	 	$('#incidentdiv').show();
	 	showCreateClaim = false;
	 }
	 
	 function editdependent(id, name, age, relationship, add1, add2, district, pin, state) {
		// alert(id);
		
	 	$('#nomineeid').val(id);
	 	$('#name').val(name);
	 	$('#age').val(age);
	 	$('#relationship').val(relationship);
	 	$('#address1').val(add1);
	 	$('#address2').val(add2);
	 	$('#district').val(district);
	 	$('#pincode').val(pin);
	 	$('#state').val(state);
	 	
	 	$('#dependentdiv').show();
	 	showCreateDep = false;
	 }
	 var showCreateClaim = true;
	 function showCreateClaim1() {
	 	if(showCreateClaim){
	 		$('#incidentdiv').show();
	 		showCreateClaim = false;
	 	}else{
	 		$('#incidentdiv').hide();
	 		showCreateClaim = true;
	 	}
	 	
	 }
	</script>
 </div>
</body>
</html>