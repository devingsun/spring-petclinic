<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<jsp:include page="../header.jsp"/>

<body>

	<div class="container">
		<spring:url value="/resources/images/banner-graphic.png" var="banner"/>
		<img src="${banner}" />
  
		<h2>Owner Information</h2>
	
	  <table class="table table-striped"  style="width:600px;">
	    <tr>
	      <th>Name</th>
	      <td><b>${owner.firstName} ${owner.lastName}</b></td>
	    </tr>
	    <tr>
	      <th>Address</th>
	      <td>${owner.address}</td>
	    </tr>
	    <tr>
	      <th>City</th>
	      <td>${owner.city}</td>
	    </tr>
	    <tr>
	      <th>Telephone </th>
	      <td>${owner.telephone}</td>
	    </tr>
	  </table>
	  <table class="table-buttons">
	    <tr>
	      <td colspan="2" align="center">
	        <spring:url value="{ownerId}/edit" var="editUrl">
	        	<spring:param name="ownerId" value="${owner.id}" />
	        </spring:url>
	        <a href="${fn:escapeXml(editUrl)}">Edit Owner</a>
	      </td>
	      <td>
	        <spring:url value="{ownerId}/pets/new" var="addUrl">
	        	<spring:param name="ownerId" value="${owner.id}" />
	        </spring:url>
	        <a href="${fn:escapeXml(addUrl)}">Add New Pet</a>
	      </td>
	    </tr>
	  </table>
	
	  <h2>Pets and Visits</h2>
	
	  <c:forEach var="pet" items="${owner.pets}">
	    <table class="table" style="width:600px;">
	      <tr>
	        <td valign="top">
	          <table>
	            <tr>
	              <th>Name</th>
	              <td><b>${pet.name}</b></td>
	            </tr>
	            <tr>
	              <th>Birth Date</th>
	              <td><fmt:formatDate value="${pet.birthDate}" pattern="yyyy-MM-dd"/></td>
	            </tr>
	            <tr>
	              <th>Type</th>
	              <td>${pet.type.name}</td>
	            </tr>
	          </table>
	        </td>
	        <td valign="top">
	          <table>
	            <thead>
	            	<tr>
		              <th>Visit Date</th>
		              <th>Description</th>
	              	</tr>
	            </thead>
	            <c:forEach var="visit" items="${pet.visits}">
	              <tr>
	                <td><fmt:formatDate value="${visit.date}" pattern="yyyy-MM-dd"/></td>
	                <td>${visit.description}</td>
	              </tr>
	            </c:forEach>
	          </table>
	        </td>
	      </tr>
	    </table>
	    <table class="table-buttons">
	      <tr>
	        <td>
	          <spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
	            <spring:param name="ownerId" value="${owner.id}"/>
	            <spring:param name="petId" value="${pet.id}"/>
	          </spring:url>
	          <a href="${fn:escapeXml(petUrl)}">Edit Pet</a>
	        </td>
	        <td></td>
	        <td>
	          <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
	            <spring:param name="ownerId" value="${owner.id}"/>
	            <spring:param name="petId" value="${pet.id}"/>
	          </spring:url>
	          <a href="${fn:escapeXml(visitUrl)}">Add Visit</a>
	        </td>
	        <td></td>
	        <td>
	          <spring:url value="/owners/{ownerId}/pets/{petId}/visits.atom" var="feedUrl">
	            <spring:param name="ownerId" value="${owner.id}"/>
	            <spring:param name="petId" value="${pet.id}"/>
	          </spring:url>
	          <a href="${fn:escapeXml(feedUrl)}" rel="alternate" type="application/atom+xml">Atom Feed</a>
	        </td>
	      </tr>
	    </table>
	  </c:forEach>
	  
	  <jsp:include page="../footer.jsp"/>
  
  	</div>

</body>

</html>
