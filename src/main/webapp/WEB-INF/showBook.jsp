<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Show book</title>
</head>
<body>
	<div class="m-5">
		<div class="d-flex justify-content-between mb-4">
			<h1>${book.title}</h1>
			<a href="/books">Back to the shelves</a>
		</div>
		<h5>
			<c:choose>
				<c:when test="${book.postedBy.id == id}">
					<c:set var="whichUser" scope="page" value="Your"/>
					<span class="text-danger">You </span>
				</c:when>
				<c:otherwise>
					<c:set var="whichUser" scope="page" value="${book.postedBy.name}'s"/>
					<span class="text-danger">${book.postedBy.name}</span>
				</c:otherwise>
			</c:choose>
			read <span class="darkviolet">${book.title} </span>by <span class="text-success">${book.author}</span>.
		</h5>
		<h5 class="mt-2 mb-4">Here are ${whichUser} thoughts:</h5>
		<div class="showThoughts">
			<hr/>
			<p>${book.thoughts}</p>
			<hr/>
			<c:choose>
				<c:when test="${book.postedBy.id == id}">
					<a href="/books/${book.id}/edit" class="btn btn-primary alignEnd">Edit</a>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>