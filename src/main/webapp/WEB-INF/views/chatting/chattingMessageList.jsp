<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<style>


  ._61mw08 {
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    position: relative;
    display: flex;
    flex-direction: row;
    overflow: hidden;
  }

  ._26jl6ja {
    -webkit-box-direction: normal;
    -webkit-box-orient: vertical;
    overflow: hidden !important;
    display: flex;
    flex-direction: column;
    /*transition-property: var(--panel_-webkit-transition-property, all), var(--panel_transition-property, all);*/
    transition-duration: 0.5s;
    transition-delay: 0s;
    outline: none;
    flex: 1 1 0%;
    border: 1px solid transparent;
    flex: 0 0 var(--orbital-panel-width-md)
  }

  ._1eo6q1th {
    -webkit-box-direction: normal;
    -webkit-box-orient: vertical;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    /*transition-property: var(--panel_-webkit-transition-property, all), var(--panel_transition-property, all);*/
    transition-duration: 0.5s;
    transition-delay: 0s;
    border-width: 1px;
    border-style: solid;
    border-color: transparent transparent transparent rgb(235, 235, 235);
    border-image: initial;
    outline: none;
    flex: 1 1 0%;
  }

  .dir-ltr.atm_lk_k75hcd[class] {
    padding-left: 24px;
  }

  .atm_e2_t9kd1m {
    height: 72px;
  }


  .dir.atm_40_163hlei[class] {
    border-bottom: 1px solid;
  }

  .dir-ltr.atm_ll_gktfv[class] {
    padding-right: 20px;
  }

  .atm_ar_vrvcex[class] {
    flex-direction: row;
  }

  .dir.atm_gi_idpfg4 {
    margin: 0;
  }

  .dir.atm_l8_idpfg4 {
    padding: 0;
  }

  .atm_g3_1kw7nm4[class] {
    line-height: inherit;
  }

  .atm_cs_1kw7nm4[class] {
    font-weight: inherit;
  }

  .atm_c8_1x4eueo[class] {
    font-size: 1em;
  }

  h1:first-child, h2:first-child, h3:first-child, h4:first-child, h5:first-child, h6:first-child {
    margin-top: 0;
  }

  .atm_7l_1kw7nm4 {
    color: inherit;
  }

  .atm_8w_1t7jgwy {
    contain: paint;
  }

  .dir.atm_gi_idpfg4 {
    margin: 0;
  }

  .dir.atm_l8_idpfg4 {
    padding: 0;
  }

  .atm_g3_1kw7nm4[class] {
    line-height: inherit;
  }

  .atm_cs_1kw7nm4[class] {
    font-weight: inherit;
  }

  .atm_c8_1x4eueo[class] {
    font-size: 1em;
  }

  h1:first-child, h2:first-child, h3:first-child, h4:first-child, h5:first-child, h6:first-child {
    margin-top: 0;
  }

  .atm_7l_1kw7nm4 {
    color: inherit;
  }

  .atm_8w_1t7jgwy {
    contain: paint;
  }

  h1, h2, h3, h4, h5, h6 {
    margin-top: 25px;
    margin-bottom: 15px;
  }

  *, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -ms-flex: 0 1 auto;
  }

  * {
    box-sizing: border-box;
  }

  user agent stylesheet
  :-webkit-any(article, aside, nav, section) :-webkit-any(article, aside, nav, section) h1 {
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
  }

  user agent stylesheet
  :-webkit-any(article, aside, nav, section) h1 {
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
  }

  user agent stylesheet
  h1 {
    display: block;
    font-size: 2em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
  }

  .atm_g3_1pezo5y[class] {
    line-height: var(--f-xgviq);
  }

  .atm_c8_exq1xd[class] {
    font-size: var(--ll-l-ys-f);
  }

  .atm_cs_u3ocpi[class] {
    font-weight: var(--h-oqhch);
  }

  .atm_7l_18pqv07 {
    color: var(--f-k-smk-x);
  }

  .atm_fr_7aerd4 {
    -webkit-letter-spacing: var(--jq-tp-h-q);
    -moz-letter-spacing: var(--jq-tp-h-q);
    -ms-letter-spacing: var(--jq-tp-h-q);
    letter-spacing: var(--jq-tp-h-q);
  }

  style attribute {
    --orbital-panel-transition-duration: 500ms;
    --orbital-panel-width-md: 375px;
    --orbital-panel-width-lg: 375px;
    --orbital-panel-width-xl: 375px;
  }

  :root {
    --h-l-f-om-o: 4px;
    --go-h-jh-l: 8px;
    --i-g-gvoq: 12px;
    --g-ki-r-rq: 16px;
    --j-mdfu-h: 20px;
    --jx-b-v-zt: 0 8px 28px rgba(0, 0, 0, 0.28);
    --g-r-n-ycy: 1px solid rgba(0, 0, 0, 0.04);
    --ih-jiz-p: 0 6px 20px rgba(0, 0, 0, 0.2);
    --cglwe-y: 1px solid rgba(0, 0, 0, 0.04);
    --cizosd: 0 6px 16px rgba(0, 0, 0, 0.12);
    --cb-k-zk-c: 1px solid rgba(0, 0, 0, 0.04);
    --e-swdx-p: 0 2px 4px rgba(0, 0, 0, 0.18);
    --g-fi-y-r-e: 1px solid rgba(0, 0, 0, 0.08);
    --itr-yy-z: cubic-bezier(0.2, 0, 0, 1);
    --c-wky-h-p: 1px;
    --hzee-ha: 175px;
    --gracgr: 26px;
    --e-usyia: cubic-bezier(0.1, 0.9, 0.2, 1);
    --hb-n-kc-m: 1px;
    --ikro-f: 300px;
    --h-m-d-zo-y: 35px;
    --f-w-xhiy: cubic-bezier(0.4, 0, 1, 1);
    ---sof-io: 1px;
    --cll-sox: 300px;
    --kf-r-nu-y: 35px;
    --inwig-v: 1px;
    --ien-u-go: 250px;
    --d-kmbxx: 22px;
    --j-cm-lxz: cubic-bezier(0, 0, 1, 1);
    --f-ya-ggj: cubic-bezier(1, 0, 0.86, 1);
    --bd-d-m-c-q: cubic-bezier(0, 0, 0.1, 1);
    ---bz-mmq: cubic-bezier(0.35, 0, 0.65, 1);
    --bgxgx: #000000;
    --f-k-smk-x: #222222;
    --fo-jk-r-s: #717171;
    --iw-ihca: #B0B0B0;
    --j-qkgmf: #DDDDDD;
    --d-nc-lt-s: #EBEBEB;
    ---pc-g-v-g: #F7F7F7;
    --f-mkcy-f: #FFFFFF;
    --k-va-tnc: #C13515;
    --cnr-vp-o: #B32505;
    --f-p-k-v-lb: #FFF8F6;
    --e-dseob: #F7F6F2;
    ---y-x-nql: #F5F1EA;
    --ldbkp-d: #428BFF;
    --fhi-qn-u: #E07912;
    --k-ff-my-a: #008A05;
    --ihf-tp-q: #FF385C;
    --cl-yygv: #E00B41;
    --kd-lqtg: #92174D;
    --d-u-w-o-m-k: #460479;
    --dc-gy-f-v: linear-gradient(to right, #E61E4D 0%, #E31C5F 50%, #D70466 100%);
    --bb-gov-t: linear-gradient(to left, #E61E4D 0%, #E31C5F 50%, #D70466 100%);
    --d-e-vybb: radial-gradient(circle at center, #FF385C 0%, #E61E4D 27.5%, #E31C5F 40%, #D70466 57.5%, #BD1E59 75%, #BD1E59 100%);
    --gj-z-dpd: linear-gradient(to right, #BD1E59 0%, #92174D 50%, #861453 100%);
    --fb-hdaf: linear-gradient(to left, #BD1E59 0%, #92174D 50%, #861453 100%);
    --i-n-t-h-mj: radial-gradient(circle at center, #D70466 0%, #BD1E59 30%, #92174D 55%, #861453 72.5%, #6C0D63 90%, #6C0D63 100%);
    --iqds-nv: linear-gradient(to right, #59086E 0%, #460479 50%, #440589 100%);
    --dy-k-qzx: linear-gradient(to left, #59086E 0%, #460479 50%, #440589 100%);
    --j-m-v-dtd: radial-gradient(circle at center, #6C0D63 0%, #59086E 30%, #460479 55%, #440589 72.5%, #3B07BB 90%, #3B07BB 100%);
    --jhzm-v-t: 16px;
    --ikx-k-pe: 24px;
    --kksqe-v: 32px;
    --f-fw-z-a-i: 40px;
    --cw-a-a-u-a: 48px;
    --fvsvry: 64px;
    --cy-o-aco: 80px;
    --d-b-mrdy: 2px;
    --h-x-sf-jw: 4px;
    --fgg-f-l-a: 8px;
    --b-y-unon: 12px;
    --jaa-ni-h: 16px;
    --ic-zlb-s: 24px;
    --kc-t-qr-j: 32px;
    --e-ls-qkw: 'Circular', -apple-system, 'BlinkMacSystemFont', 'Roboto', 'Helvetica Neue', sans-serif;
    --b-p-ic-ww: 2.5rem;
    --cz-oe-p-d: 2.75rem;
    --h-nm-al-j: normal;
    --deo-b-b-n: 600;
    --bwbg-n-z: 3rem;
    --dhte-p-k: 3.375rem;
    --hqo-p-og: normal;
    --e-bsrrw: 600;
    --be-f-xyk: 3.75rem;
    --k-k-sm-j-h: 4.25rem;
    --g-m-p-bqd: normal;
    --e-o-hp-ux: 600;
    --dr-w-t-ge: 4.5rem;
    --j-lmku-j: 4.625rem;
    --bc-b-kw-l: normal;
    --d-b-bxqb: 600;
    --fy-rs-ca: 1.125rem;
    --d-ar-t-o-n: 1.375rem;
    --dj-jtzv: normal;
    --lhy-d-yl: 1.375rem;
    --fme-bf-w: 1.625rem;
    --itmxj-m: normal;
    --g-zgv-nj: 1.625rem;
    --b-x-z-q-l-e: 1.875rem;
    --sa-glq: normal;
    --cv-p-u-ui: 2rem;
    --hu-t-o-g-n: 2.25rem;
    --j-r-aoaj: normal;
    --hr-k-udr: 0.625rem;
    --dpgw-ac: 0.75rem;
    --c-d-p-bdy: normal;
    --f-cv-j-j-p: 0.75rem;
    --f-l-h-bac: 1rem;
    --b-fr-dxa: normal;
    --c-zdwk-p: 0.875rem;
    --j-p-z-kco: 1.125rem;
    --cgzf-uq: normal;
    --i-nh-zme: 0.875rem;
    --gvarj-f: 1.25rem;
    --b-x-w-tp-x: normal;
    --iw-ehf-f: 1rem;
    ---s-l-myu: 1.25rem;
    --fnsvt-u: normal;
    --y-g-ar-y: 1rem;
    --cb-pewj: 1.5rem;
    --c-f-rm-ah: normal;
    --ll-l-ys-f: 1.125rem;
    --f-xgviq: 1.5rem;
    --jq-tp-h-q: normal;
    --kmwb-ss: 1.125rem;
    --j-n-c-d-l-h: 1.75rem;
    --bzs-fwt: normal;
    --jlvl-j-l: 0.75rem;
    --j-l-x-t-kw: 1rem;
    --j-x-lzju: normal;
    --e-y-j-d-v-j: 400;
    --jx-zk-pv: 600;
    --h-oqhch: 800;
    --g-lm-u-p: normal;
    --mq-yk-l: 0.04em;
  }

  .atm_ar_1bp4okc[class] {
    flex-direction: column;
  }

  .dir.atm_l8_yh40bf {
    padding: 2px;
  }

  .dir.atm_70_opmxbf {
    box-shadow: inset 0 0 0 1px var(--iw-ihca);
  }

  .dir.atm_5j_3v3vx7 {
    border-radius: var(--j-mdfu-h);
  }

  .dir.atm_gi_n6u9z8 {
    margin: 14px 0;
  }

  .atm_vy_1osqo2v {
    width: 100%;
  }

  .atm_9s_1txwivl {
    display: flex;
  }

  .atm_7l_18pqv07 {
    color: var(--f-k-smk-x);
  }

  .atm_73_usvi9m {
    box-sizing: border-box;
  }

  style attribute {
    --page-shell-max-content-width: none;
  }

  style attribute {
    --view-transition_visibility: visible;
    --view-transition_pointer-events: auto;
    --view-transition_overflow: visible;
  }

  .g5l85gq[class][class] > body {
    --view-transition-name: none;
  }

  :root.remTheme > body {
    font-size: .875rem;
  }

  [lang="ko"] body {
    word-break: keep-all;
  }

  body {
    line-break: strict;
  }

  body {
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, sans-serif;
    font-size: 14px;
    line-height: 1.43;
    color: #EBEBEB;
    background-color: #fff;
    margin: 0;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  body {
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  style attribute {
    --vh: 7.83px;
    --vw: 8.540000000000001px;
    --vw-unitless: 854;
    --vw-px: 854px;
    height: calc(var(--vh) * 100);
  }

  .chat_list:hover {
    background-color: #DDDDDD;
    /* 다른 스타일을 추가하거나 변경할 수 있습니다. */
  }

  .chat_list {
    color: #0c0b0c;
  }

  .chatRoomList {
    height: calc(100vh - 172px);
    overflow-y: scroll;
  }

  .message_header {
    height: 72px;
  }

  .message_pannel {
    height: calc(100vh - 172px);
    overflow-y: scroll;
  }

</style>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>


<div aria-label="메시지 페이지 주요 콘텐츠" class="_61mw08">
    <section>
        <%--             style="--orbital-panel-transition-duration: 500ms; --orbital-panel-width-md: 375px; --orbital-panel-width-lg: 375px; --orbital-panel-width-xl: 375px;">--%>
        <div class="_ijm3lbp">
            <div class="p1wta9s2 atm_mk_h2mmj6 atm_9s_1txwivl atm_ar_1bp4okc atm_e2_1osqo2v atm_vy_auwlz6 atm_j3_1osqo2v atm_vy_1wugsn5__oggzyc i1n04ygg atm_9s_glywfm__1p26x0r dir dir-ltr">
                <div class="p1ewphkt atm_9s_1txwivl atm_ar_vrvcex atm_h_1h6ojuz atm_lk_k75hcd atm_mk_h2mmj6 atm_ll_gktfv p16o8n7n atm_e2_t9kd1m atm_40_163hlei dir dir-ltr">
                    <div class="p2gdan0 atm_7l_18pqv07 atm_ax_kb7nvz pseealp atm_ks_15vqwwr atm_sq_1l2sidv atm_9s_cj1kg8 atm_6w_1e54zos atm_fy_kb7nvz atm_c8_exq1xd atm_g3_1pezo5y atm_fr_7aerd4 atm_cs_u3ocpi atm_ks_zryt35__1rgatj2 dir dir-ltr"
                         data-testid="inbox-panel-toolbar-heading">
                        <section><h1 data-shared-element-id="page-marquee" id="inbox_header"
                                     tabindex="-1"
                                     class="hpipapi atm_7l_1kw7nm4 atm_c8_1x4eueo atm_cs_1kw7nm4 atm_g3_1kw7nm4 atm_gi_idpfg4 atm_l8_idpfg4 atm_kd_idpfg4_pfnrn2 s12s7yzj atm_8w_1t7jgwy dir dir-ltr"
                                     elementtiming="LCP-target">메시지</h1></section>
                    </div>

                </div>

            </div>
        </div>

        <div class="chatRoomList">
            <div class="chatRoom">
                <c:forEach var="chatRoom" items="${chatRoomList}">
                    <input style="display: none" name="chat_room_id"
                           value="${chatRoom.chatting_room_id}">
                    <script>console.log(${chatRoom.chatting_room_id})
                    console.log(${chatRoom.username})</script>

                    <c:set var="user_name" value="${chatRoom.user_name}"/>
                    <c:set var="chat_ctt" value="${chatRoom.chat_ctt}"/>
                    <fmt:formatDate value="${chatRoom.chat_date}" pattern="yyyy.MM.dd HH:mm"
                                    var="chat_date"/>
                    <c:set var="profile_img" value="${chatRoom.profile_img_url}"/>
                    <c:set var="chat_room_id" value="${chatRoom.chatting_room_id}"/>
                    <form id="chatForm" action="/enter/chattingRoomList/${chat_room_id}"
                          method="get">
                        <div class="chat_list" id="chatListItem"
                             data-chat-room-id="${chatRoom.chatting_room_id}"
                             style="text-align: center; margin-top: 20px; margin-left: 10px; border-radius: 10px;">
                            <div>
                                <p>${chat_room_id}</p>
                            </div>
                            <div style="margin-top: 5px;">
                                <p>${user_name}</p>
                            </div>
                            <div style="margin-top: 5px;">
                                <p>${chat_ctt}</p>
                            </div>
                            <div style="margin-top: 5px;">
                                <p>${chat_date}</p>
                            </div>
                            <div style="margin-top: 5px;">
                                <img src="${profile_img}"
                                     style="width: 50px; height: 50px; border-radius: 50%;">
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </section>


    <section id="thread_panel" aria-label="대화 패널" tabindex="-1" data-testid="orbital-panel-thread"
             aria-hidden="false" class="_1eo6q1th"
             style="--orbital-panel-transition-duration: 500ms;">
        <div class="_ijm3lbp message_header">
            <div class="p1wta9s2 atm_mk_h2mmj6 atm_9s_1txwivl atm_ar_1bp4okc atm_e2_1osqo2v atm_vy_auwlz6 atm_j3_1osqo2v atm_vy_1wugsn5__oggzyc dir dir-ltr">
                <div class="puhj6i2 atm_9s_1txwivl atm_ar_vrvcex atm_h_1h6ojuz atm_ll_k75hcd atm_lk_k75hcd atm_mk_h2mmj6 atm_e2_t9kd1m atm_40_163hlei dir dir-ltr"
                     data-testid="messaging_c3pi_thread_panel_toolbar">
                    <%--                    <div class="t11fbti1 atm_ax_kb7nvz atm_h0_1fwxnve dir dir-ltr">--%>
                    <%--                        <div class="p1mecifk atm_7l_18pqv07 atm_ax_kb7nvz pagazba atm_c8_exq1xd atm_fr_7aerd4 atm_cs_u3ocpi atm_g3_1pezo5y atm_ks_15vqwwr atm_sq_1l2sidv atm_9s_cj1kg8 atm_6w_1e54zos atm_fy_kb7nvz atm_ks_zryt35__1rgatj2 dir dir-ltr">--%>
                    <%--                            <section><h2 id="thread_header" tabindex="-1"--%>
                    <%--                                         class="hpipapi atm_7l_1kw7nm4 atm_c8_1x4eueo atm_cs_1kw7nm4 atm_g3_1kw7nm4 atm_gi_idpfg4 atm_l8_idpfg4 atm_kd_idpfg4_pfnrn2 dir dir-ltr"--%>
                    <%--                                         elementtiming="LCP-target"><span--%>
                    <%--                                    aria-hidden="true">Geenie</span><span--%>
                    <%--                                    class="a8jt5op atm_3f_idpfg4 atm_7h_hxbz6r atm_7i_ysn8ba atm_e2_t94yts atm_ks_zryt35 atm_l8_idpfg4 atm_mk_stnw88 atm_vv_1q9ccgz atm_vy_t94yts dir dir-ltr">Geenie 님과의 대화</span>--%>
                    <%--                            </h2></section>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="o1pcneur atm_ks_15vqwwr atm_sq_1l2sidv atm_9s_cj1kg8 atm_6w_1e54zos atm_fy_kb7nvz atm_ks_zryt35__1rgatj2 s1tjb23t atm_c8_1l6y6xl atm_g3_i7n6xh atm_fr_4z8b6j atm_7l_18pqv07 dir dir-ltr">--%>
                    <%--                            응답 시간: 1시간--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>

        <div id="chat-containerK" class="border border-secondary">

            <div class="chatWrap">
                <%-- 		<div class="main_tit">
                            <h1>방 이름 [ ${roomNo}번 ] 아이디[${loginMember.memberId}]</h1>
                        </div> --%>
                <div class="content chatcontent " data-room-no="${chat_room_id}"
                     data-member="${user_id}">
                    <div>
                        안녕하세요
                    </div>
                    <div>
                        안녕하세요
                    </div>

                    <div>
                        안녕하세요
                    </div>

                    <div>
                        안녕하세요
                    </div>

                    <div>
                        안녕하세요
                    </div>

                    <div id="list-guestbook" class="">
                        <c:forEach items="${firstList}" var="chatMessageDto">
                            <!-- 내 채팅일 경우 -->
                            <c:if test="${chatRoom.user_id eq chatMessageDto.user_id}">
                                <strong class="">${chatMessageDto.user_id}</strong>
                                <div class="me ">
                                    <strong style="display : inline;"
                                            class="align-self-end"><fmt:formatDate
                                            value="${chatMessageDto.sendDate}"
                                            pattern="yy/MM/dd HH:mm"/></strong>
                                    <p class="myChat text-left p-2">${chatMessageDto.chat_ctt}</p>
                                </div>
                            </c:if>
                            <!-- 다른사람의 채팅일 경우 -->
                            <c:if test="${chatRoom.user_id ne chatMessageDto.user_id}">

                                <li data-no="${chatMessageDto.no}" class="pl-2">
                                    <strong>${chatMessageDto.user_id}</strong>
                                    <div class="row ml-0">
                                        <p class="otherChat bg-light p-2">${chatMessageDto.chat_ctt}</p>
                                        <strong class="align-self-center"><fmt:formatDate
                                                value="${chatMessageDto.sendDate }"
                                                pattern="yy/MM/dd HH:mm"/>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
                <div class="chat-fixK">
                    <div id="alertK" onclick="moveDown();" class="alert alert-success" role="alert">
                        <strong></strong>
                    </div>
                    <div class="fix_btn row">
                        <textarea name="msg" id="msgi" rows="2"
                                  class="form-control col-sm-8"></textarea>
                        <!-- <input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" /> -->
                        <button type="button" class="send col-sm-4 btn btn-secondary">보내기</button>
                    </div>
                </div>

            </div>
        </div>


        <div>

            <div class="message_pannel c1os9z2c atm_mk_stnw88 atm_fq_idpfg4 atm_n3_idpfg4 atm_9s_1txwivl atm_ar_vrvcex atm_fc_1h6ojuz atm_wq_cs5v99 atm_gi_xjk4d9 atm_j3_1fja5my atm_tk_f13iio atm_tk_f13iio__kgj4qw atm_tk_wwb3ei__oggzyc atm_tk_wwb3ei__1v156lz atm_tk_144fm4e__qky54b atm_tk_144fm4e__jx8car dir dir-ltr"></div>
        </div>
        <div>
            <div class="cdq5pgk atm_mk_stnw88 atm_fq_idpfg4 atm_n3_idpfg4 atm_tk_1fwpi09 atm_9s_1txwivl atm_ar_vrvcex atm_fc_1h6ojuz atm_wq_cs5v99 atm_gi_xjk4d9 atm_j3_1fja5my dir dir-ltr"></div>
        </div>
</div>

</section>


</div>

</body>
<script src="/resources/js/chat/chat.js"></script>

</html>
