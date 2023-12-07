//-- 유저 로그인시 유저 활성 상태에 따라 alert --//
const statusId = "${statusId}";
if (statusId == "U02") {
    alert("현재 휴면 상태입니다. 해제 하시겠습니까?");
}
if (statusId == "U03") {
    alert("정지된 아이디입니다. 관리자에게 문의 하세요");
}
if (statusId == "U04") {
    alert("회원탈퇴한 아이디입니다. 관리자에게 문의 하세요");
}
