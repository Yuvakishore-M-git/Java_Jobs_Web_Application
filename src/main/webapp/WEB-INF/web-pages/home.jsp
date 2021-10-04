<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Job portal</title>
</head>
<body>
<div style="background-color: gainsboro;">
	<div class="container" style="opacity:30% ;background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoDpyOkmjtmEsPpQAbKAn8SnPMMi1zSISt0Q&usqp=CAU'); " >
	<h1 class="text-center" style="color: black;">Welcome! Choose your dream Job</h1>
		<h1 style="text-align: center;color: white;">Let's fill those Jobs </h1>
	</div></div>
	<div class="container mt-3">
		

		<c:if test="${not empty msg }">
			<div class="alert alert-success" style="text-align: center;">
				<b><c:out value="${msg }"></c:out></b>
			</div>
		</c:if>

		<div style="text-align: center;" class="container mt-2">

			<div class="row">
			<c:if test="${page=='add' }">
				<div class="col-md-6" style="text-align: center; background-color: light blue;">
					<a href="<c:url value='/add'></c:url>"
						class="list-group-item list-group-item-action active">Add Jobs</a>
				</div>
				<div class="col-md-6" style="text-align: center;">
					<a href="<c:url value='/home'></c:url>"
						class="list-group-item list-group-item-action">View Jobs</a>
				</div></c:if>
				
				
				<c:if test="${page=='home' }">
				<div class="col-md-6" style="text-align: center;">
					<a href="<c:url value='/add'></c:url>"
						class="list-group-item list-group-item-action">Add Jobs</a>
				</div>
				<div class="col-md-6" style="text-align: center; ">
					<a href="<c:url value='/home'></c:url>"
						class="list-group-item list-group-item-action active" >View Jobs</a>
				</div></c:if>
			</div>

		</div>

		<div class="container mt-3" style="text-align: center; width: 70%">

			<c:if test="${page=='home' }">
				<h1 class="text-center">All Jobs</h1>

				<c:forEach items="${list }" var="t">
					<div class="card" style="height: 200px;overflow:auto;">
						<div class="card-body" style="text-align: left;">
						<p style="text-align: right;">Posted on:<c:out value="${t.jobDate }"></c:out>
							<h4>
								<c:out value="${t.jobTitle }"></c:out>
							</h4>
							Apply here: <a href="${t.jobUrl }"><c:out value="${t.jobUrl }"></c:out></a> <br>
							
							<br>
							<p>
								<c:out value="${t.jobContent }"></c:out>
							</p>
						</div>

					</div>
					<br>

				</c:forEach>

			</c:if>

			<c:if test="${page=='add' }">
				<h1 class="text-center">Add Jobs</h1>
				<form:form action="saveJob" method="post" modelAttribute="job">
					<br>
					<div class="form-group">

						<form:input path="jobTitle" cssClass="form-control"
							placeholder="Enter the job role/position" />
					</div>
					<div class="form-group">

						<form:input path="jobUrl" cssClass="form-control"
							placeholder="Enter the URL for job application" />
					</div>

					<div class="form-group">

						<form:textarea path="jobContent" cssClass="form-control"
							cssStyle="height: 200px;" placeholder="Enter the Job discription" />
					</div>

					<div class="container text-center">

						<button class="btn btn-outline-success">Add Job</button>
					</div>
				</form:form>
			</c:if>

		</div>
		
	</div>

</body>
</html>