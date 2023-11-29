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
      .box {
        border: 1px solid;
        display: flex;
        justify-content: center;
      }
    .container {
      /*크기를 주고*/
      width: 100px;
      height: 100px;
      border: 1px solid;
    }

    </style>
</head>
<body class="">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>flush="false"/><jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
flush="false"/><jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>flush="false"/>

사이드바에 있는 메뉴들이 위치할 div를 대시보드에 예쁘게 만들어 놓는다.

<div class="box">
    <div class="container"></div>
    <div class="container"></div>
    <div class="container"></div>
    <div class="container"></div>
</div>


</body>
</html>
