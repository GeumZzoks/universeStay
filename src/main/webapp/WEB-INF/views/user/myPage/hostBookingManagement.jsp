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
    <title>예약관리</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        .screens-user-myPage-hostBookingManagement__body * {
            box-sizing: border-box;
        }

        .screens-user-myPage-hostBookingManagement__container {
            margin-left: 10vw;
            width: 80vw;
            text-align: center;
        }

        .screens-user-myPage-hostBookingManagement__content {
            margin-top: 5rem;
            margin-bottom: 5rem;
            text-align: center;
        }

        .screens-user-myPage-hostBookingManagement__content > div:nth-child(1) {
            font-family: 'NotoSansKR-Medium';
            font-size: 4rem;
            margin-bottom: 1rem;
            text-align: left;
        }

        .screens-user-myPage-hostBookingManagement__content__requests {
            display: flex;
            flex-direction: column;
        }

        .screens-user-myPage-hostBookingManagement__content__request {
            border: 1px solid gray;
            border-radius: 15px;
            margin-top: 3rem;
            display: flex;
            flex-direction: row;
            box-shadow: 0px 0px 18px 3px gray;
        }

        .screens-user-myPage-hostBookingManagement__content__request > div:nth-child(1) {
            padding-left: 1rem;
            display: flex;
            flex-direction: column;
            word-wrap: break-word;
            flex-basis: 90%;
        }

        .screens-user-myPage-hostBookingManagement__content__request > div:nth-child(2) {
            padding-right: 1rem;
            display: flex;
            flex-direction: column;
            flex-basis: 10%;
        }

        .screens-user-myPage-hostBookingManagement__content__request-table {
            /*border-collapse: separate;*/
            /*border-spacing: 1rem 1rem;*/

        }

        .screens-user-myPage-hostBookingManagement__content__request-thead {
            line-height: 3.5rem;
            font-family: 'NotoSansKR-Medium';
            font-size: 1.3rem;

        }

        .screens-user-myPage-hostBookingManagement__content__request-thead > tr > th {
            border-bottom: 1px solid gray;
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody {
            border-collapse: separate;
            border-spacing: 1rem 1rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody tr {
            text-align: center;
        }

        .screens-user-myPage-hostBookingManagement__content__request-body-row {
            height: 1rem;

        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody td {
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody > tr > td:nth-child(1) {
            text-align: left;
            width: 10rem;
            max-width: 10rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody > tr > td:nth-child(2) {
            text-align: left;
            width: 10rem;
            max-width: 10rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody > tr > td:nth-child(3) {
            width: 10rem;
            max-width: 10rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody > tr > td:nth-child(4) {
            width: 10rem;
            max-width: 10rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-tbody > tr > td:nth-child(5) {
            width: 10rem;
            max-width: 10rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-div2 {
            display: flex;
            flex-direction: column;
        }

        .screens-user-myPage-hostBookingManagement__content__request-div2 > div:nth-child(1) {
            flex-basis: 50%;
            display: flex;
            flex-direction: column;
            justify-content: end;
            padding-bottom: 0.5rem;
        }

        .screens-user-myPage-hostBookingManagement__content__request-div2 > div:nth-child(2) {
            flex-basis: 50%;
            display: flex;
            flex-direction: column;
            justify-content: start;
            padding-top: 0.5rem;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section class="screens-user-myPage-hostBookingManagement__body">
    <div class="screens-user-myPage-hostBookingManagement__container">
        <div class="screens-user-myPage-hostBookingManagement__content">
            <div>예약신청</div>
            <div class="screens-user-myPage-hostBookingManagement__content__requests">
                <div class="screens-user-myPage-hostBookingManagement__content__request">
                    <div class="screens-user-myPage-hostBookingManagement__content__request-div1">
                        <table class="screens-user-myPage-hostBookingManagement__content__request-table">
                            <thead class="screens-user-myPage-hostBookingManagement__content__request-thead">
                            <tr>
                                <th>예약번호</th>
                                <th>방 이름</th>
                                <th>예약자 이름</th>
                                <th>예약 인원</th>
                                <th>예약 기간</th>
                            </tr>
                            </thead>
                            <tbody class="screens-user-myPage-hostBookingManagement__content__request-tbody">
                            <tr class="screens-user-myPage-hostBookingManagement__content__request-body-row"></tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr class="screens-user-myPage-hostBookingManagement__content__request-body-row"></tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="screens-user-myPage-hostBookingManagement__content__request-div2">
                        <div>
                            <button class="screens-user-myPage-hostBookingManagement__content__request-aprvbtn">승인
                            </button>
                        </div>
                        <div>
                            <button class="screens-user-myPage-hostBookingManagement__content__request-rjtbtn">거부
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script>
    const requests = document.querySelector('.screens-user-myPage-hostBookingManagement__content__requests');
    const request = document.querySelector('.screens-user-myPage-hostBookingManagement__content__request');
    const copiedRequest = request.cloneNode(true);
    console.log(copiedRequest);
    const div1 = document.querySelector('screens-user-myPage-hostBookingManagement__content__request-div1');
    const div2 = document.querySelector('screens-user-myPage-hostBookingManagement__content__request-div2');
    const div1_table = document.querySelector('.screens-user-myPage-hostBookingManagement__content__request-table');
    const div1_thead = document.querySelector('.screens-user-myPage-hostBookingManagement__content__request-thead');
    const div1_tbody = document.querySelector('.screens-user-myPage-hostBookingManagement__content__request-body');
    const aprvButton = document.querySelector('.screens-user-myPage-hostBookingManagement__content__request-aprvbtn');
    const rjtButton = document.querySelector('.screens-user-myPage-hostBookingManagement__content__request-rjtbtn');

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
            console.log(cloneElement);
            cloneElement.querySelector('.screens-user-myPage-hostBookingManagement__content__request-table td:nth-child(1)').textContent = component.b_booking_id;
            cloneElement.querySelector('.screens-user-myPage-hostBookingManagement__content__request-table td:nth-child(2)').textContent = component.r_room_name;
            cloneElement.querySelector('.screens-user-myPage-hostBookingManagement__content__request-table td:nth-child(3)').textContent = component.u_user_name;
            cloneElement.querySelector('.screens-user-myPage-hostBookingManagement__content__request-table td:nth-child(4)').textContent = component.b_booking_num_of_guest;
            cloneElement.querySelector('.screens-user-myPage-hostBookingManagement__content__request-table td:nth-child(5)').textContent = component.b_booking_checkin_date + " ~ " + component.b_booking_checkout_date;
            cloneElement.children[1].children[0].children[0].addEventListener("click", function () {
                clickBtnAjax(component.b_booking_id, "Y");
            })
            cloneElement.children[1].children[1].children[0].addEventListener("click", function () {
                clickBtnAjax(component.b_booking_id, "N");
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
</script>
</body>
</html>
