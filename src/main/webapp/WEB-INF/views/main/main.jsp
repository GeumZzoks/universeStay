<%@ page import="org.springframework.ui.Model" %><%--
  Created by IntelliJ IDEA.
  User: hannaryu
  Date: 11/28/23
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>main</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/user/nav.jsp"/>

<section class="screens-user-main__main">
    <div class="screens-user-main__main__wrapper">
        <c:forEach var="room" items="${roomList}">
            <div class="screens-user-main__room__wrapper" value="${room.room_id}" data-key="test">
                <div class="screens-user-main__room__img__wrapper">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="img" items="${room.room_img_url_list}">
                                <div class="swiper-slide">
                                    <img src="${img}">
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev swiper-button"></div>
                        <div class="swiper-button-next swiper-button">
                        </div>
                    </div>
                </div>
                <form class="screens-user-main__wishlist">
                    <c:choose>
                        <c:when test="${room.has_wished ne 1}">
                            <button class="screens-user-main__wishlist__not_wished"
                                    value="${room.room_id}"></button>
                        </c:when>
                        <c:otherwise>
                            <button class="screens-user-main__wishlist__wished"
                                    value="${room.room_id}"></button>
                        </c:otherwise>
                    </c:choose>
                </form>
                <span class="screens-user-main__room-location">${room.room_address}</span>
                <span class="screens-user-main__room-title">${room.room_name}</span>
                <div class="screens-user-main__room-price__wrapper">
                    <span>₩</span> <span
                        class="screens-user-main__room-price">${room.room_weekend_price}</span><span> /박</span>
                </div>
                <span class="screens-user-main__room-stars">✭${room.room_stars_avg}</span>
            </div>
            <div id="${room.room_id}" class="modal-div"
                 style="position: fixed; bottom: 5%; left: 3%; width: 250px; height: 60px; display: none; z-index: 5;
                         box-shadow: 1px 1px 4px 0 darkgray; border-radius: 10px; background-color: white;
                        font-size: 12px; padding: 10px 10px 0 10px;">
                <img class="modal-img" src="${room.room_main_photo}"
                     style="float: left; width: 50px; height: 50px; margin-right: 10px; border-radius: 5px;">
                <h4 style="float: left; color: #717171; margin-top: 6px; width: 170px;">
                    <h3 style="float: left; font-size: 14px; font-weight: 500; margin-top: 10px;">${room.room_name}</h3>
                </h4>
            </div>
        </c:forEach>
    </div>


</section>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
</body>


<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="/resources/js/main/main.js"></script>
<script>

    //슬라이더 생성하는 JS 코드
    const mySwiper = new Swiper('.mySwiper',
        {
            pagination: {
                el: ".swiper-pagination",
            },
            loop: true,
            direction: 'horizontal',
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            }
        });

    const swiperButtons = document.querySelectorAll(".swiper-button");
    for (const swiperButton of swiperButtons) {
        swiperButton.addEventListener('click', function (event) {
            event.stopPropagation(); // 이벤트 전파 중단
        });
    }

    const statusId = "${statusId}";
    if (statusId == "U02") {
        alert("현재 휴면 상태입니다. 해제 하시겠습니까?");
    }
    if (statusId == "U03") {
        alert("정지된 아이디입니다. 관리자에게 문의 하세요");
    }
    if (statusId == "U04") {
        alert("회원탈퇴한 아이디입니다. 관리자에게 문의 하세요");
    }

    $(document).ready(function () {
        $('.screens-user-main__wishlist button').on('click', function (e) {
            // form 전송 시 새로고침 안하기(기본 이벤트 x)
            e.preventDefault();
            // 새로고침 안할 시 다른 요소의 이벤트 받지 않기
            e.stopPropagation();
            // 변수 선언
            // roomID는 list의 각 value값을 가져옴
            var roomID = $(this).val();
            button = $(this);

            // ajax
            $.ajax({
                url: "/user/wishLists/active",
                type: "POST",
                dataType: "text",
                data: {room_id: roomID},
                success: function (response) {
                    $('.modal-div').finish();
                    if (response === 'DEL_OK') {
                        button.toggleClass('screens-user-main__wishlist__not_wished screens-user-main__wishlist__wished');
                        $('.modal-div h4').text('위시리스트에서 삭제되었습니다.')
                        $("#" + roomID).fadeIn('slow').delay(3000).fadeOut('slow');
                    } else if (response === 'IST_OK') {
                        button.toggleClass('screens-user-main__wishlist__not_wished screens-user-main__wishlist__wished');
                        $('.modal-div h4').text('위시리스트에 추가되었습니다.')
                        $("#" + roomID).fadeIn('slow').delay(3000).fadeOut('slow');
                    } else {
                        alert("알 수 없는 문제가 발생했습니다. 다시 시도해주세요.");
                    }
                },
                error: function () {
                    location.href = "/user/loginForm";
                }
            });
        });
    });
</script>
</body>
</html>
