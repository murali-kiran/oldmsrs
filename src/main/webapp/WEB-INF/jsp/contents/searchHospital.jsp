<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<title>MRBGS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
	<div class="msrs-content">

		<!-- Services -->
		<div class="ymc-container" id="services" style="margin-top: 5px">
			
			<div style="margin-right: 100px;">
				<h1 class="ymc-xxxlarge ymc-text-red">
					<b>Hospital List</b>
				</h1>
				<table id="results" style="border: 1px solid;"
					class="table table-bordered table-striped">
					<tr>
						<th>ID</th> 
						<th>Name</th>
						<th>Hospital Type</th>
						<th>Contact</th>
						<th>Fax No</th>
						<th>Address</th>
						<th>Email</th>
						<th>Accounts</th>
						<th>Departments</th>
						<th>View</th>
					</tr>

					<c:forEach items="${hospitals}" var="hospital">
						<tr>
							<td><c:out value="${hospital.hospitalid}" /></td>
							<td><c:out value="${hospital.name}"/></td>
							<td>
								<c:forEach items="${hospitaltypes}" var="hospitaltype">
									<c:if test="${hospital.hospitaltypeid == hospitaltype.hospitaltypeid}">
										<c:out value="${hospitaltype.hospitaltype}" />
									</c:if>
								</c:forEach>
							</td>
							<td>
								<c:if test="${not empty hospital.phone1}"><c:out value="${emp.phone1}" />, </c:if>
								<c:if test="${not empty hospital.phone2}"><c:out value="${emp.phone2}" /> </c:if>
							</td>
							<td>
								<c:out value="${emp.faxno}" />
							<td>
								<c:if test="${hospital.addressline1 !=null}"><c:out value="${emp.addressline1}" />, </c:if>
								<c:if test="${hospital.addressline2 !=null}"><c:out value="${emp.addressline2}" />, </c:if>
								<c:if test="${hospital.city !=null}"><c:out value="${emp.city}" />, </c:if>
								<c:if test="${hospital.district !=null}"><c:out value="${emp.district}" /> ,</c:if>
								<c:if test="${hospital.state !=null}"><c:out value="${emp.state}" /> ,</c:if>
								<c:if test="${hospital.country !=null}"><c:out value="${emp.country}" /> </c:if>
							</td>
							<td><c:out value="${hospital.emailid}" /></td>
							<td>
								<table>
									<c:forEach items="${hospital.hospitalAccounts}" var="account">
										<tr>
											<td><c:out value="${account.accountnumber}" /></td>
											<td><c:out value="${account.bank}" /></td>
											<td><c:out value="${account.branch}" /></td>
											<td><c:out value="${account.ifsccode}" /></td>
										</tr>
									</c:forEach>
								</table>
							</td>
							<td>
								<table>
									<c:forEach items="${hospital.hospitalDepartments}" var="dept">
										<tr>
											<td><c:out value="${dept.department}" /></td>
										</tr>
									</c:forEach>
								</table>
							</td>
							<td><a href="viewHospital?hospitalid=<c:out value="${hospital.hospitalid}" />">view</a></td>
						</tr>
					</c:forEach>
				</table>
				<div id="pageNavPosition"></div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
        var pager = new Pager('results', 5); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    </script>
</body>
</html>