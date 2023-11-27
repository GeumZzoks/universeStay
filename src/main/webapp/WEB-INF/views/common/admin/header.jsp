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
    <style>
        .header {
            position: fixed;
            z-index: 1;
            width: 100%;
            height: 50px;
            top: 0;
            left: 0;
            right: 0;
            border: 0;
            background-color: white;
        }

        .header__homebtn {
            position: fixed;
            border: 0;
            background-image: url(/resources/img/logo/small_logo_no_bgd2.png);
            background-size: 300px 300px;
            background-position: center;
            background-repeat: no-repeat;
            background-color: white;
            width: 210px;
            height: 50px;
            cursor: pointer;
        }

        .header__img {
            width: 20px;
            height: 20px;
            vertical-align: bottom;
            margin-right: 5px;
        }

        .header__btn {
            border: 0;
            border-radius: 5px;
            float: right;
            width: 100px;
            height: 30px;
            font-weight: 600;
            color: white;
            padding-top: 4px;
            margin: 10px 10px 0 0;
            cursor: pointer;
        }

        .header__btn:hover {
            transform: scale(1.05, 1.05);
            transition-duration: 500ms;
            color: black;
        }

        .header__adminbtn {
            border: 0;
            background-color: transparent;
            float: right;
            width: 100px;
            height: 30px;
            padding-top: 0px;
            margin: 10px 10px 0 0;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="header">
    <button class="header__homebtn" onclick="location.href='/event/list'"></button>
    <button class="header__btn" style="background-color: indianred;">홈페이지</button>
    <button class="header__btn" style="background-color: gray;">로그아웃</button>
    <button class="header__adminbtn"><a href="" style="color: dimgrey;"><img class="header__img"
                                                                             src="/resources/img/admin/header/admin.png">관리자1</a>
    </button>
</div>
</body>
</html>
