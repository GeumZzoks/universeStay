<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-14
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/img/favi.ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/img/favi.ico//apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/img/favi.ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/favi.ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="/resources/img/favi.ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="/resources/img/favi.ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144"
          href="/resources/img/favi.ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="/resources/img/favi.ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180"
          href="/resources/img/favi.ico/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"
          href="/resources/img/favi.ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32"
          href="/resources/img/favi.ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96"
          href="/resources/img/favi.ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16"
          href="/resources/img/favi.ico/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <title>예약관리</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
      .screens-hostBookingManagement-flex-row {
        display: flex;
        flex-direction: row;
      }

      .screens-hostBookingManagement-flex-column {
        display: flex;
        flex-direction: column;
      }

      .screens-user-myPage-hostBookingManagement > section,
      .screens-user-myPage-hostBookingManagement > section * {
        box-sizing: border-box;
      }

      .screens-user-myPage-hostBookingManagement__section {
        position: absolute;
        top: 0px;
        left: 0px;
        width: 100vw;
        height: 100vh;
      }

      .screens-user-myPage-hostBookingManagement__container {
        position: relative;
        top: 100px;
        height: calc(100% - 100px);
        width: 90%;
        margin-left: 10%;
        overflow: auto;

      }

      .screens-user-myPage-hostBookingManagement__newBookings {
        margin-left: 0.5rem;
        width: 40%;
        height: 100%;
      }

      .screens-user-myPage-hostBookingManagement__newBookings-banner1 {
        margin-top: 2rem;
        margin-bottom: 2rem;
        font-size: 1.5rem;
        font-family: 'NotoSansKR-Medium';
        color: gray;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid gray;
      }

      .screens-user-myPage-hostBookingManagement__requests {
        word-wrap: break-word;
      }

      .screens-user-myPage-hostBookingManagement__request {
        padding: 1rem;
        box-shadow: 0px 0px 5px 0px gray;
        border-radius: 12px;
        margin-bottom: 1.5rem;
        display: none;
      }

      .screens-user-myPage-hostBookingManagement__request__head > div {
        font-family: 'NotoSansKR-Regular';
        margin-bottom: 0.5rem;
      }

      .screens-user-myPage-hostBookingManagement__request__head > div:nth-child(1) {
        font-family: 'NotoSansKR-Bold';
      }

      .screens-user-myPage-hostBookingManagement__request__telNum {
        margin-top: 0.5rem;
      }

      .screens-user-myPage-hostBookingManagement__request__roomName {
        margin-bottom: 1rem;
        font-size: 1.2rem;
      }

      .screens-user-myPage-hostBookingManagement__request__btn > div {
        height: 3.2rem;
        width: 3.2rem;
      }

      .screens-user-myPage-hostBookingManagement__request__btn > div > img:hover {
        height: 3.2rem;
        width: 3.2rem;
      }

      .screens-user-myPage-hostBookingManagement__request__btn > div > img {
        height: 3rem;
        width: 3rem;
      }

    </style>
