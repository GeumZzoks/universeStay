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
    height: 100%;
    overflow: hidden;
  }

  ._26jl6ja {
    -webkit-box-direction: normal;
    -webkit-box-orient: vertical;
    height: auto;
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
    height: auto;
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

</style>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>


<div aria-label="메시지 페이지 주요 콘텐츠" class="_61mw08">
    <section id="inbox_panel" aria-label="대화 목록 패널" role="navigation" tabindex="-1"
             data-testid="orbital-panel-inbox" aria-hidden="false" class="_26jl6ja"
             style="--orbital-panel-transition-duration: 500ms; --orbital-panel-width-md: 375px; --orbital-panel-width-lg: 375px; --orbital-panel-width-xl: 375px;">
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
                <form action="/enter/chattingRoom/" +${chatRoom.chat_room_id}>
                    <input type="hidden" name="chat_room_id" value="${chatRoom.chat_room_id}">

                        <c:set var="user_name" value="${chatRoom.user_name}"/>
                        <c:set var="chat_ctt" value="${chatRoom.chat_ctt}"/>
                        <fmt:formatDate value="${chatRoom.chat_date}" pattern="yyyy.MM.dd HH:mm"
                                var="chat_date"/>
                        <c:set var="profile_img" value="${chatRoom.profile_img_url}"/>

                    <div class="chat_list"
                         style="text-align: center; margin-top: 20px; margin-left: 10px; border-radius: 10px;">


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
                    </c:forEach>
            </div>
        </div>
        </form>


    </section>


    <section id="thread_panel" aria-label="대화 패널" tabindex="-1" data-testid="orbital-panel-thread"
             aria-hidden="false" class="_1eo6q1th"
             style="--orbital-panel-transition-duration: 500ms;">
        <div class="_ijm3lbp">
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

        <%--        <jsp:include page="/WEB-INF/views/chatting/chatting.jsp"></jsp:include>--%>
        <%--        <div class="i1o7vrwv atm_am_12336oc dir dir-ltr">--%>
        <%--            <div class="o1f1deyb atm_j3_odhztx atm_gi_xjk4d9 dir dir-ltr">--%>

        <%--                <div class="cp68eyg atm_mk_h2mmj6 atm_9s_1txwivl atm_ar_vrvcex atm_h_1h6ojuz atm_ax_kb7nvz atm_gi_15r5ub7 dir dir-ltr">--%>
        <%--                    <div class="bgqe3wg atm_h0_ftgil2 atm_gq_1fwxnve atm_j_esu3gu atm_9s_1txwivl atm_ar_vrvcex atm_uc_1wh3ncv atm_vy_tsf3kc dir dir-ltr"--%>
        <%--                         style="--button-panel-width: 0px;"></div>--%>
        <%--                    <div class="wn9vk1f atm_vy_1osqo2v dir dir-ltr"><label--%>
        <%--                            class="l18o97g4 atm_3f_idpfg4 atm_7h_hxbz6r atm_7i_ysn8ba atm_e2_t94yts atm_ks_zryt35 atm_l8_idpfg4 atm_mk_stnw88 atm_vv_1q9ccgz atm_vy_t94yts dir dir-ltr"--%>
        <%--                            for="message_input"></label>--%>
        <%--                        <div class="c1w12wz0 atm_73_usvi9m atm_7l_18pqv07 atm_70_opmxbf atm_vy_1osqo2v atm_l8_yh40bf atm_gi_n6u9z8 atm_9s_1txwivl atm_ar_1bp4okc atm_5j_3v3vx7 dir dir-ltr">--%>
        <%--                            <div class="tww5u9d atm_h0_14noui3 dir dir-ltr">--%>
        <%--                                                <textarea--%>
        <%--                                                        class="t1sc6kfc atm_7l_1kw7nm4 atm_9s_1ulexfb atm_j3_1osqo2v atm_kd_glywfm atm_73_usvi9m atm_1u_glywfm atm_bx_1ltc5j7 atm_c8_1m0ul80 atm_cs_atq67q atm_jb_1wugsn5 atm_l8_1kd1k9p atm_gi_h0w6rh atm_3f_idpfg4 atm_2d_1hbpp16 atm_my_glywfm atm_vy_1osqo2v atm_j6_h3c78l atm_ax_kb7nvz atm_5j_3v3vx7 atm_g3_qslrf5 atm_9j_13gfvf7_1o5j5ji atm_7l_12u4tyr_17x46du atm_k4_kb7nvz_17x46du atm_vv_1q9ccgz_17x46du atm_ks_15vqwwr_17x46du atm_7l_12u4tyr_y5ttn9 atm_k4_kb7nvz_y5ttn9 atm_vv_1q9ccgz_y5ttn9 atm_ks_15vqwwr_y5ttn9 atm_7l_12u4tyr_1k1obal atm_k4_kb7nvz_1k1obal atm_vv_1q9ccgz_1k1obal atm_ks_15vqwwr_1k1obal atm_7l_12u4tyr_m14rgb atm_k4_kb7nvz_m14rgb atm_vv_1q9ccgz_m14rgb atm_ks_15vqwwr_m14rgb atm_7l_12u4tyr_3ykvna atm_k4_kb7nvz_3ykvna atm_vv_1q9ccgz_3ykvna atm_ks_15vqwwr_3ykvna t1dv44lz atm_iy_wwb3ei dir dir-ltr"--%>
        <%--                                                        id="message_input"--%>
        <%--                                                        data-testid="messaging-composebar"--%>
        <%--                                                        label="메시지를 입력하세요."--%>
        <%--                                                        placeholder="메시지를 입력하세요."--%>
        <%--                                                        style="height: 40px;"></textarea></div>--%>
        <%--                            <div class="ojs2cbu atm_9s_1txwivl atm_ar_vrvcex atm_fc_esu3gu atm_h_esu3gu atm_mk_h2mmj6 atm_e2_idpfg4 dir dir-ltr">--%>
        <%--                                <div class="ssri3q4 atm_gi_i2wt44 atm_gq_logulu atm_e2_f13iio atm_ui_b47a47 sd0gavf atm_k4_idpfg4 atm_9j_73adwj dir dir-ltr">--%>
        <%--                                    <button data-testid="messaging_compose_bar_send_button"--%>
        <%--                                            aria-label="보내기" disabled=""--%>
        <%--                                            type="button"--%>
        <%--                                            class="l1ovpqvx atm_1y33qqm_1ggndnn_10saat9 atm_17zvjtw_zk357r_10saat9 atm_w3cb4q_il40rs_10saat9 cwi99vc atm_1s_glywfm atm_5j_1ssbidh atm_9j_tlke0l atm_tl_1gw4zv3 atm_9s_1o8liyq atm_mk_h2mmj6 atm_l8_idpfg4 atm_gi_idpfg4 atm_3f_glywfm atm_26_1j28jx2 atm_7l_18pqv07 atm_uc_1dtz4sb atm_kd_glywfm atm_kd_glywfm_1w3cfyq atm_3f_glywfm_e4a3ld atm_l8_idpfg4_e4a3ld atm_gi_idpfg4_e4a3ld atm_3f_glywfm_1r4qscq atm_kd_glywfm_6y7yyg atm_kd_glywfm_18zk5v0 atm_3f_glywfm_6mgo84 atm_l8_idpfg4_6mgo84 atm_gi_idpfg4_6mgo84 atm_3f_glywfm_16p4kaz atm_kd_glywfm_17yx6rv atm_k4_1piyxwk_1o5j5ji atm_9j_13gfvf7_1o5j5ji atm_uc_glywfm__p88qr9 atm_7l_1otlplk_1nos8r_uv4tnr atm_26_1nh1gcj_1rqz0hn_uv4tnr atm_7l_161hw1_4fughm_uv4tnr atm_26_1j28jx2_1r92pmq_uv4tnr atm_7l_1otlplk_csw3t1 atm_tr_ffmgpj_csw3t1 atm_26_1nh1gcj_1ul2smo atm_3f_glywfm_jo46a5 atm_l8_idpfg4_jo46a5 atm_gi_idpfg4_jo46a5 atm_3f_glywfm_1icshfk atm_kd_glywfm_19774hq atm_uc_x37zl0_1w3cfyq atm_70_glywfm_1w3cfyq atm_uc_glywfm_1w3cfyq_p88qr9 atm_70_216vci_9xuho3 atm_26_1nh1gcj_9xuho3 atm_uc_x37zl0_18zk5v0 atm_70_glywfm_18zk5v0 atm_uc_glywfm_18zk5v0_p88qr9 atm_70_216vci_fiqcvf atm_26_1nh1gcj_fiqcvf atm_7l_161hw1_1o5j5ji atm_26_1j28jx2_154oz7f atm_92_1yyfdc7_vmtskl atm_9s_1ulexfb_vmtskl atm_mk_stnw88_vmtskl atm_tk_1ssbidh_vmtskl atm_fq_1ssbidh_vmtskl atm_tr_pryxvc_vmtskl atm_5j_1ssbidh_vmtskl atm_vy_1ou6n1d_vmtskl atm_e2_1ou6n1d_vmtskl dir dir-ltr">--%>
        <%--                                                        <span class="i1jg9xt2 atm_mk_h2mmj6 dir dir-ltr"><svg--%>
        <%--                                                                role="presentation"--%>
        <%--                                                                aria-hidden="true" focusable="false"--%>
        <%--                                                                width="24" height="24"--%>
        <%--                                                                viewBox="0 0 24 24" fill="none"--%>
        <%--                                                                xmlns="http://www.w3.org/2000/svg"--%>
        <%--                                                                style="height: 24px; width: 24px; display: block; fill: currentcolor;"><circle--%>
        <%--                                                                cx="12" cy="12" r="12"></circle><g--%>
        <%--                                                                clip-path="url(#clipeSendIcon17)"><path--%>
        <%--                                                                transform="scale(1)"--%>
        <%--                                                                fill-rule="evenodd"--%>
        <%--                                                                clip-rule="evenodd"--%>
        <%--                                                                d="M11.2929 6.29289C11.6834 5.90237 12.3166 5.90237 12.7071 6.29289L16.7071 10.2929C17.0976 10.6834 17.0976 11.3166 16.7071 11.7071C16.3166 12.0976 15.6834 12.0976 15.2929 11.7071L13 9.41421V17C13 17.5523 12.5523 18 12 18C11.4477 18 11 17.5523 11 17V9.41421L8.70711 11.7071C8.31658 12.0976 7.68342 12.0976 7.29289 11.7071C6.90237 11.3166 6.90237 10.6834 7.29289 10.2929L11.2929 6.29289Z"--%>
        <%--                                                                fill="white"></path></g><defs><clipPath--%>
        <%--                                                                id="clipeSendIcon17"><rect--%>
        <%--                                                                width="12" height="12" fill="white"--%>
        <%--                                                                transform="translate(6 6)"></rect></clipPath></defs></svg></span>--%>
        <%--                                    </button>--%>
        <%--                                </div>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>

        <div>
            <div class="c1os9z2c atm_mk_stnw88 atm_fq_idpfg4 atm_n3_idpfg4 atm_9s_1txwivl atm_ar_vrvcex atm_fc_1h6ojuz atm_wq_cs5v99 atm_gi_xjk4d9 atm_j3_1fja5my atm_tk_f13iio atm_tk_f13iio__kgj4qw atm_tk_wwb3ei__oggzyc atm_tk_wwb3ei__1v156lz atm_tk_144fm4e__qky54b atm_tk_144fm4e__jx8car dir dir-ltr"></div>
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
