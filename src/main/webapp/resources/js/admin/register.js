// 회원가입 버튼 클릭 시
$(document).ready(function () {
    // 가입하기 버튼 클릭 이벤트
    document.getElementById(
            "screens-admin-register_signup_btn").addEventListener("click",
            function () {
                if (!fnSubmit()) {
                    return;
                }

                // 사용자가 입력한 정보
                let admin_nickname = document.getElementById(
                        "screens-admin-register_signup_id").value;
                let admin_pwd = document.getElementById(
                        "screens-admin-register_signup_pw").value;
                let admin_pwd2 = document.getElementById(
                        "screens-admin-register_signup_pww").value;
                let admin_email = document.getElementById(
                        "screens-admin-register_signup_email").value;
                let admin_phone_num = document.getElementById(
                        "screens-admin-register_signup_phone_1").value;

                // 서버로 전송할 데이터를 객체
                let adminDto = {
                    admin_nickname: admin_nickname,
                    admin_pwd: admin_pwd,
                    admin_pwd2: admin_pwd2,
                    admin_email: admin_email,
                    admin_phone_num: admin_phone_num,
                };

                // 서버에 가입 요청
                $.ajax({
                    type: "POST",
                    url: "/admin/register/confirm", // 가입 요청을 처리하는 컨트롤러 주소
                    contentType: "application/json",
                    data: JSON.stringify(adminDto),
                    success: function (res) {
                        console.log(res);
                        alert("회원가입에 성공하였습니다.");
                        location.href = "/admin/main/dashboard";

                    },
                    error: function (res) {
                        console.log(res);
                        alert("회원가입에 실패하였습니다.");
                        location.href = "/admin/register/join";
                    }
                });

            });

    /**
     * [관리자 - 회원가입] 아이디 중복 유효성 검사
     * 입력한 비밀번호가 동일한지 확인
     * @param userEmail, password, request
     * @return boolean
     * @throws Exception
     */
    $(function () {
        $("#screens-admin-register_id_Check_Btn").click(function () {
            let admin_nickname = $("#screens-admin-register_signup_id").val();
            let result = "";

            $.ajax({
                type: 'post',
                url: "/admin/register/checkNickname",
                data: {"admin_nickname": admin_nickname},
                success: function (res) {
                    if (res === "N") {

                        result = "이 아이디를 사용할 수 있습니다.";

                        $("#id_input_helper_text").html(result).removeClass(
                                "unavailable")
                    }
                },
                error: function (error) {
                    const result = "이 아이디는 이미 사용 중입니다.";
                    $("#id_input_helper_text").html(result).addClass(
                            "unavailable");

                    $("#screens-admin-register_signup_id").val("").trigger(
                            "focus");

                },
            });
        });

        $(function () {
            $("#screens-admin-register_signup_pw, #screens-admin-register_signup_pww").on(
                    'input', function () {

                        let admin_pwd1 = $(
                                "#screens-admin-register_signup_pw").val();
                        let admin_pwd2 = $(
                                "#screens-admin-register_signup_pww").val();

                        if (admin_pwd1 == admin_pwd2) {

                            result = "비밀번호가 일치합니다.";
                            $("#pwd_input_helper_text").html(
                                    result).removeClass("unavailable");
                        } else { // In case of failure
                            const result = "비밀번호가 일치하지 않습니다.";
                            $("#pwd_input_helper_text").html(result).addClass(
                                    "unavailable");
                        }
                    });

        });
    });

    /**
     * [관리자 - 회원가입] 데이터 유효성 검사
     * 공백 여부 체크
     * @param userEmail, password, request
     * @return boolean
     * @throws Exception
     */
    function fnSubmit() {

        const email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        const tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

        if ($("#screens-admin-register_signup_id").val() == null || $(
                "#screens-admin-register_signup_id").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#screens-admin-register_signup_id").focus();

            return false;
        }

        if ($("#screens-admin-register_signup_pw").val() == null || $(
                "screens-user-join_signup_pw").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#screens-admin-register_signup_pw").focus();

            return false;
        }

        if ($("#screens-admin-register_signup_pww").val() == null || $(
                "#screens-admin-register_signup_pww").val() == "") {
            alert("비밀번호 확인을 입력해주세요.");
            $("#screens-admin-register_signup_pww").focus();

            return false;
        }

        if ($("#screens-admin-register_signup_email").val() == null || $(
                "#screens-admin-register_signup_email").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#screens-admin-register_signup_email").focus();

            return false;
        }

        if (!email_rule.test($("#screens-admin-register_signup_email").val())) {
            alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
            $("#screens-admin-register_signup_email").focus();
            return false;
        }

        if ($("#screens-admin-register_code_check_input").val() == null || $(
                "#screens-admin-register_code_check_input").val() == "") {
            alert("인증번호를 입력해주세요.");
            $("#screens-admin-register_code_check_input").focus();

            return false;
        }

        if (!tel_rule.test($("#screens-admin-register_signup_phone_1").val())) {
            alert("전화번호 형식에 맞게 입력해주세요. ex) 010-0000-0000");
            $("#screens-admin-register_signup_phone_1").focus();
            return false;
        }

        if (confirm("회원가입하시겠습니까?")) {
            $("#screens-admin-register_signup_btn").submit();
            return true;
        }

    }
});

const sendDataToServer = function (inputValue, url) {
    // Ajax 요청
    $.ajax({
        url: `/admin/register/${url}?value=${inputValue}`,
        method: 'GET',
        success: function (response) {
            // 성공적으로 응답을 받았을 때 수행할 작업
            let result = "";
            if (response === "success-email") {

                result = "이 메일을 사용할 수 있습니다.";
                $("#email_input_helper_text").html(result).removeClass(
                        "unavailable");

            } else if (response === "success-phone") {

                result = "이 핸드폰을 사용할 수 있습니다.";
                $("#phone_input_helper_text").html(result).removeClass(
                        "unavailable");
            }
        },
        error: function (res) {
            // 오류가 발생했을 때 수행할 작업

            let result = "";
            if (res.responseText === "error-email") {
                result = "이 메일을 사용할 수 없습니다.";
                $("#email_input_helper_text").html(result).addClass(
                        "unavailable");

            } else if (res.responseText === "error-phone") {
                result = "이 핸드폰을 사용할 수 없습니다.";
                $("#phone_input_helper_text").html(result).addClass(
                        "unavailable");
            }
        }
    });

};

// input 요소에 대한 blur 이벤트 리스너 등록
document.getElementById('screens-admin-register_signup_email').addEventListener(
        'blur', function () {

            const inputValue = $('#screens-admin-register_signup_email').val();

            // 사용자가 입력을 마치고 포커스를 잃으면 Ajax 요청을 보냄
            sendDataToServer(inputValue, "checkUniqueEmail");
        });

document.getElementById(
        'screens-admin-register_signup_phone_1').addEventListener('blur',
        function () {

            const inputValue = $(
                    '#screens-admin-register_signup_phone_1').val();

            // 사용자가 입력을 마치고 포커스를 잃으면 Ajax 요청을 보냄
            sendDataToServer(inputValue, "checkUniquePhoneNumber");
        });
