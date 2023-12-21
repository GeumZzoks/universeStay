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
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <link rel="stylesheet" href="/resources/css2/screens/user/myBookings.css">
</head>
<body class="screens-room-myBookings__body">
<div class="screens-room-myBookings__modalContainer">
    <div class="screens-room-myBookings__modalContent">
        <form action="<c:url value='/user/myPage/mybookings/writereview'/>" method="post"
              class="screens-room-myBookings__modalContent__form">
            <div>별점을 선택해주세요</div>
            <div class="screens-room-myBookings__modalContent__starBox">
                <ul style="margin-left: 50px; margin-right: 50px;">
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="1"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="2"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="3"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="4"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="5"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="6"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="7"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="8"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="9"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="10"></li>
                </ul>
            </div>
            <input type="hidden" name="review_stars">
            <input type="hidden" name="room_id">
            <input type="text" name="review_ctt" placeholder="내용을 작성해주세요...">
            <button type="submit ">등록</button>
            <button type="button" onclick="cancelInsertReview()">취소</button>
        </form>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>


<section class="screens-room-myBookings">

    <div class="screens-room-myBookings__title">여행</div>
    <div class="screens-room-myBookings__total-wrapper">
        <div class="screens-room-myBookings__wrapper">

            <div class="screens-room-myBookings__comming-reservation">
                <div class="screens-room-myBookings__comming-reservation__title">예정된 예약</div>
                <div class="screens-room-myBookings__comming-reservation__wrapper">
                    <c:forEach var="dto" items="${list1}" varStatus="status">
                        <div class="screens-room-myBookings__comming-reservation__div">
                            <div class="screens-room-myBookings__comming-reservation__div__info">
                                <div class="screens-room-myBookings__comming-reservation__div__status_id">
                                    <c:choose>
                                        <c:when test="${dto.booking_status_id == 'B01'}">
                                            승인 대기
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B02' && (dto.payment_id == null || dto.payment_is_approved == null || dto.payment_is_approved == 'N')}">
                                            결제 대기
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B02' && dto.payment_id != null && dto.payment_is_approved != null && dto.payment_is_approved == 'Y'}">
                                            결제 완료
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B03'}">
                                            예약 취소
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B04'}">
                                            예약 반려
                                        </c:when>
                                        <c:otherwise>
                                            오류
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div>
                                    <div class="screens-room-myBookings__hiddenValue" hidden
                                         data-value="${dto.booking_id}"></div>
                                    <div>${dto.user_nickname}님이 호스팅하는 집 전체</div>
                                </div>


                                <div>
                                    <span>${dto.booking_checkin_date} ~</span><span>${dto.booking_checkout_date}</span>
                                </div>

                                <div>
                                    <span>${dto.room_address}</span>
                                    <span>${dto.room_address_detail}</span>
                                </div>
                                <div>
                                    <span>${dto.booking_total_pay_amount}</span><span>원</span>
                                </div>
                                <div>${dto.created_at}</div>

                                <div>
                                    <button class="screens-room-myBookings__payment-button-card screens-room-myBookings__button">
                                        카드결제
                                    </button>
                                    <button class="screens-room-myBookings__payment-button-kakao screens-room-myBookings__button">
                                        카카오페이
                                    </button>
                                </div>
                            </div>

                            <div class="screens-room-myBookings__comming-reservation__main-photo__wrapper">
                                <img class="screens-room-myBookings__comming-reservation__main-photo"
                                     src="${dto.room_main_photo}">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="screens-room-myBookings__divide-line"></div>

            <div class="screens-room-myBookings__completed-reservation">
                <div class="screens-room-myBookings__completed-reservation__title">이전여행지</div>

                <div class="screens-room-myBookings__completed-reservation__wrapper">
                    <c:forEach var="dto" items="${list2}" varStatus="status">
                        <div class="screens-room-myBookings__completed-reservation__div">

                            <div class="screens-room-myBookings__completed-reservation__main-photo__wrapper">
                                <img class="screens-room-myBookings__completed-reservation__main-photo"
                                     src="${dto.room_main_photo}">
                            </div>
                            <div class="screens-room-myBookings__completed-reservation__div__info">
                                <div>${dto.room_address}</div>
                                <div>호스트 : ${dto.user_nickname}</div>
                                <div>${dto.booking_checkin_date}
                                    ~ ${dto.booking_checkout_date}</div>
                                <button class="screens-room-myBookings__button screens-room-myBookings__reviewWriteBtn screens-room-myBookings__reviewWriteBtn-${dto.booking_id}"
                                        value="${dto.room_id}"> 리뷰쓰기
                                </button>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>


        </div>
    </div>


