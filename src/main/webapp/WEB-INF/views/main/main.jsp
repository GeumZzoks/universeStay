<%@ page import="org.springframework.ui.Model" %>
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
</head>
<body class="screens-user-main__body">
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/user/nav.jsp"/>
<section class="screens-user-main__main">
    <div class="screens-user-main__main__wrapper"></div>
</section>
<div class="screens-user-main__back-drop" style="display: none;">
    <img src="/resources/img/spinner/spinner.gif">
</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="/resources/js/main/main.js"></script>
<script>

    function handleButtonClick(event) {
        event.stopPropagation();
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

    //페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
    let currentPage = 1;
    let totalPageCount = 1; // 초기값 설정

    const wishList = function () {
        $('.screens-user-main__wishlist button').off('click');
        $('.screens-user-main__wishlist button').on('click', function (e) {
            // form 전송 시 새로고침 안하기(기본 이벤트 x)
            e.preventDefault();
            // 새로고침 안할 시 다른 요소의 이벤트 받지 않기
            e.stopPropagation();
            // 변수 선언
            // roomID는 list의 각 value값을 가져옴
            var roomID = $(this).val();
            button = $(this);

            // WishList ajax
            $.ajax({
                url: "/user/myPage/wishLists/active",
                type: "POST",
                dataType: "text",
                data: {room_id: roomID},
                success: function (response) {
                    $('.modal-div').finish();
                    if (response === 'DEL_OK') {
                        button.toggleClass(
                                'screens-user-main__wishlist__not_wished screens-user-main__wishlist__wished');
                        $('.modal-div h4').text('위시리스트에서 삭제되었습니다.')
                        $("#" + roomID).fadeIn('slow').delay(3000).fadeOut('slow');
                    } else if (response === 'IST_OK') {
                        button.toggleClass(
                                'screens-user-main__wishlist__not_wished screens-user-main__wishlist__wished');
                        $('.modal-div h4').text('위시리스트에 추가되었습니다.')
                        $("#" + roomID).fadeIn('slow').delay(3000).fadeOut('slow');
                    } else {
                        alert("로그인이 필요합니다.");
                        location.href = "/user/loginForm";
                    }
                }
                ,
                error: function () {
                    alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의 부탁드립니다.")
                    location.href = "/";
                }
            });
        })
        ;
    }

    const getList = function (currentPage) {
        const queryString = window.location.search;
        const queryStringWithoutQuestionMark = queryString.substring(1); // substring(1)으로 첫 번째 문자인 '?'를 제외한 문자열을 가져옴
        let wished = "";

        // 무한 스크롤
        $.ajax({
            url: "/scroll" + "?currentPage=" + currentPage + "&"
                    + queryStringWithoutQuestionMark,
            method: "GET",
            success: function (data) {
                totalPageCount = data[0].totalPageCount;

                data.forEach(function (room) {
                    //돈을 1000원 단위로 바꿔서 , 삽입
                    const refinedPrice = priceToString(room.room_weekend_price);
                    let starsAvg = room.room_stars_avg === undefined ? 'new!' : parseFloat(
                            room.room_stars_avg).toFixed(1);
                    if (room.has_wished != 1) {
                        wished = "<button class='screens-user-main__wishlist__not_wished' value=";
                    } else {
                        wished = "<button class='screens-user-main__wishlist__wished' value=";
                    }

                    $(".screens-user-main__main__wrapper").append(
                            '<div class="screens-user-main__room__wrapper" value="'
                            + room.room_id
                            + '" onclick="location.href=\'/room/' + room.room_id + '\'">' +
                            '<div class="screens-user-main__room__img__wrapper">' +
                            '<div class="swiper mySwiper">' +
                            '<div class="swiper-wrapper">' +
                            room.room_img_url_list.map(function (img) {
                                return '<div class="swiper-slide">' +
                                        '<img src="' + img + '">' +
                                        '</div>';
                            }).join('') +
                            '</div>' +
                            '<div class="swiper-pagination"></div>' +
                            '<div class="swiper-button-prev swiper-button" onclick="handleButtonClick(event)"></div>'
                            +
                            '<div class="swiper-button-next swiper-button" onclick="handleButtonClick(event)"></div>'
                            +
                            '</div>' +
                            '</div>' +
                            '<span class="screens-user-main__room-location">'
                            + room.room_address
                            + '</span>' +
                            '<span class="screens-user-main__room-title">' + room.room_name
                            + '</span>' +
                            '<div class="screens-user-main__room-price__wrapper">' +
                            '<span>₩</span> <span class="screens-user-main__room-price">'
                            + refinedPrice + '</span><span> /박</span>' +
                            '</div>' +
                            '<span class="screens-user-main__room-stars">✭'
                            + starsAvg
                            + '</span>'
                            + '<form class="screens-user-main__wishlist">'
                            + wished
                            + room.room_id
                            + '>' + '</button>'
                            + '</form>'
                            + '</div>'
                            + '<div id="'
                            + room.room_id
                            + '" class="modal-div" style="z-index: 999; position: fixed; bottom: 9%; left: 3%; width: 250px; height: 60px; display: none; z-index: 99; box-shadow: 1px 1px 4px 0 darkgray; border-radius: 10px; background-color: white; font-size: 12px; padding: 10px 10px 0 10px;">'
                            + ' <img class="modal-img" src="'
                            + room.room_main_photo
                            + '" style="float: left; width: 50px; height: 50px; margin-right: 10px; border-radius: 5px;">'
                            + '<h4 style="float: left; color: #717171; margin-top: 6px; width: 190px;">'
                            + '<h3 style="float: left; font-size: 14px; font-weight: 500; margin-top: 10px; width: 180px; height: 12px; overflow: hidden; text-overflow: ellipsis; white-space:nowrap;">'
                            + room.room_name
                            + '</h3>'
                            + '</h4>'
                            + '</div>'
                    )
                    ;
                });

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
                wishList()
            }

        });
    }

    let isScrolling = false;

    $(window).on("scroll", function () {
        isScrolling = true;

        let scrollTop = $(window).scrollTop();
        let windowHeight = $(window).height();
        let documentHeight = $(document).height();
        let isBottom = scrollTop + windowHeight >= documentHeight;

        if (isBottom) {
            if (currentPage === totalPageCount) {
                isScrolling = false;
                return;
            }

            currentPage++;

            window.scrollTo({
                top: scrollTop - 150,
                behavior: "auto"
            });

            getList(currentPage);

            setTimeout(function () {
                isScrolling = false; // 스크롤 이벤트의 디바운싱 설정 해제
            }, 300); // 0.3초 딜레이
        }
    });

    $(document).ready(function () {
        window.scrollTo(0, 0);
        getList(1)

    });

    //돈 원화 단위로 바꿔주는 함수
    const priceToString = function (price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
</script>
</body>
</html>