<%--
  Created by IntelliJ IDEA.
  User: hannaryu
  Date: 11/28/23
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>myPage</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

</head>

<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section class="screens-user-userInfo__body">
    <div class="screens-user-userInfo__container">
        <div class="screens-user-userInfo__wrapper">
            <h1 class="screens-user-userInfo-h1">계정 정보</h1>

            <%--구분선--%>
            <div class="screens-user-userInfo__line"></div>

            <%--이메일, 이름, 신분증 인증, 비밀번호 수정 구역--%>

            <div class="screens-user-userInfo__section1">

                <div class="screens-user-userInfo__email">
                    <span class="screens-user-userInfo__label">이메일</span>
                    <span class="screens-user-userInfo__content">${user.user_email}</span>
                </div>

                <div class="screens-user-userInfo__name">
                    <span class="screens-user-userInfo__label">이름</span>
                    <span class="screens-user-userInfo__content">${user.user_name}</span>
                </div>

                <div class="screens-user-userInfo__id-verification">
                    <span class="screens-user-userInfo__label">신분증 인증 여부</span>
                    <span class="screens-user-userInfo__content">${user.user_is_certificated == 'N' ? '미인증' : '인증 완료'}</span>
                    <button class="screens-user-userInfo__button">인증하기</button>
                </div>

                <div class="screens-user-userInfo__pwd">

                    <div class="screens-user-userInfo__pwd-container">
                        <span class="screens-user-userInfo__label">비밀번호</span>
                        <span class="screens-user-userInfo__content"> ********* </span>
                        <button class="screens-user-userInfo__button screens-user-userInfo__pwd-modify-button">
                            변경하기
                        </button>
                    </div>

                    <div class="screens-user-userInfo__pwd-container-modify">
                        <span class="screens-user-userInfo__label">비밀번호</span>
                        <div class="screens-user-userInfo__content screens-user-userInfo__pwd-container-modify__div">
                            <div class="screens-user-userInfo__pwd-container-modify__div__inner-div">
                                <span>현재 비밀번호</span>
                                <div>
                                    <input class="screens-user-userInfo__input screens-user-userInfo__current-pwd"
                                           type="password">
                                    <span class="screens-user-userInfo__current-pwd-helper-txt"></span>
                                </div>
                            </div>
                            <div class="screens-user-userInfo__pwd-container-modify__div__inner-div">
                                <span>신규 비밀번호</span>
                                <div>
                                    <input class="screens-user-userInfo__input screens-user-userInfo__change-pwd"
                                           type="password">
                                    <span class="screens-user-userInfo__change-pwd-helper-txt"></span>
                                </div>
                            </div>
                            <div class="screens-user-userInfo__pwd-container-modify__div__inner-div">
                                <span>신규 비밀번호 재확인</span>
                                <div>
                                    <input class="screens-user-userInfo__input screens-user-userInfo__change-pwd2"
                                           type="password">
                                    <span class="screens-user-userInfo__change-pwd2-helper-txt"></span>
                                </div>
                            </div>
                            <div>
                                <button class="screens-user-userInfo__button screens-user-userInfo__password-modify-cancel-btn">
                                    취소
                                </button>
                                <button class="screens-user-userInfo__button screens-user-userInfo__password-modify-done-btn">
                                    변경 완료
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <%--구분선--%>
            <div class="screens-user-userInfo__line"></div>

            <%--프로필 사진, 닉네임, 자기소개, 휴대전화, 전화번호 수정 구역--%>
            <div class="screens-user-userInfo__section2">
                <form class="screens-user-userInfo__user-info-modify-form">
                    <div class="screens-user-userInfo__profile-img">
                        <span class="screens-user-userInfo__label">프로필 사진</span>
                        <div class="screens-user-userInfo__profile-img-box">
                            <img class="screens-user-userInfo__profile-img-file"
                                 src="${profileImgUrl}">
                        </div>
                        <input class=" screens-user-userInfo__img-insert-btn hidden"
                               type="file" accept=".jpg, .jpeg, .png, .heic, .webp"
                               onchange="readURL(this);">
                    </div>
                    <div class="screens-user-userInfo__nickname">
                        <input class="screens-user-userInfo__input screens-user-userInfo__user-id-input"
                               type="hidden"
                               value="${user.user_id}">
                        <span class="screens-user-userInfo__label">닉네임</span>
                        <div class="screens-user-userInfo__content screens-user-userInfo__nickname__content">
                            <input class="screens-user-userInfo__content screens-user-userInfo__input screens-user-userInfo__nickname-input"
                                   value="${user.user_nickname}" onfocus="this.blur()" readonly>
                            <span class="screens-user-userInfo__nickname-helper-text"></span>
                        </div>
                        <button class="screens-user-userInfo__button screens-user-userInfo__nickname-check-btn hidden"
                                type="button">중복 확인
                        </button>
                    </div>
                    <div class="screens-user-userInfo__bio">
                        <span class="screens-user-userInfo__label">자기소개</span>
                        <textarea
                                class="screens-user-userInfo__content screens-user-userInfo__bio-input"
                                onfocus="this.blur()" readonly>${user.user_bio}</textarea>
                    </div>
                    <div class="screens-user-userInfo__phone">
                        <span class="screens-user-userInfo__label">휴대전화</span>
                        <input class="screens-user-userInfo__content screens-user-userInfo__input screens-user-userInfo__phone-input"
                               value="${user.user_phone_num1}" onfocus="this.blur()" readonly>
                    </div>
                    <div class="screens-user-userInfo__phone2">
                        <span class="screens-user-userInfo__label">전화번호</span>
                        <input class="screens-user-userInfo__content screens-user-userInfo__input screens-user-userInfo__phone2-input"
                               value="${user.user_phone_num2}" onfocus="this.blur()" readonly>
                    </div>
                    <div class="screens-user-userInfo__user-info-modify-btns">
                        <button type="button"
                                class="screens-user-userInfo__button screens-user-userInfo__user-info-modify-cancel-btn hidden">
                            취소
                        </button>
                        <button class="screens-user-userInfo__button screens-user-userInfo__user-info-modify-done-btn hidden">
                            수정 완료
                        </button>
                    </div>
                    <button type="button"
                            class="screens-user-userInfo__button screens-user-userInfo__user-info-modify-btn">
                        수정하기
                    </button>
                </form>

            </div>

            <%--구분선--%>
            <div class="screens-user-userInfo__line"></div>

            <%--회원 탈퇴 구역--%>
            <div class="screens-user-userInfo__section3">
                <div class="screens-user-userInfo__withdrawal">
                    <span class="screens-user-userInfo__label">회원 탈퇴</span>
                    <button class="screens-user-userInfo__button screens-user-userInfo__user-withdrawal-btn">
                        회원 탈퇴
                    </button>
                </div>
            </div>

        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script src="/resources/js/user/userInfo.js"></script>

</body>
</html>


