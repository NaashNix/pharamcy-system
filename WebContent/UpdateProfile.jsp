<%--
  Created by IntelliJ IDEA.
  User: naashnix
  Date: 11/8/22
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Your Profile</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
<h1 id="userId" >${user}</h1>
<script>

    getPatientDetails();

    function getPatientDetails(){
        let userId = document.getElementById("userId");
        let stringUserId = userId.innerText;

        $.ajax({
            url:  'http://localhost:8080/jsp-servlet-jdbc-mysql-crud-tutorial/details?patientId='+stringUserId,
            method: "GET",
            contentType: "application/json",

            success:function (resp) {
                console.log(resp)
            }
        });
    }


</script>
</body>
</html>
