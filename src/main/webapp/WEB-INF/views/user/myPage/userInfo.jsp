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
            <div>계정 정보</div>

            <div class="screens-user-userInfo__line"></div>
            <div class="screens-user-userInfo__section1">
                <div>
                    <span>이메일</span>
                    <span>${user.user_email}</span>
                </div>
                <div>
                    <span>이름</span>
                    <span>${user.user_name}</span>
                </div>
                <div>
                    <span>신분증 인증 여부</span>
                    <span>${user.user_is_certificated}</span>
                    <button>인증하기</button>
                </div>
                <div>
                    <div class="screens-user-userInfo__pwd-container">
                        <span>비밀번호</span>
                        <span> ********* </span>
                        <span></span>
                        <button class="screens-user-userInfo__pwd-modify-button">변경하기</button>
                    </div>
                    <div class="screens-user-userInfo__pwd-container-modify">
                        <span>비밀번호</span>
                        <div>
                            <div>
                                <span>현재 비밀번호</span>
                                <div>
                                    <input class="screens-user-userInfo__current-pwd"
                                           type="password">
                                    <span class="screens-user-userInfo__current-pwd-helper-txt"></span>
                                </div>
                            </div>
                            <div>
                                <span>신규 비밀번호</span>
                                <div>
                                    <input class="screens-user-userInfo__change-pwd"
                                           type="password">
                                    <span class="screens-user-userInfo__change-pwd-helper-txt"></span>
                                </div>
                            </div>
                            <div>
                                <span>신규 비밀번호</span>
                                <div>
                                    <input class="screens-user-userInfo__change-pwd2"
                                           type="password">
                                    <span class="screens-user-userInfo__change-pwd2-helper-txt"></span>
                                </div>
                            </div>
                            <button class="screens-user-userInfo__password-modify-cancel-btn">취소
                            </button>
                            <button class="screens-user-userInfo__password-modify-done-btn">변경 완료
                            </button>
                        </div>
                        <span></span>
                    </div>
                </div>
            </div>

            <div class="screens-user-userInfo__line"></div>

            <div class="screens-user-userInfo__section2">
                <form class="screens-user-userInfo__user-info-modify-form">
                    <div>
                        <span>프로필 사진</span>
                        <img class="screens-user-userInfo__profile-img" src="${profileImgUrl}">
                        <input class="screens-user-userInfo__img-insert-btn hidden" type="file"
                               onchange="readURL(this);">
                    </div>
                    <div>
                        <input class="screens-user-userInfo__user-id-input" type="hidden"
                               value="${user.user_id}">
                        <span>닉네임</span>
                        <div>
                            <input class="screens-user-userInfo__nickname-input"
                                   value="${user.user_nickname}" readonly>
                            <span class="screens-user-userInfo__nickname-helper-text"></span>
                            <ul> - 길이는 최대 15자 이내로 작성해주세요.</ul>
                            <ul> - 중복 닉네임 불가합니다.</ul>
                            <ul> - 이모티콘 및 일부 특수문자 사용 불가합니다. &<>()'/"</ul>
                        </div>
                        <button class="screens-user-userInfo__nickname-check-btn hidden"
                                type="button">중복 확인
                        </button>
                    </div>
                    <div>
                        <span>자기소개</span>
                        <textarea class="screens-user-userInfo__bio-input"
                                  readonly>${user.user_bio}</textarea>
                    </div>
                    <div>
                        <span>휴대전화</span>
                        <input class="screens-user-userInfo__phone-input"
                               value="${user.user_phone_num1}" readonly>
                    </div>
                    <div>
                        <span>전화번호</span>
                        <input class="screens-user-userInfo__phone2-input"
                               value="${user.user_phone_num2}" readonly>
                    </div>
                    <button type="button"
                            class="screens-user-userInfo__user-info-modify-cancel-btn hidden">취소
                    </button>
                    <button class="screens-user-userInfo__user-info-modify-done-btn hidden">수정완료
                    </button>
                </form>
                <button class="screens-user-userInfo__user-info-modify-btn">수정하기</button>

            </div>

            <div class="screens-user-userInfo__line"></div>
            <div class="screens-user-userInfo__section3">
                <div>
                    <span>회원 탈퇴</span>
                    <button class="screens-user-userInfo__user-withdrawal">회원 탈퇴</button>
                </div>
            </div>

        </div>
    </div>
</section>

