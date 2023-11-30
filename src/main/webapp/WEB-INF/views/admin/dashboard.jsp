<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 11/27/23
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>대시보드</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

    <style>
      .container {
        width: 85%;
        height: 100%;
        margin: 70px 0px 0px 225px;
        border-radius: 10px;
      }

      .container__inner {
        width: 100%;
        height: 90%;

        display: flex;
        justify-content: space-around;
        align-items: center;
        background-color: #373f50;
      }

      .split-screen {
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;

        width: 90%;
        height: 90%;
        border: 2px solid whitesmoke;
      }

      .content-list {
        /*크기를 주고*/
        width: 650px;
        height: 330px;
        padding: 20px;
        box-sizing: border-box;
        background-color: wheat;
        border: 1px solid black;
        border-radius: 5px;
        overflow-y: auto;
        overflow-x: hidden;
      }

      /* 스크롤 기능은 유지한 채 화면에서 숨기기 */
      .content-list::-webkit-scrollbar {
        display: none;
      }

      .content {
        width: 100%;
        padding: 10px;
        margin: 5px;
        box-sizing: border-box;
        background-color: tomato;

        /* 화면 나감 방지 */
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
      }

    </style>
</head>
<body class="">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
flush="false"/>
<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
flush="false"/>
<jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
flush="false"/>

<div class="container">
    <div class="container__inner">
        <div class="split-screen">
            <div class="content-list">
                <%-- jsp:foreach 대체 예정 --%>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
                <div class="content">TEST</div>
            </div>

            <div class="content-list"></div>
            <div class="content-list"></div>
        </div>

        <div class="split-screen">
            <div class="content-list"></div>
            <div class="content-list"></div>
            <div class="content-list"></div>
        </div>
    </div>
</div>

</body>
</html>
