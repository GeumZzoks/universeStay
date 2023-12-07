<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@OauthProperties['KAKAO_JavaScript_KEY']" var="KakaoApiKey"/>
<html>
<head>
    <title>roomDetail</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<div class="screens-room-roomDetail__wrapper">
    <%--  section-1  --%>
    <div class="screens-room-roomDetail__section-1">
        <h1 class="screens-room-roomDetail__section-1__room-name">전통기와와 한옥 산들아 본채</h1>
        <div class="screens-room-roomDetail__section-1__info-1">
            <div class="screens-room-roomDetail__section-1__region">Seo-myeon, Namhae, 경상남도 한국</div>
            <div class="screens-room-roomDetail__section-1__btns">
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-1__btn screens-room-roomDetail__section-1__btn-share screens-room-roomDetail__btn-shrink">
                    <span class="screens-room-roomDetail__btn-share__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                             aria-hidden="true" role="presentation" focusable="false" style="display: block;
                             fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;">
                            <g fill="none">
                                <path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0
                                0 1 1.4 0L26 13">
                                </path>
                            </g>
                        </svg>
                    </span>
                    <span class="screens-room-roomDetail__btn-share__text">
                        공유하기
                    </span>
                </button>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-1__btn screens-room-roomDetail__section-1__btn-save screens-room-roomDetail__btn-shrink">
                    <span class="screens-room-roomDetail__btn-share__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                             aria-hidden="true" role="presentation"
                             focusable="false" style="display: block; fill: none; height: 16px; width: 16px;
                             stroke: currentcolor; stroke-width: 2; overflow: visible;">
                            <path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16
                            8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z">
                            </path>
                        </svg>
                    </span>
                    <span class="screens-room-roomDetail__btn-share__text">
                        저장
                    </span>
                </button>
            </div>
        </div>
    </div>
    <%--  section-2  --%>
    <div class="screens-room-roomDetail__section-2">
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
            <img class="screens-room-roomDetail__room-photo__img"
                 src="/resources/img/mock/room1.webp" alt="">
        </button>
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
            <img class="screens-room-roomDetail__room-photo__img"
                 src="/resources/img/mock/room2.webp" alt="">
        </button>
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
            <img class="screens-room-roomDetail__room-photo__img"
                 src="/resources/img/mock/room3.webp" alt="">
        </button>
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
            <img class="screens-room-roomDetail__room-photo__img"
                 src="/resources/img/mock/room4.webp" alt="">
        </button>
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
            <img class="screens-room-roomDetail__room-photo__img"
                 src="/resources/img/mock/room5.webp" alt="">
        </button>
    </div>
    <%--  section-3  --%>
    <div class="screens-room-roomDetail__section-3">
        <div class="screens-room-roomDetail__section-3__room-info">
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-1">
                <div class="screens-room-roomDetail__section-3__info-1__desc">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-1__desc1">
                        호스트 이름 님이 호스팅하는
                        펜션
                    </div>
                    <div class="screens-room-roomDetail__section-3__info-1__desc2">최대 인원 15명 · 침실 3개
                        · 욕실 1.5개
                    </div>
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-1__profile">
                    <img class="screens-room-roomDetail__section-3__info-1__profile-img"
                         src="/resources/img/mock/profile-img.jpeg" alt="">
                </button>
            </div>
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-2">
                <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-2__desc1">
                    숙소 편의시설
                </div>
                <ul class="screens-room-roomDetail__section-3__info-2__desc2">
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">마리나 전망</div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M2.61 1h13.34c.28-.02.58.08.8.33l.08.12 12 18a1 1 0 0 1-.72 1.54L28 21H17v2h12v1c0 1.84-.62 3.53-1.66 4.88l.13.1c.36.3.83.48 1.34.51l.19.01v2c-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1.01.15-1.4.41l-.13.1c-.77.65-1.77.99-2.8.99-.96 0-1.88-.29-2.62-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1 .15-1.39.41l-.14.1c-.76.65-1.77.99-2.8.99-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.95-.52-1.53-.52-.51 0-1 .15-1.38.41l-.14.1c-.7.6-1.6.93-2.55.98L3 31.5v-2c.52 0 1-.15 1.39-.41l.27-.21a7.99 7.99 0 0 1-1.64-4.3L3 24.26 2.98 23H15V9H2.61l1.34-4zm24.3 24H5.09l.02.09c.2 1.13.73 2.16 1.48 2.97a4.48 4.48 0 0 1 3.56.92c.4.33.95.52 1.53.52a2.4 2.4 0 0 0 1.52-.52A4.38 4.38 0 0 1 16 28c.95 0 1.87.29 2.61.83l.2.15c.4.33.94.52 1.52.52.52 0 1.01-.15 1.4-.41l.13-.1a4.38 4.38 0 0 1 3.3-.96l.25.03.08-.08a5.97 5.97 0 0 0 1.35-2.6l.06-.28zM17 5.3V19h9.13zM5.39 3l.66 2-.66 2H15V3z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">호수 전망</div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">전용 해변과 인접 - 해변
                        </div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M24 27c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 29c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 29c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 27c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 27zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 24c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 24c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 22c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 22zm0-5c.99 0 1.95.35 2.67 1 .3.29.71.45 1.14.5H28v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 19c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 19c-.5 0-.98.17-1.33.5a3.96 3.96 0 0 1-2.44 1H4v-2h.19a1.95 1.95 0 0 0 1.14-.5A3.98 3.98 0 0 1 8 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 17c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 17zM16 1a9 9 0 0 1 8.76 11.07c.71.13 1.37.45 1.91.94.3.27.71.44 1.14.48l.19.01v2h-.23a3.96 3.96 0 0 1-2.44-1 1.95 1.95 0 0 0-1.14-.5H23.96a2 2 0 0 0-1.15.38l-.14.11A3.98 3.98 0 0 1 20 15.5a3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 14c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1 1.95 1.95 0 0 0-1.14-.5H7.96a2 2 0 0 0-1.15.38l-.14.11a3.96 3.96 0 0 1-2.44 1L4 15.5v-2h.19a1.95 1.95 0 0 0 1.14-.5 3.92 3.92 0 0 1 1.9-.93A9 9 0 0 1 16 1zm0 2a7 7 0 0 0-6.64 9.23c.49.17.93.43 1.31.78.35.32.83.49 1.33.49.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 12c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5a2 2 0 0 0 1.2-.38l.13-.11c.38-.35.82-.6 1.3-.78A7 7 0 0 0 16 3z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">주방</div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M26 1a5 5 0 0 1 5 5c0 6.39-1.6 13.19-4 14.7V31h-2V20.7c-2.36-1.48-3.94-8.07-4-14.36v-.56A5 5 0 0 1 26 1zm-9 0v18.12c2.32.55 4 3 4 5.88 0 3.27-2.18 6-5 6s-5-2.73-5-6c0-2.87 1.68-5.33 4-5.88V1zM2 1h1c4.47 0 6.93 6.37 7 18.5V21H4v10H2zm14 20c-1.6 0-3 1.75-3 4s1.4 4 3 4 3-1.75 3-4-1.4-4-3-4zM4 3.24V19h4l-.02-.96-.03-.95C7.67 9.16 6.24 4.62 4.22 3.36L4.1 3.3zm19 2.58v.49c.05 4.32 1.03 9.13 2 11.39V3.17a3 3 0 0 0-2 2.65zm4-2.65V17.7c.99-2.31 2-7.3 2-11.7a3 3 0 0 0-2-2.83z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">초고속 와이파이 –
                            174Mbps
                        </div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">업무 전용 공간</div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">건물 진입로 무료 주차 – 10대
                            주차 가능
                        </div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">
                            65인치 HDTV + DVD 플레이어, 아마존 프라임
                            비디오, 넷플릭스, 훌루, 일반 케이블 TV, 디즈니+, 크롬캐스트, 프리미엄
                            케이블 TV
                        </div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M9 29v-2h2v-2H6a5 5 0 0 1-5-4.78V8a5 5 0 0 1 4.78-5H26a5 5 0 0 1 5 4.78V20a5 5 0 0 1-4.78 5H21v2h2v2zm10-4h-6v2h6zm7-20H6a3 3 0 0 0-3 2.82V20a3 3 0 0 0 2.82 3H26a3 3 0 0 0 3-2.82V8a3 3 0 0 0-2.82-3z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">전기차 충전시설: 2단계
                        </div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M2 4h2v2h2V4h2v5a3 3 0 0 1-2 2.83V17a1 1 0 0 0 .88 1H10V5a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v23h2v2H2v-2h8v-8H7a3 3 0 0 1-3-2.82v-5.35a3 3 0 0 1-2-2.64V4zm23 0H12.88A1 1 0 0 0 12 5v23h14V5a1 1 0 0 0-1-1zm-4.43 13-1.8 3H21a1 1 0 0 1 .91 1.41l-.05.1-2.1 3.49h-2.33l1.8-3H17a1 1 0 0 1-.91-1.41l.05-.1 2.1-3.49h2.33zM23 6a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1h-8a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h8zm-1 2h-6v4h6V8zM6 8H4v1a1 1 0 0 0 .77.97l.11.02L5 10a1 1 0 0 0 1-.88V8z"></path>
                            </svg>
                        </div>
                    </li>
                    <li class="screens-room-roomDetail__section-3__li">
                        <div class="screens-room-roomDetail__section-3__li__text">숙소 내 보안 카메라</div>
                        <div class="screens-room-roomDetail__section-3__li__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                <path d="M23 3a2 2 0 0 1 2 1.85v1.67l5-2v11.96l-5-2V16a2 2 0 0 1-1.85 2H16.9a5 5 0 0 1-3.98 3.92A5 5 0 0 1 8.22 26H4v4H2V20h2v4h4a3 3 0 0 0 2.87-2.13A5 5 0 0 1 7.1 18H4a2 2 0 0 1-2-1.85V5a2 2 0 0 1 1.85-2H4zM12 14a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm11-9H4v11h3.1a5 5 0 0 1 9.8 0H23zm5 2.48-3 1.2v3.64l3 1.2zM7 7a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                            </svg>
                        </div>
                    </li>
                </ul>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-square screens-room-roomDetail__btn-shrink">
                    편의시설 40개 모두 보기
                </button>
            </div>
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-3">
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        숙소 설명
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        우리는 유서 깊은 툴바그에서 약 10km 거리에 위치한 위치젠부르크 산맥에 자리한 지오돔 체험을 자랑스럽게 생각합니다. 전통적인 B&B
                        대신
                        체험
                        숙박에 대한 수요가 늘어나고 있는 상황에 발맞춰 270헥타르 규모의 농장에서 가장 마음에 드는 지역에 위치한 독특한 임대주택을
                        마련했습니다.
                        수영,
                        낚시, 산악자전거, 하이킹, 자연을 즐기는 것은 손님들이 즐길 수 있는 즐거운 액티비티입니다. 그리고 네, 사진에 보이는 야외 욕조는
                        진짜예요;)
                    </p>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-3__btn screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        공간 설명
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        카르코노세와 야노비치 산맥 사이의 초원에 전원주택이 서 있습니다. 초원과 새들이 지저귀는 소리. 넓은 테라스에서 잔디밭이 내려다보이는
                        넓은
                        테라스에서
                        커피 한 잔의 여유를 즐겨보세요. 비가 오면 창가에 앉아 “폭포” 를 내려다볼 수 있습니다. 겨울 저녁에는 벽난로를 켜고, 여름에는
                        벽난로와
                        귀뚜라미
                        옆에 앉아 있습니다. 지루하신가요? 그럴 수도 있겠네요. 하지만 지저분해서 떠나고 싶지 않으실 거예요!
                    </p>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-3__btn screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        기타 알아두어야 할 사항
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        가을과 봄에는 태양열 컬렉터로 집을 따뜻하게 데워줍니다. 겨울철에는 전기 난방을 사용합니다. 참고: 서리가 내리는 동안 벽난로에서
                        흡연하여 몸을
                        데워야
                        합니다. 코티지는 게스트에게 난방을 제공합니다. 겨울에는 벽난로를 위한 목재가 제공됩니다. 난방 기간 이외에는 목재가 추가로 유료입니다
                        (벽난로,
                        모닥불).
                    </p>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-3__btn screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        게스트와의 교류
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        전화나 WhatsApp으로 사용할 수 있습니다. 농장 하우스는 돔 광경에서 약 400m 떨어져 있습니다.
                    </p>
                </div>
            </div>
        </div>
        <div class="screens-room-roomDetail__section-3__reservation">
            <div class="screens-room-roomDetail__reservation__part-1">
                <div class="screens-room-roomDetail__reservation__price">
                    <span class="screens-room-roomDetail__price__part-1">₩ 166,820</span>
                    <span class="screens-room-roomDetail__price__part-2">/박</span>
                </div>
                <div class="screens-room-roomDetail__reservation__info">
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__check-in-out">
                        <div class="screens-room-roomDetail__check-in-out">
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">
                                체크인
                            </div>
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2">
                                2024.1.7.
                            </div>
                        </div>
                        <div class="screens-room-roomDetail__check-in-out">
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">
                                체크아웃
                            </div>
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2">
                                2024.1.12.
                            </div>
                        </div>
                    </button>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__number-people">
                        <div class="screens-room-roomDetail__number-people__desc">
                            <div class="screens-room-roomDetail__number-people__desc1">인원</div>
                            <div class="screens-room-roomDetail__number-people__desc2">게스트 1명</div>
                        </div>
                        <div class="screens-room-roomDetail__number-people__arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;">
                                <path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path>
                            </svg>
                        </div>
                    </button>
                </div>
                <div>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__btn screens-room-roomDetail__btn-shrink">
                        예약하기
                    </button>
                </div>
            </div>
            <div class="screens-room-roomDetail__reservation__part-2">
                예약 확정 전에는 요금이 청구되지 않습니다.
            </div>
            <div class="screens-room-roomDetail__reservation__part-3">
                <span class="screens-room-roomDetail__reservation__part-3__mul">₩166,820 X 7박</span>
                <span>₩1,167,740</span>
            </div>
        </div>
    </div>
    <%--  section-4  --%>
    <div class="screens-room-roomDetail__section-4 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-4__part-1">
            ★️ 4.91 후기 · 191개
        </div>
        <div class="screens-room-roomDetail__section-4__part-2">
            <div class="screens-room-roomDetail__review">
                <div class="screens-room-roomDetail__review__profile">
                    <div class="screens-room-roomDetail__review__profile__part-1">
                        <img class="screens-room-roomDetail__review__profile-img"
                             src="/resources/img/mock/reviewer1.jpeg"
                             alt="리뷰어 프로필 이미지">
                    </div>
                    <div class="screens-room-roomDetail__review__profile__part-2">
                        <div class="screens-room-roomDetail__review__profile__reviewer">Yongtae
                        </div>
                        <div class="screens-room-roomDetail__review__profile__review-date">2023년
                            11월
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__review__content">
                    훌륭한 숙박이었습니다. 사진과 같습니다. 매우 고요하고 평화롭습니다. 얻는 것에 비해 상당히 비쌉니다.
                </div>
                <div></div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more screens-room-roomDetail__btn-more">
                    더 보기 &gt;
                </button>
            </div>
            <div class="screens-room-roomDetail__review">
                <div class="screens-room-roomDetail__review__profile">
                    <div class="screens-room-roomDetail__review__profile__part-1">
                        <img class="screens-room-roomDetail__review__profile-img"
                             src="/resources/img/mock/reviewer2.jpeg"
                             alt="리뷰어 프로필 이미지">
                    </div>
                    <div class="screens-room-roomDetail__review__profile__part-2">
                        <div class="screens-room-roomDetail__review__profile__reviewer">Ho Yoon
                        </div>
                        <div class="screens-room-roomDetail__review__profile__review-date">2023년
                            11월
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__review__content">
                    멋지네요
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more">
                </button>
            </div>
            <div class="screens-room-roomDetail__review">
                <div class="screens-room-roomDetail__review__profile">
                    <div class="screens-room-roomDetail__review__profile__part-1">
                        <img class="screens-room-roomDetail__review__profile-img"
                             src="/resources/img/mock/reviewer3.jpeg"
                             alt="리뷰어 프로필 이미지">
                    </div>
                    <div class="screens-room-roomDetail__review__profile__part-2">
                        <div class="screens-room-roomDetail__review__profile__reviewer">MinHyuk
                        </div>
                        <div class="screens-room-roomDetail__review__profile__review-date">2023년
                            11월
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__review__content">
                    선셋 돔에서 즐거운 시간을 보냈습니다. 아름답고 평화롭고 색다릅니다. 저는 댐에서 수영하고 나무 아래에서 평화롭게 책을 읽는 것을 좋아했습니다.
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more screens-room-roomDetail__btn-more">
                    더 보기 &gt;
                </button>
            </div>
            <div class="screens-room-roomDetail__review">
                <div class="screens-room-roomDetail__review__profile">
                    <div class="screens-room-roomDetail__review__profile__part-1">
                        <img class="screens-room-roomDetail__review__profile-img"
                             src="/resources/img/mock/reviewer4.jpeg"
                             alt="리뷰어 프로필 이미지">
                    </div>
                    <div class="screens-room-roomDetail__review__profile__part-2">
                        <div class="screens-room-roomDetail__review__profile__reviewer">하율</div>
                        <div class="screens-room-roomDetail__review__profile__review-date">2023년
                            11월
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__review__content">
                    석양의 돔은 멋진 경험입니다. 자연 속에 자리한 이곳은 자연 속에 자리 잡은 외딴 곳에 있는 숙소입니다. 우리의 하이라이트는 댐에서 수영을
                    하고, 조류 관찰을 하고, 구내에서 노을을, 야외 목욕탕에서 목욕을 하는
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more screens-room-roomDetail__btn-more">
                    더 보기 &gt;
                </button>
            </div>
            <div class="screens-room-roomDetail__review">
                <div class="screens-room-roomDetail__review__profile">
                    <div class="screens-room-roomDetail__review__profile__part-1">
                        <img class="screens-room-roomDetail__review__profile-img"
                             src="/resources/img/mock/reviewer5.jpeg"
                             alt="리뷰어 프로필 이미지">
                    </div>
                    <div class="screens-room-roomDetail__review__profile__part-2">
                        <div class="screens-room-roomDetail__review__profile__reviewer">샛별</div>
                        <div class="screens-room-roomDetail__review__profile__review-date">2023년
                            11월
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__review__content">
                    저는 결코 나쁜 후기를 남기지 않습니다. 하지만 가격은 가성비가 같지 않습니다 (에어비엔비가 아닌). 연락할 수 있는 리셉션도 없고, 도와드릴
                    사람도 없습니다. 우리는 길을 잃었고, 간헐천 지침 (욕실 문 뒤에 숨김) 을
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more screens-room-roomDetail__btn-more">
                    더 보기 &gt;
                </button>
            </div>
            <div class="screens-room-roomDetail__review">
                <div class="screens-room-roomDetail__review__profile">
                    <div class="screens-room-roomDetail__review__profile__part-1">
                        <img class="screens-room-roomDetail__review__profile-img"
                             src="/resources/img/mock/reviewer6.jpeg"
                             alt="리뷰어 프로필 이미지">
                    </div>
                    <div class="screens-room-roomDetail__review__profile__part-2">
                        <div class="screens-room-roomDetail__review__profile__reviewer">채경</div>
                        <div class="screens-room-roomDetail__review__profile__review-date">2023년
                            11월
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__review__content">
                    일몰 돔에서 멋진 주말을 보내며 아름다운 석양과 주변 산책하기 좋은 곳! 적극 추천합니다
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more">
                </button>
            </div>
        </div>
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-shrink screens-room-roomDetail__btn-square">
            후기 191개
            모두 보기
        </button>
    </div>
    <%--  section-5  --%>
    <div class="screens-room-roomDetail__section-5 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-5__part-1">
            알아두어야 할 사항
        </div>
        <div class="screens-room-roomDetail__section-5__part-2">
            <div class="screens-room-roomDetail__section-5__check-in-out">
                <div class="screens-room-roomDetail__section-5__info-1">체크인 & 체크아웃
                </div>
                <div class="screens-room-roomDetail__section-5__info-2">체크인 시간: 오후
                    6:00 ~ 오후 10:00
                </div>
                <div class="screens-room-roomDetail__section-5__info-2">체크아웃 시간: 오후
                    6:00 ~ 오후 10:00
                </div>
            </div>
            <div class="screens-room-roomDetail__section-5__refund">
                <div class="screens-room-roomDetail__section-5__info-1">환불 정책</div>
                <div class="screens-room-roomDetail__section-5__info-2">11월 2일 오후 12:40 전까지
                    무료로 취소하실 수 있습니다.
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-5__btn-more">
                    더 보기 &gt;
                </button>
            </div>
        </div>
    </div>
    <%--  section-6  --%>
    <div class="screens-room-roomDetail__section-6 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__font-title screens-room-roomDetail__hosting-region">호스팅
            지역
        </div>
        <div class="screens-room-roomDetail__map"></div>
        <div class="screens-room-roomDetail__map-region">Seo-myeon, Namhae, 경상남도 한국</div>
    </div>
    <%--  section-7  --%>
    <div class="screens-room-roomDetail__section-7 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__section-7__host-profile">
            <div class="screens-room-roomDetail__host-profile">
                <img class="screens-room-roomDetail__host-profile-img"
                     src="/resources/img/mock/reviewer4.jpeg"
                     alt="호스트 프로필 이미지">
            </div>
            <div class="screens-room-roomDetail__host-bio">
                <div class="screens-room-roomDetail__font-title screens-room-roomDetail__host-bio__name">
                    호스트 : 랸나님
                </div>
                <div class="screens-room-roomDetail__host-bio__created-at">회원가입일 : 2021년 6월</div>
                <div class="screens-room-roomDetail__host-bio-text">
                    안녕하세요 남양주시에 거주하는 류한나입니다. 저는 남양주에 어렸을때부터 살아왔고 별내초, 별내중을 거쳐 청학고를 졸업했습니다.. 저의 최애
                    음식은
                    떡볶이였는데 요새는 밀가루를 많이먹으면 소화가 잘 안돼서 잘 못먹고 ..
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-more screens-room-roomDetail__host-bio__btn-more">
                    더 보기 &gt;
                </button>
            </div>
        </div>
        <div class="screens-room-roomDetail__section-7__host-contact">
            <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-square screens-room-roomDetail__btn-shrink screens-room-roomDetail__host-contact__btn">
                호스트에게 연락하기
            </button>
            <div class="screens-room-roomDetail__host-contact__contact-with-guest">숙박 중 게스트와의 교류
            </div>
            <div class="screens-room-roomDetail__host-contact__contact-method">전화 또는 문자</div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

<!-- 카카오 지도 API : services 라이브러리 불러오기 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KakaoApiKey}&libraries=services"></script>
<%-- 스크립트 --%>
<script src="/resources/js/room/roomDetail.js"></script>

</body>
</html>