<script>

    // ---------------------   비밀번호 변경하기 누르면 바뀌는 div 관련 ------------------------------
    const pwdModifyBtn = document.querySelector(".screens-user-userInfo__pwd-modify-button");
    const pwdModifyCancelBtn = document.querySelector(
            ".screens-user-userInfo__password-modify-cancel-btn");
    const pwdDiv = document.querySelector(".screens-user-userInfo__pwd-container");
    const pwdModifyDiv = document.querySelector(".screens-user-userInfo__pwd-container-modify");

    const showPwdModifyDiv = function () {
        pwdModifyDiv.classList.add("show");
        pwdDiv.classList.add("hidden");
    }

    const hidePwdModifyDiv = function () {
        pwdModifyDiv.classList.remove("show");
        pwdDiv.classList.remove("hidden");
    }

    pwdModifyBtn.addEventListener("click", showPwdModifyDiv)
    pwdModifyCancelBtn.addEventListener("click", hidePwdModifyDiv);

    // --------------------------------------------------------------------------
    // -------------------------수정하기 버튼을 눌렀을때--------------------------------
    const userInfoModifyDoneBtn = document.querySelector(
            ".screens-user-userInfo__user-info-modify-done-btn");
    const userInfoModifyBtn = document.querySelector(
            ".screens-user-userInfo__user-info-modify-btn");
    const userInfoModifyCancelBtn = document.querySelector(
            ".screens-user-userInfo__user-info-modify-cancel-btn");
    const imgInput = document.querySelector(".screens-user-userInfo__img-insert-btn");
    const nicknameInput = document.querySelector(".screens-user-userInfo__nickname-input");
    const bioInput = document.querySelector(".screens-user-userInfo__bio-input");
    const phoneInput = document.querySelector(".screens-user-userInfo__phone-input");
    const phone2Input = document.querySelector(".screens-user-userInfo__phone2-input");
    const checkUserNickname = document.querySelector(".screens-user-userInfo__nickname-check-btn");

    const showUserInfoModifyBtn = () => {
        //수정하기 버튼 누르면 취소, 수정완료 버튼 보이게 하고 수정하기 버튼 숨기기
        userInfoModifyDoneBtn.classList.toggle("hidden");
        userInfoModifyCancelBtn.classList.toggle("hidden");
        userInfoModifyBtn.classList.toggle("hidden");
        imgInput.classList.toggle("hidden");
        checkUserNickname.classList.toggle("hidden");

        //readonly였던 Input들 활성화 시키기.
        nicknameInput.removeAttribute("readonly")
        bioInput.removeAttribute("readonly")
        phoneInput.removeAttribute("readonly")
        phone2Input.removeAttribute("readonly")
    };

    userInfoModifyBtn.addEventListener("click", showUserInfoModifyBtn);

    userInfoModifyCancelBtn.addEventListener("click", () => {
        userInfoModifyDoneBtn.classList.add("hidden");
        userInfoModifyCancelBtn.classList.add("hidden");
        imgInput.classList.add("hidden");
        checkUserNickname.classList.add("hidden");
        userInfoModifyBtn.classList.remove("hidden");

        bioInput.setAttribute("readonly", true)
        phoneInput.setAttribute("readonly", true)
        phone2Input.setAttribute("readonly", true)
        window.location.href = '/user/myPage/info';
    });

    // 회원탈퇴
    const withdrawalBtn = document.querySelector(".screens-user-userInfo__user-withdrawal");
    withdrawalBtn.addEventListener("click", () => {
        location.href = "/user/myPage/withdrawal";
    })

    //비밀번호 변경 ajax
    $(function () {
        $(".screens-user-userInfo__password-modify-done-btn").click(function () {
            const check_pwd = $(".screens-user-userInfo__current-pwd").val();
            const new_pwd = $(".screens-user-userInfo__change-pwd").val();
            const new_pwd2 = $(".screens-user-userInfo__change-pwd2").val();

            $.ajax({
                type: 'post',
                url: "/user/myPage/info/changePwd",
                data: {"check_pwd": check_pwd, "new_pwd": new_pwd, "new_pwd2": new_pwd2},
                success: function (response) {
                    if (response === "Correct") {
                        alert("비밀번호 변경이 완료되었습니다.")
                    }
                    console.log("성공")
                },
                error: function (xhr, status, error) {
                    if (xhr.responseText === "Incorrect_with_DB") {
                        alert("기존 비밀번호가 일치하는지 확인해주세요.")
                    } else if (xhr.responseText === 'Incorrect_with_pwd_pwd2') {
                        alert('신규 비밀번호 확인이 일치하지 않습니다.');
                    }
                },
            });
        });
    });

    //프로필 이미지 미리 보여주기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.querySelector(
                        '.screens-user-userInfo__profile-img').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.querySelector('.screens-user-userInfo__profile-img').src = "";
        }
    }

    // 신규 비밀번호 유효성 검사
    $(function () {
        $(".screens-user-userInfo__change-pwd").on('input', function () {
            var pw = $(".screens-user-userInfo__change-pwd").val();
            var num = pw.search(/[0-9]/g);
            var eng = pw.search(/[a-z]/ig);
            var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

            if (pw.length < 8 || pw.length > 20) {
                result = "8자리 ~ 20자리 이내로 입력해주세요.";
                $(".screens-user-userInfo__change-pwd-helper-txt").html(result).addClass(
                        "unavailable");
            } else if (pw.search(/\s/) != -1) {
                result = "비밀번호는 공백 없이 입력해주세요.";
                $(".screens-user-userInfo__change-pwd-helper-txt").html(result).addClass(
                        "unavailable");
            } else if (num < 0 || eng < 0 || spe < 0) {
                result = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";
                $(".screens-user-userInfo__change-pwd-helper-txt").html(result).addClass(
                        "unavailable");
            } else {
                result = "사용 가능한 비밀번호입니다.";
                $(".screens-user-userInfo__change-pwd-helper-txt").html(result).removeClass(
                        "unavailable");
            }
        })
    });

    //신규 비밀번호 재입력 유효성검사
    $(function () {
        $(".screens-user-userInfo__change-pwd, .screens-user-userInfo__change-pwd2").on('input',
                function () {
                    let user_pw = $(".screens-user-userInfo__change-pwd").val();
                    let user_pw2 = $(".screens-user-userInfo__change-pwd2").val();

                    if (user_pw === user_pw2 && user_pw2 !== null && user_pw !== null
                            && user_pw2 !== "" && user_pw !== "") {
                        result = "비밀번호가 일치합니다.";
                        $(".screens-user-userInfo__change-pwd2-helper-txt").html(
                                result).removeClass("unavailable");
                    } else if (user_pw !== user_pw2) { // In case of failure
                        const result = "비밀번호가 일치하지 않습니다.";
                        $(".screens-user-userInfo__change-pwd2-helper-txt").html(
                                result).addClass("unavailable");
                    } else if (user_pw2 == null || user_pw == null || user_pw2 == ""
                            || user_pw == "") {
                        const result = "비밀번호 확인을 입력해주세요.";
                        $(".screens-user-userInfo__change-pwd2-helper-txt").html(
                                result).addClass("unavailable");
                    }
                });
    });

    // 예시jQuery코드
    $('.screens-user-userInfo__user-info-modify-form').submit(function (e) {
        e.preventDefault(); // 기본 제출 행동 방지
        var formData = new FormData();
        var img = $('.screens-user-userInfo__img-insert-btn')[0].files[0];
        formData.append('img', img);

        var user = {
            user_id: $('.screens-user-userInfo__user-id-input').val(),
            user_nickname: $('.screens-user-userInfo__nickname-input').val(),
            user_bio: $('.screens-user-userInfo__bio-input').val(),
            user_phone_num1: $('.screens-user-userInfo__phone-input').val(),
            user_phone_num2: $('.screens-user-userInfo__phone2-input').val()
            // 필요한 다른 데이터들을 추가
        };

        formData.append('user', new Blob([JSON.stringify(user)], {type: "application/json"})); // JSON 데이터 추가

        // 유저 정보 update
        $.ajax({
            url: '/user/myPage/info/update',
            type: 'POST',
            data: formData,
            enctype: 'multipart/form-data',
            contentType: false,
            processData: false,
            success: function (response, status, xhr) {
                if (response === "Success") {
                    alert("수정이 완료되었습니다.")
                    window.location.href = '/user/myPage/info';
                }
            },
            error: function (xhr, status, error) {
                if (xhr.responseText === "DuplicateKeyError") {
                    alert("닉네임 중복확인을 진행해주세요.")
                } else if (xhr.responseText === 'ServerError') {
                    alert('서버 에러 발생');
                }
            }
        });
    });

    //닉네임 중복확인
    $(function () {
        $(".screens-user-userInfo__nickname-check-btn").click(function () {
            let user_nickname = $(".screens-user-userInfo__nickname-input").val();
            console.log(user_nickname);

            $.ajax({
                type: 'post',
                url: "/user/myPage/info/checkNickname",
                data: {"user_nickname": user_nickname},
                success: function (response) {
                    if (response == "Y") {
                        const result = "이 닉네임을 사용할 수 있습니다.";

                        $(".screens-user-userInfo__nickname-helper-text").html(
                                result).removeClass(
                                "unavailable")

                    } else { // 실패한 경우
                        const result = "이 닉네임은 이미 사용 중입니다.";
                        $(".screens-user-userInfo__nickname-helper-text").html(result).addClass(
                                "unavailable");

                        $(".screens-user-userInfo__nickname-input").val("").trigger("focus");
                    }
                },
                error: function (error) {
                    const result = "이 닉네임은 이미 사용 중입니다.";
                    $(".screens-user-userInfo__nickname-helper-text").html(result).addClass(
                            "unavailable");
                },
            });
        });
    });


</script>
</body>
</html>

