/* 제출하기 버튼을 클릭 시 */
const submitButton = document.getElementById("submit-button");
submitButton.onclick = function () {

    const emails = document.querySelectorAll(
            ".screens-room-bookShare__write-email-box--email");

    const emailArray = Array.from(emails)
    .map(input => input.value)
    .filter(email => email.trim() !== ""); // 빈 문자열이 아닌 것만 필터링

    console.log(emailArray);

    $.ajax({
        type: "post",
        url: "/room/book/sendEmailForRoomInfo",
        // traditional: true,
        contentType: "application/json",
        data: JSON.stringify({
            emails: emailArray,
            string: "test"
        }),
        success: function (res) {
            console.log(res);
            location.href = "/room/book/myBooking"
        },
        error: function (res) {
            console.log(res);
        }
    });

};

/* 건너뛰기 버튼을 클릭 시 */
const skipButton = document.getElementById("skip-button");
skipButton.onclick = function () {
    $.ajax({
        type: "GET",
        url: "/room/book/sendEmailForRoomInfo",
        success: function (res) {
            console.log(res);
            location.href = "/room/book/myBooking"
        },
        error: function (res) {
            console.log(res);
        }
    });
};

