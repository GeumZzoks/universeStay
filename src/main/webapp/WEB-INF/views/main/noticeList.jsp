<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/12/18
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>공지사항 - UNIVERSESTAY</title>
    <style>
      .notice-section {
        max-width: 894px;
        margin-left: auto;
        margin-right: auto;

        padding-top: 20px;
        padding-bottom: 96px;
      }

      .notice-header-container {
        width: 100%;

        display: flex;
        flex-direction: column;

        gap: 4px;

        padding-top: 16px;
        padding-bottom: 20px;
      }

      .notice-header-container .notice-header {
        font-size: 24px;

        line-height: normal;
        letter-spacing: 0px;
        font-weight: 700;

        --tw-text-opacity: 1;
        color: rgb(51 51 51 / var(--tw-text-opacity));
        margin: 0;
      }

      .notice-header-container .notice-text {
        font-size: 16px;
        margin: 0;

        letter-spacing: 0px;
        --tw-text-opacity: 1;
        color: rgb(153 153 153 / var(--tw-text-opacity));
      }

      .notice-list {
        width: 100%;
        overflow: hidden;
        background-color: rgba(255, 255, 255, 1);

        margin: 0;
        padding: 0;
      }

      .notice-item {
        width: 100%;

        display: flex;
        align-items: center;
        flex-direction: row;
        justify-content: space-between;

        cursor: pointer;

        padding-top: 20px;
        padding-bottom: 20px;

        --tw-border-opacity: 1;
        border-bottom: 1px solid rgb(235 235 235 / var(--tw-border-opacity));
      }

      .notice-item:hover {
        --tw-bg-opacity: 1;
        background-color: rgb(250 250 250 / var(--tw-bg-opacity));
      }

      .notice-item .notice-item-title-container {
        display: flex;
        align-items: center;

        gap: 24px;
      }

      .screens-user-notice__wrap__headBtn:hover {
        background-color: #d4d7e5;
      }

      .notice-item .notice-item-category {
        font-size: 9px;
        line-height: normal;
        letter-spacing: 0px;
        height: 14px;

        display: flex;
        justify-content: center;
        align-items: center;
        white-space: nowrap;
        font-weight: 700;

        --tw-bg-opacity: 1;
        background-color: rgb(255 235 235 / var(--tw-bg-opacity));

        --tw-text-opacity: 1;
        color: rgb(244 88 88 / var(--tw-text-opacity));

        border-radius: 2px;
        padding: 1.5px 4px;
      }

      .notice-item .notice-item-category > span {
        width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .notice-item .notice-title {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        overflow: hidden;

        font-size: 16px;
        font-weight: 600;
        letter-spacing: 0px;

        --tw-text-opacity: 1;
        color: rgb(51 51 51 / var(--tw-text-opacity));
      }

      .notice-item .notice-createdAt {
        font-size: 13px;
        letter-spacing: 0px;

        --tw-text-opacity: 1;
        color: rgb(194 194 194 / var(--tw-text-opacity));
      }

      .screens-user-notice__navi {
        margin-top: 40px;
        margin-bottom: 30px;
      }

      .screens-user-notice__wrap {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
      }

      .screens-user-notice__wrap__btn {
        height: 32px;
        width: 32px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        margin: 0px 4px;
        border-radius: 500px;
        cursor: pointer;
      }

      [type=button],
      button {
        -webkit-appearance: button;
        background-color: transparent;
        border: 0 solid;
      }

      .screens-user-notice__wrap__headBtn {
        height: 32px;
        width: 32px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        margin: 0px 4px;
        border-radius: 500px;
        cursor: pointer;
        --tw-bg-opacity: 1;
        font-size: 0.75rem;
        line-height: normal;
        letter-spacing: 0px;
        font-weight: 600;
        color: rgb(0, 0, 0);
      }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section class="notice-section">
    <div class="notice-header-container">
        <h1 class="notice-header">공지사항</h1>
        <p class="notice-text">업데이트 정보 등 다양한 소식을 알려드립니다.</p>
    </div>

    <!--JSP 코드로 변경 -->
    <ul class="notice-list">
        <c:forEach var="notice" items="${list}">
            <!-- Item - 1 -->
            <li class="notice-item" onclick="location.href='/notice/${notice.notice_id}'">
                <div class="notice-item-title-container">
                    <div class="notice-item-category">
                        <span>공지</span>
                    </div>

                    <div class="notice-title">${notice.notice_title}</div>
                </div>

                <div class="notice-createdAt"><fmt:formatDate
                        value="${notice.created_at}"
                        pattern="yyyy-MM-dd" type="date"/></div>
            </li>
        </c:forEach>
    </ul>
    <div class="screens-user-notice__navi">
        <div>
            <div class="screens-user-notice__wrap">
                <button type="button" aria-label="처음" class="screens-user-notice__wrap__btn"
                        onclick="location.href='/notice?page=1&pageSize=${nph.pageSize}'">
                    <svg width="32" height="16" viewBox="0 0 40 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M12.98 14.594L11.573 16l-4.986-4.594a1.978 1.978 0 010-2.812c.52-.518 2.19-2.049 5.007-4.594l1.401 1.392L7.975 10l5.005 4.594z"
                                fill="#99999"></path>
                        <path
                                d="M26.98 14.594L25.573 16l-4.986-4.594a1.978 1.978 0 010-2.812c.52-.518 2.19-2.049 5.007-4.594l1.401 1.392L21.975 10l5.005 4.594z"
                                fill="#99999"></path>
                    </svg>
                </button>
                <c:if test="${nph.showPrev}">
                    <button type="button" aria-label="이전" class="screens-user-notice__wrap__btn"
                            onclick="location.href='/notice?page=${nph.beginPage-1}&pageSize=${nph.pageSize}'">
                        <svg width="16" height="16" viewBox="0 0 20 20" fill="#99999"
                             xmlns="http://www.w3.org/2000/svg">
                            <path
                                    d="M12.98 14.594L11.573 16l-4.986-4.594a1.978 1.978 0 010-2.812c.52-.518 2.19-2.049 5.007-4.594l1.401 1.392L7.975 10l5.005 4.594z"
                                    fill="current"></path>
                        </svg>
                    </button>
                </c:if>
                <c:forEach var="i" begin="${nph.beginPage}" end="${nph.endPage}">
                    <button type="button" class="screens-user-notice__wrap__headBtn"
                            onclick="location.href='/notice?page=${i}&pageSize=${nph.pageSize}'">${i}</button>
                </c:forEach>
                <c:if test="${nph.showNext}">
                    <button type="button" aria-label="다음" class="screens-user-notice__wrap__btn"
                            onclick="location.href='/notice?page=${nph.endPage+1}&pageSize=${nph.pageSize}'">
                        <svg width="16" height="16" viewBox="0 0 20 20" fill="#99999"
                             xmlns="http://www.w3.org/2000/svg">
                            <path
                                    d="M7.016 14.594L12.02 10 7 5.392 8.402 4c2.816 2.545 4.485 4.076 5.007 4.594a1.978 1.978 0 010 2.812L8.422 16l-1.406-1.406z"
                                    fill="current"></path>
                        </svg>
                    </button>
                </c:if>
                <button type="button" aria-label="마지막" class="screens-user-notice__wrap__btn"
                        onclick="location.href='/notice?page=${nph.totalPage}&pageSize=${nph.pageSize}'">
                    <svg width="32" height="16" viewBox="0 0 40 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M27.02 5.406L28.429 4l4.986 4.594a1.978 1.978 0 010 2.812c-.52.518-2.19 2.049-5.007 4.594l-1.401-1.392L32.025 10l-5.005-4.594z"
                                fill="#99999"></path>
                        <path
                                d="M13.02 5.406L14.429 4l4.986 4.594a1.978 1.978 0 010 2.812c-.52.518-2.19 2.049-5.007 4.594l-1.401-1.392L18.025 10l-5.005-4.594z"
                                fill="#99999"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script>

    const pageClickBtn = document.querySelectorAll(".screens-user-notice__wrap__headBtn");

    window.onload = function () {
        const clickPage = pageClickBtn[${nph.page-nph.beginPage}];
        clickPage.style.color = 'rgb(255, 255, 255)';
        clickPage.style.backgroundColor = 'rgb(18, 115, 228)';
    }
</script>
</body>
</html>
