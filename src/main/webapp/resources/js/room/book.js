// 예약하기 버튼 누르고 예약 창으로 넘어가기
const submitButton = document.getElementById("submit-button");
submitButton.addEventListener("click", function (ev) {
    const roomId = document.getElementById("submit-button").getAttribute(
            "value");

    const bookingDto = {
        room_id: roomId,
        booking_checkin_date: document.getElementById(
                "screens-room-book__check-in-data").innerText,
        booking_checkout_date: document.getElementById(
                "screens-room-book__check-out-data").innerText,
        booking_num_of_guest: document.getElementById(
                "screens-room-book__total-guest").innerText,

    };

    $.ajax({
        type: "POST",
        url: `/room/book/share/${roomId}`,
        contentType: "application/json",
        data: JSON.stringify(bookingDto),
        success: function (res) {
            console.log(res + "성공");
            alert("예약 완료.");
            location.href = `/room/book/share/${roomId}`
                    + `?booking_checkin_date=${bookingDto.booking_checkin_date}&booking_checkout_date=${bookingDto.booking_checkout_date}&booking_num_of_guest=${bookingDto.booking_num_of_guest}`;
        }, error: function (res) {
            console.log(res + " 에러 발생");
            alert("이미 예약된 숙소입니다.");
            location.href = "/";
        }
    });
});
