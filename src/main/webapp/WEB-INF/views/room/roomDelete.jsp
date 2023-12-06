<%--
  Created by IntelliJ IDEA.
  User: ming7
  Date: 2023-12-05
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/css2/style.css" rel="stylesheet">
    <title>Title</title>
    <style>
      body {
        /*background-color: #8a8a8a;*/
        /*height: 100vh;*/
      }

      .container {
        /*background-color: #fee426;*/
        display: flex; /*content한테 적용하기 위해서*/
        justify-content: center;
      }

      .content {
        /*background-color: #62baea;*/

        margin: 10px 50px 10px 50px; /*부모와 자식에 마진*/
        width: 90%;
        height: 100%; /* 얘 자식이 height을 쓰니까 부모에도 height을 써야 됨.=>width,height은 부모기준이니까.*/
      }

      .top {
        background-color: #ffffff;
        /*border: 1px solid;*/
        /*border-radius: 20px; !* 잠시 영역 구분할라고*!*/
        width: 100%;
        height: 20%;

        /*자식 적용*/
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .top__title {

      }

      .top__title h2 { /*airbnb꺼 다 긁어옴*/
        display: block;
        font-size: 1.5em;
        margin-block-start: 0.83em;
        margin-block-end: 0.83em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        font-weight: bold;
      }

      .top__button-icn {

      }

      .cards {
        /*background-color: #ffaaaa;*/
        /*border: 3px solid red;*/
        height: 70%;

        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
      }

      .card {
        padding-bottom: 50px;

        position: relative;
      }

      .card p {
        font-size: 10px;
      }

      .card .card__img { /*div*/
        /*border-radius: 15px;*/
        /*border: 1px solid;*/
      }

      .card .card__img img { /*img 태그*/

        border-radius: 15px;
        /*border: 1px solid;*/
        /*사진을 정사각형으로 만들고 싶은데 무슨 방법을 써야할지 모르겠습니다만...*/
        width: 430px;
        height: 393px;
      }

      .card .card__date {
        margin: 0px;
        width: 100%;
        height: 5%;

      }

      .card .card__date p {
        font-size: 15px;
        font-weight: bold;
        margin: 10px 0px 0px 0px;

      }

      .card .card__location {
        width: 100%;
        height: 10%;

      }

      .card .card__location p {
        font-size: 13px;
        color: #999999;
        margin: 0px 0px 0px 0px;
      }

      .card_status {
        background-color: #ffffff;
        border-radius: 35px;

        display: flex;
        align-items: center;
        justify-content: left;

        position: absolute;
        top: 10px;
        left: 10px;
        padding: 0px 10px 0px 10px;
      }

      .card_status img {
        width: 10px;
        height: 10px;
      }

      .card_status__img {
        /*  얘한테 앱솔루트 줘서 옮겨보려했으나, 이미 부모가 앱솔루트여서 못쓰는 상황*/
      }

      .card_status span {
        font-size: 13px;
        font-weight: bold;
        padding: 13px 5px;
      }


    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <div class="top">
            <div class="top__title"><h2>숙소</h2></div>
            <div>
                <button class="top__button-icn">목록보기 아이콘 자리</button>
                <button class="top__button-icn">숙소추가 아이콘 자리</button>
            </div>
        </div>

        <div class="cards">
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room1.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-red.png">
                    <span>일시 중지됨</span>
                </div>
            </div>
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room2.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-yellow.png">
                    <span>등록 중</span>
                </div>
            </div>
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room3.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-green.png">
                    <span>운영 중</span>
                </div>
            </div>
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room1.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-red.png">
                    <span>일시 중지됨</span>
                </div>
            </div>
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room2.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-yellow.png">
                    <span>등록 중</span>
                </div>
            </div>
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room3.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-green.png">
                    <span>운영 중</span>
                </div>
            </div>
            <div class="card">
                <div class="card__img"><img src="/resources/img/room/room1.png"></div>
                <div class="card__date"><p>아파트 숙소 등록일: 2023년 10월 25일</p></div>
                <div class="card__location"><p>Yongin-si, Gyeonggi-do</p></div>
                <div class="card_status">
                    <img class="card_status__img"
                         src="/resources/img/room/icons8-circle-16-red.png">
                    <span>일시 중지됨</span>
                </div>
            </div>


        </div>


    </div>

</body>
</html>
