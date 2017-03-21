<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org" ng-app="msrsHomeApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MSRS|Home</title>
<!-- <script src="../js/angular.min.js"></script> -->
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
<script src="http://code.angularjs.org/1.4.8/angular.js"></script>
<script src="http://code.angularjs.org/1.4.8/angular-resource.js"></script>
<script type="text/javascript" src="../js/app.js"></script>
<script
	src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script>
<link rel="stylesheet" href="/resources/css/home.css" />
</head>
<body>

	<div ng-controller="msrsHomeController">
		<!-- <div ng-repeat="emp in emps">{{emp.empid}} {{emp.firstname}}</div> -->
		<h3>List Of Employees</h3>
		<div class="container-fluid">
			<hr />
			<table class="table table-striped">
				<thead>
					<tr>
						<th ng-click="findAllEmps()">Edit</th>
						<th><a href="" ng-click="order('empid')">Emp ID </a></th>
						<th><a href="" ng-click="order('firstname')"> First Name</a>
						</th>
						<th><a href="" ng-click="order('lastname')">Last Name</a></th>
						<th><a href="" ng-click="order('dob')">DOB</a></th>
						<th><a href="" ng-click="order('phone')">Phone</a></th>
						<th><a href="" ng-click="order('email')">Email</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Filter </td>
						<td><input type="text" ng-model="search.empid" /></td>
						<td><input type="text" ng-model="search.firstname" /></td>
						<td><input type="text" ng-model="search.lastname" /></td>
						<td><input type="text" ng-model="search.dob" /></td>
						<td><input type="text" ng-model="search.phone" /></td>
						<td><input type="text" ng-model="search.email" /></td>
					</tr>
					<tr
						ng-repeat="emp in emps | orderBy:predicate:reverse | filter:paginate| filter:search"
						ng-class-odd="'odd'">
						<td>
							<button class="btn">Edit</button>
						</td>
						<td>{{ emp.empid}}</td>
						<td>{{ emp.firstname}}</td>
						<td>{{ emp.lastname}}</td>
						<td>{{ emp.dob}}</td>
						<td>{{ emp.phone}}</td>
						<td>{{ emp.email}}</td>
					</tr>
				</tbody>
			</table>
			<pagination total-items="totalItems" ng-model="currentPage"
				max-size="5" boundary-links="true" items-per-page="numPerPage"
				class="pagination-sm"> </pagination>
		</div>
	</div>
</body>
</html>