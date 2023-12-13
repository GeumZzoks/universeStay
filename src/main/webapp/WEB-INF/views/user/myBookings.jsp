<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-08
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="/resources/js/common/aboutTimestamp.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        .screens-room-booking__body {
            /*width: 1920px;*/

        }

        .screens-room-booking {
            margin-left: 280px;
            margin-right: 280px;
        }

        .screens-room-booking * {
            box-sizing: border-box;
        }

        .screens-room-booking > div:nth-of-type(1) {
            margin-top: 30px;
            margin-bottom: 30px;
            font-family: 'NotoSansKR-Medium';
            font-size: 32px;
        }

        .screens-room-booking > div:nth-of-type(2) {
            margin-top: 50px;
            margin-bottom: 20px;
            font-family: 'NotoSansKR-Bold';
            font-size: 20px;
        }

        .screens-room-booking > div:nth-of-type(3) {
            width: 800px;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .screens-room-booking > div:nth-of-type(3) > div {
            margin-top: 50px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            /*outline: 5px lightslategray solid;*/
            box-shadow: 0px 0px 18px 3px gray;
            /*box-shadow: rgba(0, 0, 0, 0.12) 7px -16px 20px;*/
            border-radius: 16px;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) {
            flex-basis: 50%;
            margin-left: 20px;
            display: flex;
            flex-direction: column;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(1) {
            flex-basis: 50%;
            display: flex;
            flex-direction: column;
            align-items: stretch;
            justify-content: center;
            border-bottom: 1px solid gray;

        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(1) {
            font-size: 1.4rem;
            margin-bottom: 0.6rem;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) {
            font-size: 0.8rem;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) {
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(1) {
            font-size: 20px;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(2) > div:nth-of-type(2) > div:nth-of-type(2) {
            font-family: 'NotoSansKR-Medium';
            margin-top: 7px;
            font-size: 15px;
        }


        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(2) {
            flex-basis: 50%;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(2) > div:first-of-type {
            flex-basis: 30%;
            font-size: 0.8rem;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(1) > div:nth-of-type(2) > div:last-of-type {
            border-left: 1px solid gray;
            padding-left: 20px;
            display: flex;
            flex-direction: column;
            height: 70%;
            justify-content: center;
        }

        .screens-room-booking > div:nth-of-type(4) {
            margin-top: 60px;
            margin-bottom: 20px;
            font-family: 'NotoSansKR-Bold';
            font-size: 20px;
        }

        .screens-room-booking > div:nth-of-type(5) {
        }

        .screens-room-booking > div:nth-of-type(5) > div {
            display: inline-block;
            width: 33%;
        }

        .screens-room-booking > div:nth-of-type(5) > div > div {
            margin-top: 10px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .screens-room-booking > div:nth-of-type(5) > div > div > div:first-of-type {
            margin-right: 20px;
        }

        .screens-room-booking > div:nth-of-type(5) > div > div > div:nth-of-type(2) > div:nth-of-type(1) {
            font-family: NotoSansKR-Bold;
        }

        .screens-room-booking > div:nth-of-type(5) > div > div > div:nth-of-type(2) > div:nth-of-type(2) {
            margin-top: 10px;
            font-size: 0.8rem;
            color: #8a8a8a;
        }

        .screens-room-booking > div:nth-of-type(5) > div > div > div:nth-of-type(2) > div:nth-of-type(3) {
            margin-top: 5px;
            font-size: 0.8rem;
            color: #8a8a8a;
        }

        .screens-room-booking > div:last-of-type {
            border-top: 1px solid gray;
            padding-top: 20px;
            margin-top: 20px;
            margin-bottom: 100px;
            font-size: 14px;
            font-family: NotoSansKR-Bold;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(2) {
            position: relative;
        }

        .screens-room-booking > div:nth-of-type(3) > div > div:nth-of-type(2) > div:nth-of-type(1) {
            position: absolute;
            background-color: white;
            border-radius: 3px;
            left: 15px;
            top: 15px;
            padding: 5px;
            font-size: 0.8rem;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-room-booking__img-1 {
            border-top-right-radius: 15px;
            border-bottom-right-radius: 15px;
            width: 350px;
            height: 150px;
        }

        .screens-room-booking__img-2 {
            display: block;
            border-radius: 10px;
            width: 70px;
            height: 70px;
        }

        .screens-room-booking__modalContainer {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.4);
            justify-content: center;
            z-index: 1;
        }

        .screens-room-booking__modalContent__form {
            border-radius: 20px;
            padding: 20px 20px 20px 20px;
            background-color: lightyellow;
        }

        /*.screens-room-booking__modalContent__form > div:nth-of-type(2) > img {*/
        /*    width: 100px;*/
        /*    height: 100px;*/
        /*}*/

        .screens-room-booking__modalContent__starBox {
            margin-top: 20px;
            height: 70px;
            /*justify-content: center;*/
        }

        .screens-room-booking__modalContent__star {
            float: left;
            width: 25px;
            height: 50px;
            background-repeat: no-repeat;
            background-image: url('/resources/img/user/star-white.svg')

        }

        .screens-room-booking__modalContent__leftStar {
            background-position: left;

        }

        .screens-room-booking__modalContent__rightStar {
            background-position: right;

        }
    </style>
</head>
<body class="screens-room-booking__body">
<div class="screens-room-booking__modalContainer">
    <div class="screens-room-booking__modalContent">
        <form action="<c:url value='/user/myPage/mybookings/writereview'/>" method="post"
              class="screens-room-booking__modalContent__form">
            <div>별점을 선택해주세요</div>
            <div class="screens-room-booking__modalContent__starBox">
                <ul style="margin-left: 50px; margin-right: 50px;">
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__leftStar"
                        data-index="1"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__rightStar"
                        data-index="2"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__leftStar"
                        data-index="3"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__rightStar"
                        data-index="4"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__leftStar"
                        data-index="5"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__rightStar"
                        data-index="6"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__leftStar"
                        data-index="7"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__rightStar"
                        data-index="8"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__leftStar"
                        data-index="9"></li>
                    <li class="screens-room-booking__modalContent__star screens-room-booking__modalContent__rightStar"
                        data-index="10"></li>
                </ul>
            </div>
            <input type="hidden" name="review_stars">
            <input type="hidden" name="room_id">
            <input type="text" name="review_ctt" placeholder="내용을 작성해주세요...">
            <button type="submit">등록</button>
            <button type="button" onclick="cancelInsertReview()">취소</button>
        </form>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section class="screens-room-booking">
    <div>여행</div>
    <div>예정된예약</div>
    <div>
        <c:forEach var="dto" items="${list1}" varStatus="status">
            <div>
                <div>
                    <div>
                        <div>${dto.room_address}</div>
                        <div>${dto.user_nickname}님이 호스팅하는 집 전체</div>
                    </div>
                    <div>
                        <div>
                            <div>${dto.booking_checkin_date} ~</div>
                            <div>${dto.booking_checkout_date}</div>
<%--                            <div class="screens-room-booking-ing-checkin screens-room-booking-ing-checkin-${status.count}" value="${status.count}">${dto.booking_checkin_date} ~</div>--%>
<%--                            <div class="screens-room-booking-ing-checkout screens-room-booking-ing-checkout-${status.count}" value="${status.count}">${dto.booking_checkout_date}</div>--%>
<%--                            <div class="screens-room-booking-ing-year screens-room-booking-year-${status.count}">연도</div>--%>
                        </div>
                        <div>
                            <div>${dto.room_address}</div>
                            <div>한국</div>
                        </div>
                    </div>
                </div>
                <div>
                    <img class="screens-room-booking__img-1"
                         src="https://a0.muscache.com/im/pictures/prohost-api/Hosting-944688949784349638/original/43e8f4d0-0a26-4258-8ea2-2b5a402474e9.jpeg?im_w=1200"
                         alt="사진없음">
                    <div>
                            ${dto.booking_status_id == "B01" ? "예약신청" : dto.booking_status_id == "B02" ? "예약완료" :
                                    dto.booking_status_id == "B03" ? "예약취소" : dto.booking_status_id == "B04" ? "예약반려" : "오류"}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div>이전여행지</div>
    <div>
        <c:forEach var="dto" items="${list2}" varStatus="status">
            <div>
                <div>
                    <div>
                        <img class="screens-room-booking__img-2" src="${dto.room_main_photo}" alt="사진없음">
                        <button class="screens-room-booking__reviewWriteBtn screens-room-booking__reviewWriteBtn-${dto.booking_id}"
                                value="${dto.room_id}"> 리뷰쓰기
                        </button>
                    </div>
                    <div>
                        <div>${dto.room_address}</div>
                        <div>호스트 : ${dto.user_nickname}</div>
                        <div>${dto.booking_checkin_date} ~ ${dto.booking_checkout_date}</div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div>
        <span>예약 내역을 찾으실 수 없나요?</span><a href="#"> 도움말 센터 방문하기</a>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script>
    let room_id2 = null;
    let review_stars2 = 0;
    let rating = 'null';

    const reviewWriteBtn = document.querySelectorAll(".screens-room-booking__reviewWriteBtn");
    const modalContainer = document.querySelector(".screens-room-booking__modalContainer");
    const starBox = document.querySelector(".screens-room-booking__modalContent__starBox");
    const stars = document.querySelectorAll(".screens-room-booking__modalContent__star");

    const ing_checkin = document.querySelectorAll('.screens-room-booking-ing-checkin');
    const ing_checkout = document.querySelectorAll('.screens-room-booking-ing-checkout');
    const ing_year = document.querySelectorAll('.screens-room-booking-ing-year');

    <%--document.onload = function(){--%>
    <%--    ing_checkin.forEach(function(element){--%>
    <%--        element.innerHTML = formatKoreanDateTime(${list1[status.index].created_at}, 'mm-dd');--%>
    <%--    })--%>
    <%--}--%>

    <%--document.addEventListener("DOMContentLoaded", function () {--%>
    <%--    // Iterate through ing_checkin elements and update their content--%>
    <%--    <c:forEach var="dto" items="${list1}" varStatus="status">--%>
    <%--    const ingCheckin = document.querySelector('.screens-room-booking-ing-checkin-${status.count}');--%>
    <%--    const ingYear = document.querySelector('.screens-room-booking-year-${status.count}');--%>

    <%--    if (ingCheckin && ingYear) {--%>
    <%--        const timestamp = ${dto.created_at}; // Assuming that created_at is a timestamp--%>
    <%--        ingCheckin.innerHTML = formatKoreanDateTime(timestamp, 'mm-dd');--%>
    <%--        ingYear.innerHTML = formatKoreanDateTime(timestamp, 'yyyy');--%>
    <%--    }--%>
    <%--    </c:forEach>--%>
    <%--});--%>

    <%--document.addEventListener("DOMContentLoaded", function () {--%>
    <%--    <c:forEach var="dto" items="${list1}" varStatus="status">--%>
    <%--    const ingCheckin = document.querySelector('.screens-room-booking-ing-checkin-${status.count}');--%>
    <%--    const ingYear = document.querySelector('.screens-room-booking-year-${status.count}');--%>

    <%--    if (ingCheckin && ingYear) {--%>
    <%--        const timestamp = ${dto.created_at}; // created_at가 타임스탬프라 가정합니다.--%>
    <%--        ingCheckin.innerHTML = formatKoreanDateTime(timestamp, 'mm-dd');--%>
    <%--        ingYear.innerHTML = formatKoreanDateTime(timestamp, 'yyyy');--%>
    <%--    }--%>
    <%--    </c:forEach>--%>
    <%--});--%>
    stars.forEach(function (star) {
        star.addEventListener("click", function (e) {
            rating = e.target.getAttribute('data-index') / 2;
            console.log(rating);
        })

    })
    stars.forEach(function (star) {
        $(star).on('mouseover', function (e) {
            stars.forEach(function (star2) {
                star2.style.backgroundImage = "url('/resources/img/user/star-white.svg')";
            });
            for (let i = 0; i < star.getAttribute('data-index'); i++) {
                stars[i].style.backgroundImage = "url('/resources/img/user/star-yellow.svg')";
            }
        });
    });
    starBox.addEventListener("mouseleave", function () {
        // document.querySelectorAll(".screens-room-booking__modalContent__star").forEach(function (star) {
        stars.forEach(function (star) {
            star.style.backgroundImage = "url('/resources/img/user/star-white.svg')";
        });
        for (let i = 0; i < rating * 2; i++) {
            stars[i].style.backgroundImage = "url('/resources/img/user/star-yellow.svg')";
        }
    });

    reviewWriteBtn.forEach(function (btn) {
        btn.addEventListener('click', function () {
            room_id2 = $(this).val();
            modalContainer.style.display = 'flex';
        });
    });

    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            modalContainer.style.display = 'none';
            room_id2 = null;
            review_stars2 = null;
            rating = 'null';
            $(`input[name="review_ctt"]`).val(null);

        }
    });

    function cancelInsertReview() {
        modalContainer.style.display = 'none';
        room_id2 = null;
        review_stars2 = null;
        rating = 'null';
        $(`input[name="review_ctt"]`).val(null);
        // modalContainer.style.display = 'none';
        // window.location.reload();
    }

    $(".screens-room-booking__modalContent__form").submit(function (event) {
        // 이벤트 기본 동작 중단
        event.preventDefault();
        // $(`input[name="review_stars"]`).val(review_stars2);
        $(`input[name="review_stars"]`).val(rating);

        $(`input[name="room_id"]`).val(room_id2);

        // 폼의 submit 동작을 계속 진행하도록 함
        console.log(rating);
        this.submit();
    });

</script>
</body>
</html>