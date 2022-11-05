<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="net.javaguides.usermanagement.model.Item" %>
<%--
  Created by IntelliJ IDEA.
  User: naashnix
  Date: 11/3/22
  Time: 7:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="lib/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
    <style>
        .topnav {
            /*width: calc(100% - 3rem);*/
            height: 5.5rem;
            padding: 0.3rem 1.5rem;
            background-color: #1a4275;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }

        .logoImageLink {
            height: 100%;
        }

        .logoImageLink img {
            height: 100%;
        }

        .menuLink {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 19px 16px;
            text-decoration: none;
            font-size: 17px;
            font-family: 'Inter';
            font-weight: 600;
        }

        .userTitle{
            color: white;
            font-family: 'Roboto';
            font-size: 2.2rem;

        }
        .image {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px;
            width: 60px;
            margin-top: -13px;
        }
        .modal {
            display: none; /* Hidden by default */
            position: absolute; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            right: 0;
            left: 0;
            top: 0;
            bottom: 0;
            margin: auto;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(41, 75, 191); /* Fallback color */
            backdrop-filter: blur(4px);
            background-color: rgba(46, 85, 183, 0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 2px solid #888;
            width: 50vw;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }body, html {
             /*height: 100%;*/

         }
        input[type=text] {
            width: 300px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 4px;
            padding: 12px 10px 12px 10px;
        }

        #submit {
            border-radius: 2px;
            padding: 10px 32px;
            font-size: 16px;
        }

        .bg-image {
            background-image: url('../assets/images/medical1.jpg');
            filter: blur(4px);
            -webkit-filter: blur(4px);
            height: 40%;
            background-position: center;
            background-repeat: no-repeat, repeat;
            background-size: cover;
        }

        .bg-text {
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
            color: white;
            font-weight: bold;
            border: 3px solid #f1f1f1;
            z-index: 2;
            width: 80%;
            padding: 20px;
            text-align: center;
        }

        .medRow{
            overflow: auto;
            white-space: nowrap;
        }

        .medCol{
            display: inline-block;
            text-align: center;
            padding: 14px;
            text-decoration: none;
        }

        #third-view{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        .searchButton{
            color: white;
            background-color: #1a4275;
            font-family: 'Inter';
            font-size: 1.5rem;
            border: none;
            border-radius: 5px;
            padding: 0.5rem 1rem;
        }

        .searchField{
            font-size: 1.5rem;
            font-family: 'Inter';
            font-weight: 400;
            border-radius: 10px;
            border: none;
            padding: 0.5rem;
            color: black;
        }

    </style>
</head>
<body>
<div class="topnav">

    <a id="btnHome" href="https://imgbb.com/" class="logoImageLink">
        <img src="https://i.ibb.co/FVHKJnk/Pharamacy-Sys-Logo-Png.png"
             alt="Pharamacy-Sys-Logo-Png" border="0">
    </a>

    <span class="userTitle" >
            Hello! ${user.firstName}
         </span>

    <div style="display: flex; align-items: center; height: 100%;" >
        <a href="" class="menuLink">Order History</a>
        <a href="" class="menuLink">Logout</a>

        <a style="height: 80%;" href="https://imgbb.com/">
            <img style="height: 100%;" src="https://i.ibb.co/GsXJqmX/icons8-shopping-cart-90.png" alt="icons8-shopping-cart-90" border="0">
        </a>
    </div>

</div>
<span id="first-view">
        <div class="bg-image" style="height: 37vh"></div>

        <div class="bg-text"
             style="border-radius: 20px; position: absolute; top: 14%; left: 0; right: 0; margin: auto;">
            <h1 style="padding-bottom: 20px">THE P&S DRUG STORE</h1>
            <form method="POST" action="order" style="display: flex; flex-direction: row; justify-content: center">
                <fieldset style="margin-right: 1rem">
                <input class="searchField"
                       required
                       value="<c:out value='${item.itemName}' />"
                       name="itemName"
                       placeholder="Start Searching!"
                />
                </fieldset>
                <button class="searchButton" type="submit">
                    Search
                </button>
            </form>
        </div>


        <div class="container" style="margin-top: 10px; height: 38%">
            <div style="overflow: auto; height: 30vh">
                <table id="tblDrugs" class="table table-light table-hover"
                       style="width: 75vw;font-size: 1.5em; margin:2vh 0 0 5vw;">
                    <thead>
                        <tr>
                            <th scope="col">Code</th>
                            <th scope="col">Item Name</th>
                            <th scope="col">Description</th>
                            <th scope="col">Unit Price</th>
                            <th scope="col">Expire Date</th>
                            <th scope="col" style="width: 2vw">Cart</th>
                        </tr>
                    </thead>

                    <tbody id="tBodyDrugs">
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="item" items="${itemsLP}">

						<tr>
							<td><c:out value="${item.itemCode}" /></td>
							<td><c:out value="${item.itemName}" /></td>
							<td><c:out value="${item.description}" /></td>
							<td><c:out value="${item.price}" /></td>
							<td><c:out value="${item.expireDate}" /></td>
                            <td>
                                <button value="${item.itemCode}" style="border: none" id="sasa" onclick="btnClicked(event);">
                                   cart
                                </button>
                            </td>
						</tr>

                    </c:forEach>
                    <!-- } -->
                    </tbody>
                </table>
            </div>

        </div>
    </span>

    <script>

        function btnClicked(event) {

            event.preventDefault();
            console.log(event.target.value);
        }


    </script>
</body>
</html>
