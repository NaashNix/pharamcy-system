<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: naashnix
  Date: 11/2/22
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Login | Pharmacy System</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap');

        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .sMainParent{
            height: calc(100vh - 8rem);
            display: flex;
            flex-direction: row;
        }

        .sLeftSide{
            position: relative;
            width: 36.5%;
            overflow: hidden;

        }
        .sLeftSide img{
            height: 100%;
            transform: scale(1.5);
        }

        .sTitleContainer{
            position: absolute;
            bottom: 0;
            background: rgba(10, 10, 10, 0.8);
            width: 100%;
            height: 15rem;
        }

        .sLeftMainHeading{
            display: block;
            color: white;
            font-size: 4rem;
            font-family: 'Inter';
            font-weight: 600;
            margin-left: 1rem;
            margin-top: 1rem;
        }

        .sLeftSubHeading{
            display: block;
            color: white;
            font-size: 2.1rem;
            font-family: 'Inter';
            font-weight: 300;
            margin-left: 1rem;
        }

        .sRightSide{
            height: 100%;
            width: 65%;
            position: relative;
        }

        .sSignupForm{
            width: 70%;
            height: 30%;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            padding: 2rem;
            border-radius: 15px;
            border: 2px solid #f19502;
            box-shadow: 1px 1px 12px 2px rgb(0 0 0 / 31%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .sDualInputGroup{
            display: flex;
            flex-direction: row;

        }

        .mlCustom{
            margin-right: 1.5rem;
        }

        .fontFace{
            font-family: 'Inter';
            font-weight: 700;
            font-size: 0.9rem;
            color: #484848;
            margin-bottom: 0.2rem !important;
        }

        .sSubmitButtonParent{
            display: inline-block;
            margin-top: 1rem;
        }

        .sSubmitButtonParent .sBtn1{
            float: right;
            margin-left: 0.5rem;
            background-color: #f19502;
            color: white;
            font-weight: 600;
            font-family: 'Inter';
            font-size: 1rem;
        }

        .sSubmitButtonParent .sBtn2{
            float: right;
            margin-left: 0.5rem;
            background-color: #495057;
            color: white;
            font-weight: 600;
            font-family: 'Inter';
            font-size: 1rem;
        }

        .inputError{
            border-color: red;
            border: 1px solid red;
            background-color: #219ebc;
        }

        #lUsernameField:focus, #lPasswordField:focus{
            border: 1px solid #f19502 !important;
            box-shadow: 0 0 0 0.25rem rgba(241, 149, 2, 0.25);
        }
    </style>
</head>
<body>
<div class="sMainParent">
    <div class="sLeftSide">
<%--        <img src="<c:url value="/WEB-INF/loginBackground.jpg"/>" />--%>
        <img src="${loginBackground.jpg}" height="500" width="500">
        <div class="sTitleContainer">
            <span class="sLeftMainHeading">LOGIN</span>
            <span class="sLeftSubHeading">Welcome Back! Login your account to place a order.</span>
        </div>
    </div>
    <div class="sRightSide">
        <div class="sSignupForm">
            <div>
                <div class="sDualInputGroup">
                    <div class="mb-3 mlCustom">
                        <label for="lUsernameField" class="form-label fontFace">Username</label>
                        <input type="text" class="form-control" id="lUsernameField"
                               placeholder="At least 4 characters.">
                    </div>

                    <div class="mb-3">
                        <label for="lPasswordField" class="form-label fontFace">Password</label>
                        <input type="password" class="form-control" id="lPasswordField" placeholder="">
                    </div>
                </div>
            </div>
            <div class="sSubmitButtonParent">
                <button class="btn sBtn1" onclick="signupButtonClicked()">Login</button>
                <button class="btn sBtn2">Cancel</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
