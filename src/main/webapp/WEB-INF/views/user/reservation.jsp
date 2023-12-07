<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.ClientInfoStatus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 12/6/23
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat df = new DecimalFormat("###,###");

%>

<html>
<head>
    <title>확인 및 결제</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <style>
      /* 컴포넌트 */
      .screens-user-reservation__container__div-common {
        display: flex;
        justify-content: space-between;
        padding-bottom: 24px;
      }

      .screens-user-reservation__container__div-common span {
        font-family: NotoSansKR-Medium;
        cursor: pointer;
        text-decoration: underline;
      }

      .screens-user-reservation__border-bound-top {
        border-top-width: 1px !important;
        border-top-style: solid !important;
        border-top-color: rgb(221, 221, 221);
        margin-top: 8px;
      }

      .text-size-reservation-room-info-h2 {
        font-size: var(--text-size-reservation-room-info-h2);
      }

      .screens-user-reservation__container__left-side--info-common {
        padding-right: 24px;
      }

      .screens-user-reservation__container__left-side--info-common h3 {
        font-family: NotoSansKR-Medium;
      }

      .screens-user-reservation__container__left-side--info-common div {
        font-family: NotoSansKR-Light;
        margin-top: 8px;
      }

      .screens-user-reservation__container__left-side--space-topdown {
        padding: 32px 0 24px 0;
      }

      .screens-user-reservation__container__left-side--space-topdown__header {
        margin-bottom: 24px;
      }

      .screens-user-reservation__container__left-side--space-topdown__header > div {
        margin-bottom: 4px;
      }

      .screens-user-reservation__container__left-side--space-topdown__header__payment {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .screens-user-reservation__container__left-side--space-topdown__header__select {
        position: relative;
        z-index: 3 !important;
        box-sizing: border-box;
        margin-top: 24px;
      }

      .screens-user-reservation__container__left-side--space-topdown__header__select button {
        display: block !important;
        width: 100% !important;
        background-color: rgb(255, 255, 255) !important;
        margin: 0px !important;
        padding: 0px !important;
        text-align: left !important;
        outline: none !important;
        transition: border 150ms ease-out 0s !important;
        border: 1px solid rgb(176, 176, 176) !important;
        border-radius: 8px !important;

      }

      .screens-user-reservation__container__left-side--space-topdown__header__select__box {
        padding: 16px 40px 16px 16px;
      }

      .screens-user-reservation__container__right-side__box-size {
        display: flex;
        justify-content: space-between;
        align-items: center;

        border: 1px solid wheat;
        /*height: 141px;*/
        padding: 10px 0;
      }

      .screens-user-reservation__container__right-side__flex-box-column {
        display: flex;
        flex-direction: column;
        margin-bottom: 20px;

        /*border: 1px solid tomato;*/
      }

      .screens-user-reservation__container__right-side__second-box__sub-box {
        display: flex;
        justify-content: space-between;

        margin-top: 12px;
      }

      /* class 적용 */

      .screens-user-reservation__title {
        padding: 64px 0px 32px 0px;
        font-size: 2rem;
      }

      .screens-user-reservation__container {
        display: flex;
        justify-content: space-around;

        font-size: 1rem;
        line-height: 1.25em;
        padding: 0 80px;
        margin: 0 200px;
      }

      .screens-user-reservation__container__left-side {
        width: 50% !important;
        margin-bottom: 60px;
      }

      /* 오른쪽 */
      .screens-user-reservation__container__right-side {
        position: relative;
        width: 40%;
        margin-left: 8.3333%;
      }

      .screens-user-reservation__container__right-side__inner-container {
        position: sticky !important;
        top: 200px;
        margin-bottom: 80px;
        padding: 24px;
        border: 1px solid rgb(221, 221, 221) !important;
        border-radius: 12px !important;

        /* 수정 부분 */
        width: 100% !important;
        z-index: 1 !important;
      }

      .screens-user-reservation__container__right-side__box-size__space-box {
        display: flex;
        flex-direction: column;
        justify-content: space-between;

        padding-left: 12px;
        box-sizing: border-box;
        height: 100%;
      }

      .screens-user-reservation__right-side__box-size {
        width: 60%;
      }

      .screens-user-reservation__right-side__box-size img {
        width: 100%;
        border-radius: 8px;
      }

      .screens-user-reservation__right-side--text-box {
        box-sizing: border-box;
      }

    </style>
</head>
<body>


<%-- header --%>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section>


    <%-- 중앙 컨텐츠 --%>
    <div class="screens-user-reservation__container">
        <%-- left side --%>
        <div class="screens-user-reservation__container__left-side">

            <div class="screens-user-reservation__title">
                <h1>예약 요청</h1>
            </div>

            <%--            <div>--%>
            <div class="screens-user-reservation__container__div-common">
                <h2 class="text-size-reservation-room-info-h2">예약 정보</h2>
            </div>

            <div class="screens-user-reservation__container__div-common">
                <div class="screens-user-reservation__container__left-side--info-common">
                    <h3>날짜</h3>
                    <div>12월 30일 ~ 1월 4일</div>
                </div>
                <span>수정</span>
            </div>

            <div class="screens-user-reservation__container__div-common">
                <div class="screens-user-reservation__container__left-side--info-common">
                    <h3>게스트</h3>
                    <div>게스트 1명</div>
                </div>
                <span>수정</span>
            </div>

            <%-- 결제 수단 --%>
            <div class="screens-user-reservation__border-bound-top"></div>
            <div class="screens-user-reservation__container__left-side--space-topdown">
                <section>
                    <div>
                        <div class="screens-user-reservation__container__left-side--space-topdown__header">
                            <div class="screens-user-reservation__container__left-side--space-topdown__header__payment">
                                <h2 class="text-size-reservation-room-info-h2">결제 수단</h2>
                                <div>
                                    <span>이미지1</span>
                                    <span>이미지2</span>
                                    <span>이미지3</span>
                                    <span>이미지4</span>
                                </div>
                            </div>

                            <div class="screens-user-reservation__container__left-side--space-topdown__header__select">
                                <button>
                                    <div class="screens-user-reservation__container__left-side--space-topdown__header__select__box">
                                        <div style="display: flex; align-items: center">
                                            <div style="margin-right: 16px">
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                     viewBox="0 0 44 32" aria-label="마스터카드"
                                                     role="img"
                                                     focusable="false"
                                                     style="display: block; height: 33px; width: 33px;">
                                                    <g fill="none" fill-rule="evenodd">
                                                        <path fill="#F26122" fill-rule="nonzero"
                                                              d="M17.45 9.12h9.13V23.8h-9.13z"></path>
                                                        <path fill="#EA1D25" fill-rule="nonzero"
                                                              d="M21.97 23.8a9.54 9.54 0 0 1-5.84 2 9.75 9.75 0 0 1-6.73-2.77 9.1 9.1 0 0 1-2.74-6.56A9.09 9.09 0 0 1 9.39 9.9a9.64 9.64 0 0 1 6.74-2.76c2.13 0 4.19.7 5.84 2a9.36 9.36 0 0 0-3.6 7.33 9.34 9.34 0 0 0 3.6 7.33z"></path>
                                                        <path fill="#F69E1E" fill-rule="nonzero"
                                                              d="M37.32 16.45a9.1 9.1 0 0 1-2.74 6.57 9.65 9.65 0 0 1-6.74 2.76c-2.13 0-4.18-.7-5.84-2a9.36 9.36 0 0 0 3.6-7.33A9.34 9.34 0 0 0 22 9.12a9.54 9.54 0 0 1 5.84-2 9.76 9.76 0 0 1 6.74 2.77 9.07 9.07 0 0 1 2.74 6.56z"></path>
                                                        <path fill="#B0B0B0"
                                                              d="M2.04 1C1.47 1 1 1.47 1 2.05v27.9c0 .58.47 1.05 1.04 1.05h39.92c.57 0 1.04-.47 1.04-1.05V2.05C43 1.47 42.53 1 41.96 1H2.04zM0 2.05C0 .92.9 0 2.04 0h39.92C43.1 0 44 .92 44 2.05v27.9c0 1.13-.9 2.05-2.04 2.05H2.04A2.04 2.04 0 0 1 0 29.95V2.05z"></path>
                                                    </g>
                                                </svg>
                                            </div>
                                            <div style="font-family: NotoSansKR-Light">•••• 7150
                                            </div>
                                        </div>

                                    </div>
                                </button>
                                <span style="position: absolute !important; top: 0 !important; right: 20px !important; height: 100%; pointer-events: none !important;">
                                    <div style="display: table !important; position:relative !important; height: 100% !important;">
                                        <div style="display: table-cell !important; vertical-align: middle !important;">
                                            <div style="transform: rotate(0deg)">
                                                <svg viewBox="0 0 18 18" role="presentation"
                                                     aria-hidden="true"
                                                     focusable="false"
                                                     style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);">
                                                    <path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z"
                                                          fill-rule="evenodd"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </span>
                            </div>
                        </div>

                    </div>
                </section>
            </div>

            <%-- 필수입력정보 --%>
            <div class="screens-user-reservation__border-bound-top"></div>
            <div class="screens-user-reservation__container__left-side--space-topdown">
                <div>
                    <h2 class="text-size-reservation-room-info-h2" style="margin-bottom: 16px">
                        필수 입력
                        정보</h2>
                </div>

                <label for="null_textArea">
                    <div style="font-family: NotoSansKR-Medium; margin-bottom: 4px">호스트에게 메시지
                        보내기
                    </div>
                    <div style="font-family: NotoSansKR-Light">여행 목적, 동반 일행, 이 숙소를 선택한 이유 등을
                        알려주세요.
                    </div>

                    <div style="display: flex; padding: 32px 0;">
                        <div style="width: 50px;">
                            <img style="border-radius: 50%; width: 100%;"
                                 src="https://a0.muscache.com/im/pictures/user/User-16605357/original/a56cb999-e7c8-4493-bbd7-937b3def7a0f.jpeg?aki_policy=profile_x_medium"/>
                        </div>
                        <div style="padding-left: 16px">
                            <div style="font-family: NotoSansKR-Medium">Jesse</div>
                            <div style="font-family: NotoSansKR-Light">에어비앤비 가입: 2022년</div>
                        </div>
                    </div>

                    <textarea id="null_textArea" rows="5" autocomplete="off"
                              style="padding: 8px; background-color: transparent; font-family: NotoSansKR-Light; border-radius: 8px; width: 100%"></textarea>
                </label>

            </div>

            <%-- 예약 요청 --%>
            <div style="padding: 24px 0px">
                <%--            <button style="padding: 16px 32px" >--%>
                <button style="padding: 16px 32px; background: linear-gradient(to right,#E61E4D 0%,#E31C5F 50%,#D70466 100%); cursor: pointer; border: none; border-radius: 8px; color: #FFFFFF; font-size: 1.125rem">
                    예약 요청
                </button>
            </div>

        </div>


        <%-- right side --%>
        <div class="screens-user-reservation__container__right-side">
            <div class="screens-user-reservation__container__right-side__inner-container">
                <div>

                    <%-- 1번째 박스 --%>
                    <div class="screens-user-reservation__container__right-side__box-size">

                        <%-- 이미지 --%>
                        <div class="screens-user-reservation__right-side__box-size">
                            <img src="/resources/img/room/room.png">
                        </div>

                        <div class="screens-user-reservation__container__right-side__box-size__space-box">
                            <%-- 텍스트 박스 --%>
                            <div class="screens-user-reservation__right-side--text-box">
                                <div>
                                    <div>집 전체</div>
                                    <div>HaHa Haus (하하 하우스) - cozy flat in Itaewon</div>
                                </div>
                            </div>


                            <div style="display: flex">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                     aria-hidden="true" role="presentation" focusable="false"
                                     style="display: block; height: 10px; width: 10px; fill: currentcolor;">
                                    <path fill-rule="evenodd"
                                          d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path>
                                    <div>4.97 (후기 36개)</div>
                                </svg>
                                <span class="s1a0pub atm_7l_1vqu0jy atm_gz_logulu dir dir-ltr"><svg
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
                                        aria-hidden="true" role="presentation" focusable="false"
                                        style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path
                                        d="m8.5 7.6 3.1-1.75 1.47-.82a.83.83 0 0 0 .43-.73V1.33a.83.83 0 0 0-.83-.83H3.33a.83.83 0 0 0-.83.83V4.3c0 .3.16.59.43.73l3 1.68 1.57.88c.35.2.65.2 1 0zm-.5.9a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7z"></path></svg></span>
                                <div>슈퍼호스트</div>
                            </div>

                        </div>


                    </div>

                    <%-- 2번째 박스 --%>
                    <div class="screens-user-reservation__border-bound-top"></div>
                    <div class="screens-user-reservation__container__right-side__flex-box-column">
                        <div style="padding: 24px 0">
                            <h2 class="text-size-reservation-room-info-h2">요금 세부정보</h2>
                        </div>

                        <div>
                            <div class="screens-user-reservation__container__right-side__second-box__sub-box">
                                <div>₩95,000 x 5박</div>
                                <div>₩475,000</div>
                            </div>
                            <div class="screens-user-reservation__container__right-side__second-box__sub-box">
                                <div>청소비</div>
                                <div>₩30,000</div>
                            </div>
                            <div class="screens-user-reservation__container__right-side__second-box__sub-box">
                                <div>에어비앤비 서비스 수수료</div>
                                <div>₩78,423</div>
                            </div>
                        </div>
                    </div>

                    <%-- 3번째 박스 --%>
                    <div class="screens-user-reservation__border-bound-top"></div>
                    <%--                <div class="screens-user-reservation__container__right-side__box-size">--%>
                    <div class="screens-user-reservation__container__right-side__box-size"
                         style="padding: 20px 0; font-family: NotoSansKR-Bold">
                        <div>총 합계(KRW)</div>
                        <div>₩583,423</div>
                    </div>

                </div>
            </div>
        </div>
        <%-- END right side --%>
        <%--        </div>--%>

    </div>
</section>

<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

</body>
</html>