</head>
<body class="screens-user-myPage-hostBookingManagement">
<jsp:include page="/WEB-INF/views/common/user/hostHeader.jsp"/>
<section class="screens-user-myPage-hostBookingManagement__section">
    <div class="screens-user-myPage-hostBookingManagement__container">
        <div class="screens-user-myPage-hostBookingManagement__newBookings screens-hostBookingManagement-flex-column">
            <div class="screens-user-myPage-hostBookingManagement__newBookings-banner1"><p>예약신청</p>
            </div>
            <div class="screens-user-myPage-hostBookingManagement__requests screens-hostBookingManagement-flex-column">
                <div class="screens-user-myPage-hostBookingManagement__request screens-hostBookingManagement-flex-column">
                    <div class="screens-user-myPage-hostBookingManagement__request__head screens-hostBookingManagement-flex-column">
                        <div class="screens-user-myPage-hostBookingManagement__request__roomName screens-hostBookingManagement-flex-row">
                            <div><p>랸나네 코zyhouse</p></div>
                        </div>
                        <div class="screens-user-myPage-hostBookingManagement__request__period screens-hostBookingManagement-flex-row">
                            <div><p>231224 ~ 231225</p></div>
                        </div>
                        <div class="screens-user-myPage-hostBookingManagement__request__userName screens-hostBookingManagement-flex-row">
                            <div><p>nick</p></div>
                        </div>
                        <div class="screens-user-myPage-hostBookingManagement__request__peopleNum screens-hostBookingManagement-flex-row">
                            <div><p>4</p></div>
                        </div>
                        <div class="screens-user-myPage-hostBookingManagement__request__totalPay screens-hostBookingManagement-flex-row">
                            <div><p>300,000원</p></div>
                        </div>
                        <div class="screens-user-myPage-hostBookingManagement__request__telNum screens-hostBookingManagement-flex-row">
                            <div><p>010-1234-5678</p></div>
                        </div>
                    </div>
                    <div class="screens-user-myPage-hostBookingManagement__request__btn screens-hostBookingManagement-flex-row">
                        <div class="screens-user-myPage-hostBookingManagement__request__agreeBtn">
                            <img
                                    src="/resources/img/symbol/check-square-svgrepo-com.svg"
                                    alt="승인"></div>
                        <div class="screens-user-myPage-hostBookingManagement__request__disagreeBtn">
                            <img
                                    src="/resources/img/symbol/x-square-svgrepo-com.svg" alt="거부">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    const requests = document.querySelector('.screens-user-myPage-hostBookingManagement__requests');
    const request = document.querySelector('.screens-user-myPage-hostBookingManagement__request');
    const copiedRequest = request.cloneNode(true);
    copiedRequest.style.display = 'flex';

    window.onload = function () {
        requestPageAjax();
    };

    function emptyRequests() {
        if (requests) {
            while (requests.firstChild) {
                requests.removeChild(requests.firstChild);
            }
        }
    }

    function fillRequests(list) {
        list.forEach(function (component) {
            //true 입력시 자식까지 모두 복사 빈괄호로 제출하면 default값인 false가 자동 입력된다. 자식은 복사가 되지 않는다.
            const cloneElement = copiedRequest.cloneNode(true);
            let checkinDate = convertTimestampToKoreanDate(component.b_booking_checkin_date);
            let checkoutDate = convertTimestampToKoreanDate(component.b_booking_checkout_date);
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__roomName > div:nth-of-type(1) > p').textContent = component.r_room_name;
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__period > div:nth-of-type(1) > p').textContent = checkinDate
                    + `\u00a0\u00a0\u00a0~\u00a0\u00a0\u00a0\u00a0` + checkoutDate;
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__userName > div:nth-of-type(1) > p').textContent = component.u_user_name;
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__peopleNum > div:nth-of-type(1) > p').textContent = component.b_booking_num_of_guest
                    + " 명 ";
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__totalPay > div:nth-of-type(1) > p').textContent = formatKoreanCurrency(
                    component.b_booking_total_pay_amount) + "원";
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__telNum > div:nth-of-type(1) > p').textContent = component.u_user_phone_num1;
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__agreeBtn > img').addEventListener(
                    "click", function () {
                        if (confirm("예약을 승인 하시겠습니까?")) {
                            clickBtnAjax(component.b_booking_id, "Y");
                            alert("예약 승인 완료!")
                        } else {
                            alert("예약승인을 취소하셨습니다.");
                        }

                    })
            cloneElement.querySelector(
                    '.screens-user-myPage-hostBookingManagement__request__disagreeBtn > img').addEventListener(
                    "click", function () {
                        if (confirm("예약을 거절 하시겠습니까?")) {
                            clickBtnAjax(component.b_booking_id, "N");
                            alert("예약을 거절 하셨습니다.")
                        } else {
                            alert("예약거절을 취소하셨습니다.")
                        }
                    })
            requests.appendChild(cloneElement);
        })
    }

    function clickBtnAjax(booking_id, is_approve) {
        $.ajax({
            type: 'post',
            url: "<c:url value='/user/myPage/hostbookingmanagement/aprv'/>",
            data: {
                "booking_id": booking_id,
                "is_approve": is_approve
            },
            success: function (result) {
                emptyRequests();
                fillRequests(result);
                console.log("clickBtnAjax() 성공");
                console.log(result);
            }
            ,
            error: function (result) {
                console.log("clickBtnAjax() 에러");
            }
        })
    }

    function requestPageAjax() {
        $.ajax({
            type: 'post',
            url: "<c:url value='/user/myPage/hostbookingmanagement'/>",
            success: function (result) {
                emptyRequests();
                fillRequests(result);
                console.log("requestPageAjax() 성공");
                console.log(result);
            },
            error: function (result) {
                console.log("requestPageAjax() 에러");
            }
        })
    }

    function convertTimestampToKoreanDate(timestamp) {
        // MySQL timestamp는 밀리초 단위이므로 초 단위로 변환
        const seconds = timestamp / 1000;

        // JavaScript Date 객체 생성
        const date = new Date(seconds * 1000);

        // 한국 시간대로 조정 (KST: UTC+9)
        date.setHours(date.getHours() + 9);

        // 날짜를 yyyy-MM-dd 형식의 문자열로 변환
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');

        // 결과 문자열 반환
        return year + '년 ' + month + '월 ' + day + '일 ';
        <%--return `${year}-${month}-${day}`;--%>
    }

    function formatKoreanCurrency(integerNumber) {
        // 숫자를 문자열로 변환
        const numString = String(integerNumber);

        // 정수 부분에 콤마 찍기
        const formattedIntegerPart = numString.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

        return formattedIntegerPart;
    }
</script>
</body>
</html>
