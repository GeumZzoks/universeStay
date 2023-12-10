<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@OauthProperties['KAKAO_JavaScript_KEY']" var="KakaoApiKey"/>
<html>
<head>
    <title>RoomEnroll</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>

<div class="screens-room-roomEnroll__wrapper">

    <%--  숙소 유형을 선택하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 유형을 선택하세요</div>
    <div class="screens-room-roomEnroll__dropdown">
        <input name="" type="text" class="screens-room-roomEnroll__dropdown__textBox"
               placeholder="숙소 유형을 선택하세요" readonly>
        <input name="room_category" type="hidden"
               class="screens-room-roomEnroll__dropdown__valueBox">
        <div class="screens-room-roomEnroll__dropdown__option">
            <div onclick="show('아파트')">
                아파트
            </div>
            <div onclick="show('주택')">
                주택
            </div>
            <div onclick="show('별채')">
                별채
            </div>
            <div onclick="show('호텔')">
                호텔
            </div>
            <div onclick="show('모텔')">
                모텔
            </div>
            <div onclick="show('펜션')">
                펜션
            </div>
            <div onclick="show('콘도')">
                콘도
            </div>
            <div onclick="show('레지던스')">
                레지던스
            </div>
            <div onclick="show('오피스텔')">
                오피스텔
            </div>
            <div onclick="show('한옥')">
                한옥
            </div>
            <div onclick="show('캠핑장/아웃도어')">
                캠핑장/아웃도어
            </div>
            <div onclick="show('호스텔')">
                호스텔
            </div>
            <div onclick="show('리조트')">
                리조트
            </div>
        </div>
    </div>

    <%--  숙소의 위치는 어디인가요?  --%>
    <div class="screens-room-roomEnroll__title">숙소의 위치는 어디인가요?</div>
    <div class="screens-room-roomEnroll__input__address">
        <input type="text" name="room_address" class="screens-room-roomEnroll__address-main"
               placeholder="주소" readonly>
        <input type="button" class="screens-room-roomEnroll__btn-address-main"
               onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
        <input type="text" name="room_address_detail"
               class="screens-room-roomEnroll__address-detail" placeholder="상세 주소 입력"><br>
        <div class="screens-room-roomEnroll__map"
             style="width:100%;height:300px;margin-top:10px;display:none"></div>
    </div>

    <%--  숙소 기본정보를 알려주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 기본정보를 알려주세요</div>
    <div class="screens-room-roomEnroll__sub-title">침대 유형과 같은 세부 사항은 나중에 추가하실 수 있습니다.</div>
    <div class="screens-room-roomEnroll__info-basic">
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">게스트</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_standard_capa" value='4' disabled/>
                <button class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">최대 게스트</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_max_capa" value='4' disabled/>
                <button class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">침실</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_bedroom_cnt" value='2' disabled/>
                <button class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">침대</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_bed_cnt" value='2' disabled/>
                <button class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div class="screens-room-roomEnroll__info-basic__partition">
            <span class="screens-room-roomEnroll__info-basic__info-1">욕실</span>
            <div class="screens-room-roomEnroll__info-basic__info-2">
                <button class="screens-room-roomEnroll__info-basic__btn-minus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                    </svg>
                </button>
                <input type="text" class="screens-room-roomEnroll__info-basic__num"
                       name="room_bathroom_cnt" value='2' readonly/>
                <button class="screens-room-roomEnroll__info-basic__btn-plus">
                    <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                         role="presentation" focusable="false"
                         style="display: block; height: 12px; width: 12px; fill: #717171;">
                        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <%--  숙소 편의시설 정보를 추가하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 편의시설 정보를 추가하세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        여기에 추가하려는 편의시설이 보이지 않더라도 걱정하지 마세요! 숙소를 등록한 후에
        편의시설을 추가할 수 있습니다.
    </div>
    <div class="screens-room-roomEnroll__facilities">
        <div>욕실</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    욕조
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    비데
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바디클렌저
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    청소용품
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    컨디셔너
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    헤어드라이어
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    온수
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외
                    샤워 시설
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    샴푸
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_bath" class="screens-room-roomEnroll__facility"
               value="0">

        <div>침실 및 세탁시설</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    필수품목(수건, 침대시트, 비누, 화장지, 베개)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    침구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    의류 보관 공간
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    건조기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    의류 건조대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    여분의 베개와 담요
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    옷걸이
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    다리미
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    모기장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    암막커튼
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    금고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    세탁기
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_bedAndLaundry"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>엔터테인먼트</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    오락실 게임
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야구 연습장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    도서 및 읽을거리
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    볼링장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    운동 기구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    게임기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    영화관
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    피아노
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    탁구대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    당구대
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    스피커
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    Tv
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_entertain"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>숙소 안전</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    일산화탄소 경보기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    소화기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    난방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    화재 경보기
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_safety"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>냉난방</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    에어컨
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    선풍기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    난방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    벽난로
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_heatAndCold"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>인터넷 및 업무 공간</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    업무 전용 공간(테이블, 의자)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    포켓 와이파이
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    무선 인터넷
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_internetAndWorkSpace"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>주방 및 식당</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바베큐 도구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    제빵기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    믹서기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    커피
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    커피 메이커
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    기본 조리도구(냄비, 후라이팬, 기름, 소금, 후추 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    식탁
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    식기류(그릇, 젓가락, 접시, 컵 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    식기 세척기
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    냉동고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    주방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    전자레인지
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    오븐
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    냉장고
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    전기 밥솥
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    가스레인지 / 인덕션
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    와인잔
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_kitchen"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>야외</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    뒷마당
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바베큐 그릴
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    해수욕 필수품 (비치타월, 우산, 해변용 담요, 스노클링 장비 등)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    자전거
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    화로
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    해먹
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    카약
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외 식사 공간
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외 가구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    야외 주방
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    발코니
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    선베드
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_outdoor"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>주차장 및 기타 시설</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    엘리베이터
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    전기차 충전 시설
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    건물 내 무료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    도로 주차(무료)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    헬스장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    온수 욕조
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    외부 유료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    건물 내 유료 주차
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    수영장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    사우나
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    단층 주택(숙소에 계단 없음)
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_garageAndEtc"
               class="screens-room-roomEnroll__facility"
               value="0">

        <div>서비스</div>
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    아침식사(아침식사 제공)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    숙박 중 청소 서비스 가능
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    장기 숙박 가능 (28일 이상 숙박 가능)
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    여행 가방 보관 가능(체크인 시간보다 일찍 도착하거나 체크아웃 후 짐 보관을 원하는 게스트를 위한 서비스
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_amenity_service"
               class="screens-room-roomEnroll__facility"
               value="0">
    </div>

    <%--  숙소 전망을 추가하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 전망을 추가하세요</div>
    <div class="screens-room-roomEnroll__views">
        <ul class="screens-room-roomEnroll__select">
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    계곡
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    해변
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    도시
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    마당
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    정원
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    골프장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    항구
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    호수
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    산
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    바다
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    공원
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    수영장
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    리조트
                </button>
            </li>
            <li class="screens-room-roomEnroll__select-li">
                <button class="screens-room-roomEnroll__select-btn screens-room-roomEnroll__btn screens-room-roomEnroll__btn-square">
                    강
                </button>
            </li>
        </ul>
        <input type="hidden" name="room_view"
               class="screens-room-roomEnroll__view"
               value="0">
    </div>

    <%--  숙소 사진을 추가하세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 사진을 추가하세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 등록을 시작하시려면 사진 5장을 제출하셔야 합니다. 나중에 추가하거나 변경하실 수 있습니다.
    </div>
    <%--    TODO : 포토 추가 기능    --%>
    <div class="screens-room-roomEnroll__photos">
        <svg class="screens-room-roomEnroll__photos__part-1" viewBox="0 0 64 64"
             xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
             role="presentation" focusable="false"
             style="display: block; height: 64px; width: 64px; fill: currentcolor;">
            <path d="M41.636 8.404l1.017 7.237 17.579 4.71a5 5 0 0 1 3.587 5.914l-.051.21-6.73 25.114A5.002 5.002 0 0 1 53 55.233V56a5 5 0 0 1-4.783 4.995L48 61H16a5 5 0 0 1-4.995-4.783L11 56V44.013l-1.69.239a5 5 0 0 1-5.612-4.042l-.034-.214L.045 14.25a5 5 0 0 1 4.041-5.612l.215-.035 31.688-4.454a5 5 0 0 1 5.647 4.256zm-20.49 39.373l-.14.131L13 55.914V56a3 3 0 0 0 2.824 2.995L16 59h21.42L25.149 47.812a3 3 0 0 0-4.004-.035zm16.501-9.903l-.139.136-9.417 9.778L40.387 59H48a3 3 0 0 0 2.995-2.824L51 56v-9.561l-9.3-8.556a3 3 0 0 0-4.053-.009zM53 34.614V53.19a3.003 3.003 0 0 0 2.054-1.944l.052-.174 2.475-9.235L53 34.614zM48 27H31.991c-.283.031-.571.032-.862 0H16a3 3 0 0 0-2.995 2.824L13 30v23.084l6.592-6.59a5 5 0 0 1 6.722-.318l.182.159.117.105 9.455-9.817a5 5 0 0 1 6.802-.374l.184.162L51 43.721V30a3 3 0 0 0-2.824-2.995L48 27zm-37 5.548l-5.363 7.118.007.052a3 3 0 0 0 3.388 2.553L11 41.994v-9.446zM25.18 15.954l-.05.169-2.38 8.876h5.336a4 4 0 1 1 6.955 0L48 25.001a5 5 0 0 1 4.995 4.783L53 30v.88l5.284 8.331 3.552-13.253a3 3 0 0 0-1.953-3.624l-.169-.05L28.804 14a3 3 0 0 0-3.623 1.953zM21 31a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM36.443 6.11l-.175.019-31.69 4.453a3 3 0 0 0-2.572 3.214l.02.175 3.217 22.894 5.833-7.74a5.002 5.002 0 0 1 4.707-4.12L16 25h4.68l2.519-9.395a5 5 0 0 1 5.913-3.587l.21.051 11.232 3.01-.898-6.397a3 3 0 0 0-3.213-2.573zm-6.811 16.395a2 2 0 0 0 1.64 2.496h.593a2 2 0 1 0-2.233-2.496zM10 13a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
        </svg>
        <div class="screens-room-roomEnroll__photos__part-2">여기로 사진을 끌어다 놓으세요.</div>
        <div class="screens-room-roomEnroll__photos__part-3">5장 이상의 사진을 선택하세요.</div>
        <div class="screens-room-roomEnroll__photos__part-4">
            <button>기기에서 업로드</button>
        </div>
    </div>

    <%--  숙소 이름을 지어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 이름을 지어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 이름은 짧을수록 효과적입니다. 나중에 언제든지 변경할 수 있으니, 너무 걱정하지 마세요.
    </div>
    <textarea name="room_name" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 장점을 적어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 장점을 적어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소의 특징과 장점을 알려주세요.
    </div>
    <textarea name="room_advantages_desc" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 공간에 대해 설명해주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 공간에 대해 설명해주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 공간을 자세히 설명해주세요.
    </div>
    <textarea name="room_space_desc" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 기타 참고할점을 적어주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 기타 참고할점을 적어주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        숙소 사용시 주의할점과 참고할점이 있다면 자세히 적어주세요.
    </div>
    <textarea name="room_stc_desc" class="screens-room-roomEnroll__textarea"></textarea>

    <%--  숙소 가격을 책정해주세요  --%>
    <div class="screens-room-roomEnroll__title">숙소 가격을 책정해주세요</div>
    <div class="screens-room-roomEnroll__sub-title">
        언제든지 변경하실 수 있습니다.
    </div>
    <div class="screens-room-roomEnroll__price">
        <div class="screens-room-roomEnroll__title-1">
            주중 1박 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_weekday-price" class="screens-room-roomEnroll__input-price"
                   type="text" value="50,000">
        </div>

        <div class="screens-room-roomEnroll__title-2">
            주말 1박 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_weekend-price" class="screens-room-roomEnroll__input-price"
                   type="text" value="70,000">
        </div>

        <div class="screens-room-roomEnroll__title-3">
            인원 추가 요금
        </div>
        <div class="screens-room-roomEnroll__price-input-container">
            <span>₩</span>
            <input name="room_extra_person_fee" class="screens-room-roomEnroll__input-price"
                   type="text" value="10,000">
        </div>
    </div>

</div>

</div>

<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

<%-- 숙소 주소 입력 Script --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 지도 API : services 라이브러리 불러오기 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KakaoApiKey}&libraries=services"></script>
<%-- Script --%>
<script src="/resources/js/room/roomEnroll.js"></script>

</body>
</html>
