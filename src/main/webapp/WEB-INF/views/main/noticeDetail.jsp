<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/12/19
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>공지사항 - UNIVERSESTAY</title>
    <style>
      .screens-user-noticeDetail__main {
        max-width: 894px;
        margin-left: auto;
        margin-right: auto;
        padding-top: 20px;
        padding-bottom: 96px;
        overflow-x: hidden;
      }

      .screens-user-noticeDetail__main__wrap {
        position: sticky;
        top: 0px;
        width: 100%;
        background-color: rgb(255, 255, 255);
        word-break: keep-all;
        padding-top: 16px;
        padding-bottom: 20px;
      }

      .screens-user-noticeDetail__main__wrap__top {
        display: flex;
      }

      [type=button],
      [type=reset],
      [type=submit],
      button {
        -webkit-appearance: button;
        background-color: transparent;
        background-image: none;
      }

      .screens-user-noticeDetail__main__wrap__top__p {
        margin-right: 12px;
        box-sizing: border-box;
        height: 29px;
        width: 29px;
        padding: 4.5px;
      }

      .fill-NDS20 {
        fill: #333;
      }

      svg {
        display: block;
        vertical-align: middle;
      }

      button {
        border: 0 solid;
      }

      .css-uaphln {
        margin-bottom: 6px;
        display: flex;
      }

      .css-nt26wq {
        position: absolute;
        left: -21px;
        right: 0;
        top: 0;
        z-index: -1;
        height: 100%;
        width: 100vw;
        background-color: rgba(255, 255, 255, 1);
      }


      .css-vma33t {
        margin-bottom: 16px;
        border-bottom-width: 1px;
        --tw-border-opacity: 1;
        border-color: rgb(235 235 235 / var(--tw-border-opacity));
      }

      .css-bm68df {
        /* display: -webkit-box; */
        /* display: -webkit-flex; */
        display: -ms-flexbox;
        display: flex;
        /* -webkit-align-items: center; */
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        /* -webkit-box-pack: center; */
        -ms-flex-pack: center;
        /* -webkit-justify-content: center; */
        justify-content: center;
        white-space: nowrap;
        font-weight: 700;
        --tw-bg-opacity: 1;
        background-color: rgb(255 235 235 / var(--tw-bg-opacity));
        --tw-text-opacity: 1;
        color: rgb(244 88 88 / var(--tw-text-opacity));
        border-radius: 2px;
        padding: 1.5px 4px 1.5px 4px;
        font-size: 0.5625rem;
        line-height: normal;
        letter-spacing: 0px;
        height: 14px;
      }

      .css-iul3il {
        width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .css-eep2qs {
        font-size: 1rem;
        line-height: 1.5rem;
        letter-spacing: 0px;
        font-weight: 600;
        --tw-text-opacity: 1;
        color: rgb(51 51 51 / var(--tw-text-opacity));
      }

      .css-6jt3x5 {
        margin-top: 4px;
        margin-bottom: 20px;
        display: inline-block;
        font-size: 0.8125rem;
        line-height: 1.25rem;
        letter-spacing: 0px;
        --tw-text-opacity: 1;
        color: rgb(194 194 194 / var(--tw-text-opacity));
      }

      .css-1gjhcbr {
        margin-top: 16px;
        font-size: 0.9375rem;
        line-height: 1.375rem;
        letter-spacing: 0px;
        --tw-text-opacity: 1;
        color: rgb(51 51 51 / var(--tw-text-opacity));
      }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<main>
    <div class="screens-user-noticeDetail__main">
        <div class="screens-user-noticeDetail__main__wrap">
            <div class="screens-user-noticeDetail__main__wrap__top">
                <button type="button"
                        class="screens-user-noticeDetail__main__wrap__top">
                    <p class="screens-user-noticeDetail__main__wrap__top__p">
                        <svg width="20" height="20"
                             viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"
                             class="fill-NDS20">
                            <path
                                    d="M17.586 9v2h-12.2c.003.004.157.17.36.366.203.196 5.24 5.234 5.24 5.234l-1.4 1.4-6.572-6.567a2.027 2.027 0 010-2.866L9.586 2l1.4 1.4-5.24 5.246a8.33 8.33 0 00-.36.354h12.2z"
                                    fill="current"></path>
                        </svg>
                    </p>
                </button>
            </div>
            <div class="css-nt26wq"></div>
        </div>
        <header class="css-vma33t"><span class="css-uaphln">
                    <div class="gc-tag css-bm68df" aria-label="태그"><span
                            class="css-iul3il">공지</span></div>
                </span>
            <h1 class="css-eep2qs">채용 개인정보처리방침 변경 안내</h1><span class="css-6jt3x5">2023.09.06</span>
        </header>
        <section class="css-1gjhcbr">
            <div style="white-space: pre">${noticeDto.notice_ctt}
            </div>
        </section>
    </div>
</main>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
</body>
</html>
