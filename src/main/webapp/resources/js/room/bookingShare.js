/* 제출하기 버튼을 클릭 시 */
const submitButton = document.getElementById("submit-button");
submitButton.onclick = function () {

    const emailsElement = document.querySelectorAll(
            ".screens-room-bookShare__write-email-box--email");

    const emails = Array.from(emailsElement)
    .map(input => input.value)
    .filter(email => email.trim() !== ""); // 빈 문자열이 아닌 것만 필터링

    const room_main_photo = document.querySelector(
            "input[name='room_main_photo']").value;

    const room_name = document.querySelector(
            "input[name='room_name']").value;

    const room_detail_link = document.querySelector(
            "input[name='room_id']").value;

    const profile_img_url = document.querySelector(
            "input[name='profile_img_url']").value;

    const user_id = document.querySelector(
            "input[name='user_id']").value;

    const booking_checkin_date = document.querySelector(
            "input[name='booking_checkin_date']").value;

    const booking_checkout_date = document.querySelector(
            "input[name='booking_checkout_date']").value;

    const sendEmailBookInfoDto = {
        emails,
        room_main_photo,
        room_name,
        room_detail_link: `/room/${room_detail_link}`, // 앞단에 프로토콜://호스트 URL 적어주기
        profile_link: `/user/myPage/info/${user_id}`, // 앞단에 프로토콜://호스트 URL 적어주기
        profile_img_url,
        booking_checkin_date,
        booking_checkout_date,

    }

    $.ajax({
        type: "post",
        url: "/room/book/sendEmailForRoomInfo",
        contentType: "application/json",
        data: JSON.stringify(sendEmailBookInfoDto),
        success: function (res) {
            console.log(res);
            alert("메일 전송중입니다. 최대 1분이 소요될 수 있습니다.");
            location.href = "/user/myPage/mybookings";
        },
        error: function (res) {
            console.log(res);
        }
    });

};

/* 건너뛰기 버튼을 클릭 시 */
const skipButton = document.getElementById("skip-button");
skipButton.onclick = function () {

    location.href = "/user/myPage/mybookings";
};

