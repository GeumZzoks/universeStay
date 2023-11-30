<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/26
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%--임시로 사용한 헤더 jsp입니다 추후 회의 후 언제든 변경할 수 있으니 일단 파일 생성겸 등록해두었습니다.--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>

<div class="components-admin-header__header">
    <button class="components-admin-header__header__homebtn" onclick="location.href=''"></button>
    <button class="components-admin-header__header__btn" style="background-color: indianred;">홈페이지</button>
    <button class="components-admin-header__header__btn" style="background-color: gray;">로그아웃</button>
    <button class="components-admin-header__header__adminbtn"><a href="" style="color: dimgrey;"><img
            class="components-admin-header__header__img"
            src="/resources/img/admin/header/admin.png">관리자1</a>
    </button>
</div>
</body>
</html>
