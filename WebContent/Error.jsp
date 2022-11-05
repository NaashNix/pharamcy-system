<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Error</title>
</head>
<body>
	<center>
		<h1>Error</h1>
		<h2><%=exception.getMessage() %><br/> </h2>
		<!--   for (Todo todo: todos) {  -->
		<c:forEach var="item" items="${itemsLP}">

			<tr>
				<td><c:out value="${item.itemCode}" /></td>
				<td><c:out value="${item.itemName}" /></td>
				<td><c:out value="${item.description}" /></td>
				<td><c:out value="${item.price}" /></td>
				<td><c:out value="${item.expireDate}" /></td>
				<td>
					<button  value="{${item.itemCode},${item.itemName}}"   style="border: none; background-color: #219ebc; color: white" id="sasa" onclick="btnClicked(event);">
						ADD
					</button>
				</td>
			</tr>

		</c:forEach>
		<!-- } -->
	</center>	
</body>
</html>