</section>
<%--<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>--%>
<script>
    let room_id2 = null;
    let review_stars2 = 0;
    let rating = 'null';

    const reviewWriteBtn = document.querySelectorAll(".screens-room-myBookings__reviewWriteBtn");
    const modalContainer = document.querySelector(".screens-room-myBookings__modalContainer");
    const starBox = document.querySelector(".screens-room-myBookings__modalContent__starBox");
    const stars = document.querySelectorAll(".screens-room-myBookings__modalContent__star");

    const ing_checkin = document.querySelectorAll('.screens-room-myBookings-ing-checkin');
    const ing_checkout = document.querySelectorAll('.screens-room-myBookings-ing-checkout');
    const ing_year = document.querySelectorAll('.screens-room-myBookings-ing-year');

    const reservationStatusIds = document.querySelectorAll(
            ".screens-room-myBookings__comming-reservation__div__status_id");

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
    }

    $(".screens-room-myBookings__modalContent__form").submit(function (event) {
        event.preventDefault();
        $(`input[name="review_stars"]`).val(rating);
        $(`input[name="room_id"]`).val(room_id2);
        this.submit();
    });

    //결제 상태에 따라 결제버튼 활성화 및 취소 기능

    reservationStatusIds.forEach(statusId => {
        const statusText = statusId.textContent.trim(); // 상태 텍스트 가져오기

        // "결제 대기" 상태인 경우
        if (statusText === "결제 대기") {
            const buttonCard = statusId.parentElement.querySelector(
                    ".screens-room-myBookings__payment-button-card");
            const buttonKakao = statusId.parentElement.querySelector(
                    ".screens-room-myBookings__payment-button-kakao");

            // 버튼이 존재하는 경우 활성화, 존재하지 않으면 아무 작업도 하지 않음
            if (buttonCard) {
                buttonCard.disabled = false; // 활성화
            }
            if (buttonKakao) {
                buttonKakao.disabled = false; // 활성화
            }
        } else {
            // "결제 대기" 상태가 아닌 경우 해당 버튼들 삭제
            const buttons = statusId.parentElement.querySelectorAll(
                    ".screens-room-myBookings__payment-button-card, .screens-room-myBookings__payment-button-kakao");
            buttons.forEach(button => {
                button.remove(); // 버튼 삭제
            });
        }
    });

    //TODO 아래 함수 작동안함, 수정 필요 (한나)
    // reservationStatusIds.forEach(statusId => {
    //     const statusText = statusId.textContent.trim(); // 상태 텍스트 가져오기
    //
    //     // "예약 취소" 또는 "예약 반려" 상태인 경우
    //     if (statusText === "예약 취소" || statusText === "예약 반려") {
    //         const imageWrapper = statusId.parentElement.querySelector(
    //                 ".screens-room-myBookings__comming-reservation__main-photo__wrapper");
    //         const mainPhoto = imageWrapper.querySelector(
    //                 ".screens-room-myBookings__comming-reservation__main-photo");
    //
    //         // 이미지를 회색으로 변환
    //         console.log("main" + mainPhoto);
    //         if (mainPhoto) {
    //             mainPhoto.style.filter = "grayscale(100%)"; // 이미지 회색으로 변환
    //         }
    //     }
    // });

</script>
<script src="/resources/js/payment/payment.js"></script>
</body>
</html>