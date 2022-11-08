<%--
  Created by IntelliJ IDEA.
  User: naashnix
  Date: 11/8/22
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Previous Orders.</title>
    <style>
        #third-view{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
<span style="display: none" id="third-view">

        <div class="bg-text mt-5" style="border-radius: 20px;">
            <form method="post" action="dictionary.jsp">
                <label>
                    <input type="text" id="txtTranscriptCode" style="border-radius: 20px; color: black" name="search"
                           placeholder="Enter Transcript Code: " />
                </label>
                <input class="btn" id="btnSearchHistory"
                       style="font-size:1.2em; margin:0 0 5px 10px; background-color: #004ec6; color: #ffffff; height: 5vh"
                       value="Search" />
            </form>
        </div>

        <div class="mt-5" style="overflow: auto; height: 60vh;">
            <table id="tblOrderHistory" class="table table-light table-hover" style="width: 80vw;font-size: 1.5em;">
                <thead>
                    <tr>
                        <th scope="col">Code</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Order Time</th>
                        <th scope="col">Order Total</th>
                        <th scope="col" style="width: 2vw">Bin</th>
                    </tr>
                </thead>
                <tbody id="historyBody">

                </tbody>
            </table>
        </div>
    </span>
</body>
</html>
