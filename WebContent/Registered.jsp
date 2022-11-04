<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dewmini
  Date: 11/4/22
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Successfully Registered!</title>
</head>
<body>

    <h1>Registration Completed!</h1>
    <a href="<%=request.getContextPath()%>/login" >
        <span>
            Click To Login!
        </span>
    </a>
</body>
</html>
