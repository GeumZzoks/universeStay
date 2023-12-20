<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/12/08
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>위시리스트</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>

<div id="screens-user-wishlist__container">
    <h2>위시리스트</h2>
    <br>
    <div class="screens-user-wishlist__main__wrapper">
        <c:forEach var="wishListDto" items="${list}">
            <div class="screens-user-wishlist__room__wrapper" value="${wishListDto.room_id}" data-key="test"
                 onclick="location.href='/room/${wishListDto.room_id}'">
                <div class="screens-user-wishlist__room__img__wrapper">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="img" items="${wishListDto.room_img_url_list}">
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
                <form class="screens-user-wishlist-btn">
                    <button class="screens-user-wishlist-btn__wished"
                            value="${wishListDto.room_id}"></button>
                </form>
                <div class="screens-user-wishlist__room-info__wrapper">

                    <div class="screens-user-wishlist__room-detail__wrapper">
                        <span class="screens-user-wishlist__room-location">${wishListDto.room_address}</span>
                        <span class="screens-user-wishlist__room-title">${wishListDto.room_name}</span>
                    </div>
                    <div class="screens-user-wishlist__room-price__wrapper">
                        <span class="screens-user-wishlist__room-stars">✭${wishListDto.room_stars_avg}</span><br>
                        <span class="screens-user-wishlist__room-price">₩${wishListDto.room_weekend_price} /박</span>
                    </div>
                </div>
            </div>
            <div id="${wishListDto.room_id}" class="modal-div"
                 style="position: fixed; bottom: 5%; left: 3%; width: 250px; height: 60px; display: none; z-index: 5;
                         box-shadow: 1px 1px 4px 0 darkgray; border-radius: 10px; background-color: white;
                        font-size: 12px; padding: 10px 10px 0 10px;">
                <img class="modal-img" src="${wishListDto.room_main_photo}"
                     style="float: left; width: 50px; height: 50px; margin-right: 10px; border-radius: 5px;">
                <h4 style="float: left; color: #717171; margin-top: 6px; width: 190px;"><br><br>
                    <h3 style="float: left; font-size: 14px; font-weight: 500; margin-top: 10px;">${wishListDto.room_name}</h3>
                </h4>
            </div>

        </c:forEach>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
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

    $(document).ready(function () {
        $('.screens-user-wishlist-btn button').on('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var roomID = $(this).val();
            var button = $(this);

            $.ajax({
                url: "/user/wishLists/active",
                type: "POST",
                dataType: "text",
                data: {room_id: roomID},
                success: function (response) {
                    $('.modal-div').finish();
                    if (response === 'DEL_OK' || response === 'IST_OK') {
                        button.parents('.screens-user-wishlist__room__wrapper').fadeOut('slow');
                        $('.modal-div h4').text('위시리스트에서 삭제되었습니다.')
                        $("#" + roomID).fadeIn('slow').delay(1000).fadeOut('slow');
                    } else {
                        alert("알 수 없는 문제가 발생했습니다. 다시 시도해주세요.");
                    }
                },
                error: function () {
                    alert("알 수 없는 문제가 발생했습니다. 다시 시도해주세요.")
                }
            });
        });
    });
</script>
</body>
</html>
