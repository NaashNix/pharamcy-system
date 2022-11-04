<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: naashnix
  Date: 11/4/22
  Time: 8:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up | Online Pharmacy</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap');

        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .sMainParent{
            height: 100%;
            display: flex;
            flex-direction: row;
        }

        .sLeftSide{
            position: relative;
            width: 36.5%;

        }
        .sLeftSide img{
            height: 100%;
        }

        .sTitleContainer{
            position: absolute;
            bottom: 0;
            background: rgba(10, 10, 10, 0.5);
            width: 100%;
            height: 15rem;
        }

        .sLeftMainHeading{
            display: block;
            color: white;
            font-size: 3rem;
            font-family: 'Inter';
            font-weight: 600;
            margin-left: 1rem;
            margin-top: 1rem;
        }

        .sLeftSubHeading{
            display: block;
            color: white;
            font-size: 2rem;
            font-family: 'Inter';
            font-weight: 300;
            margin-left: 1rem;
        }

        .sRightSide{
            height: 100%;
            width: 65%;
            position: relative;
        }

        .marginTop{
            margin-top: 1rem;
        }
        .sSignupForm{
            width: 70%;
            height: 65%;
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
        <a href="https://ibb.co/D9DVSR7">
            <img src="https://i.ibb.co/y6nfbQ8/signup-Background.jpg" alt="signup-Background" border="0">
        </a>
        <div class="sTitleContainer">
            <span class="sLeftMainHeading">SIGNUP</span>
            <span class="sLeftSubHeading">Signup to order your medicine <br> today.</span>
        </div>
    </div>
    <div class="sRightSide">

        <form class="sSignupForm" method="POST" action="newSignUp">


            <div class="sDualInputGroup marginTop">
                <fieldset class="mb-3 mlCustom" style="width: 45%;">
                    <label for="firstNameField" class="form-label fontFace">First Name</label>
                    <input  value="<c:out value='${user.firstName}' />"
                           name="firstName" type="text" class="form-control" id="firstNameField" placeholder="Dewmini">
                </fieldset>
                <fieldset class="mb-3" style="width: 45%;">
                    <label for="secondNameField" class="form-label fontFace">Second Name</label>
                    <input value="<c:out value='${user.secondName}' />"
                           name="secondNumber" type="text" class="form-control" id="secondNameField" placeholder="Wangathunga">
                </fieldset>
            </div>
            <div class="sDualInputGroup marginTop">
                <fieldset class="mb-3 mlCustom">
                    <label for="nicNumberField" class="form-label fontFace">NIC Number</label>
                    <input value="<c:out value='${user.nicNumber}' />"
                           name="nicNumber" type="text" class="form-control" id="nicNumberField" placeholder="000000000000">
                </fieldset>

                <fieldset class="mb-3">
                    <label for="birthdayField" class="form-label fontFace">Date Of Birth</label>
                    <input value="<c:out value='${user.birthday}' />"
                           name="birthday" type="date" class="form-control" id="birthdayField" placeholder="000000000000">
                </fieldset>
            </div>

            <fieldset class="mb-3 marginTop">
                <label for="addressField" class="form-label fontFace">Residential Address</label>
                <input value="<c:out value='${user.address}' />"
                       name="address" type="text" class="form-control" id="addressField" placeholder="No. 51, Galle Road, Panadura">
            </fieldset>

            <fieldset class="mb-3">
                <label for="emailField" class="form-label fontFace">Email Address</label>
                <input value="<c:out value='${user.email}' />"
                       name="email" type="email" class="form-control" id="emailField" placeholder="JohnSilva@mail.com">
            </fieldset>

            <div class="sDualInputGroup marginTop">
                <fieldset class="mb-3 mlCustom">
                    <label for="usernameField" class="form-label fontFace">Username</label>
                    <input value="<c:out value='${user.username}' />"
                           name="username" type="text" class="form-control" id="usernameField" placeholder="At least 4 characters.">
                </fieldset>

                <fieldset class="mb-3 marginTop">
                    <label for="passwordField" class="form-label fontFace">Password</label>
                    <input value="<c:out value='${user.password}' />"
                           name="password" type="password" class="form-control" id="passwordField" placeholder="">
                </fieldset>
            </div>
            <div class="sSubmitButtonParent marginTop">
                <button class="btn sBtn1" type="submit" >Signup</button>
                <button class="btn sBtn2" type="reset" >Cancel</button>
            </div>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>

    // This is main key for whole validation.
    let validationState = false;

    const firstNameField = $("#firstNameField");
    const secondNameField = $("#secondNameField");
    const nicNumberField = $("#nicNumberField");
    const birthdayField = $("#birthdayField");
    const emailField = $("#emailField");
    const usernameField = $("#usernameField");
    const passwordField = $('#passwordField');
    const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

    function nameInputValidation(name, regex) {
        if (!name.val().match(regex)) {
            name.css('border', '2px solid red');
            name.css('margin', '-1px');
            validationState = false;
        } else {
            name.css('border', '1px solid #ced4da');
            name.css('margin', '0px');
            validationState = true;
        }
    }

    function checkEmptyState(field) {
        if (field.val() == '') {
            name.css('border', '2px solid red');
            name.css('margin', '-1px');
            validationState = false;
        } else {
            name.css('border', '1px solid #ced4da');
            name.css('margin', '0px');
            validationState = true;
        }
    }

    firstNameField.keyup((e) => {
        nameInputValidation(firstNameField, '([A-z]){1}\w?');
    });

    secondNameField.keyup((e) => {
        nameInputValidation(secondNameField, '([A-z]){1}\w?');
    });


    nicNumberField.keyup(() => {
        nameInputValidation(nicNumberField, '^[0-9]{12}$');
    });

    emailField.keyup(() => {
        nameInputValidation(emailField, re);
        /* if(!emailField.val().includes('@')) {
           emailField.css('border', '2px solid red');
           emailField.css('margin', '-1px');
           validationState = false;
        } else {
           emailField.css('border', '1px solid #ced4da');
           emailField.css('margin', '0px');
           validationState = true;
        } */

    });

    usernameField.keyup(() => {
        nameInputValidation(usernameField, '^[a-zA-Z0-9_]+$');
    });

    function signupButtonClicked() {
        if (validationState) {
            checkEmptyState();
        } else {
            console.log('Error');
        }
    }

</script>

</body>
</html>
