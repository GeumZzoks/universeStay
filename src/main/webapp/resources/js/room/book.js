/**
 * 예약하기 버튼 누르고 예약 확정 페이지로 넘어가기
 *
 * @type {HTMLElement}
 */
const submitButton = document.getElementById("submit-button");
submitButton.addEventListener("click", function (ev) {
    const roomId = document.getElementById("submit-button").getAttribute(
            "value");

    let BookingPriceSum = document.querySelector("#BookingPriceSum").innerHTML;

    if (BookingPriceSum !== "0") {
        BookingPriceSum = BookingPriceSum.replaceAll(",", "");
    }

    const bookingDto = {
        room_id: roomId,
        booking_checkin_date: document.getElementById(
                "check-in-button").innerText,
        booking_checkout_date:
        document.getElementById("check-out-button").innerText,
        booking_num_of_guest: document.getElementById(
                "screens-room-book__total-guest"
        ).innerText,
        booking_total_pay_amount: BookingPriceSum,
    };

    const profile_img_url = document.querySelector(
            "#screens-room-book__profile_img_url").src;

    $.ajax({
        type: "POST",
        url: `/room/book/share/${roomId}`,
        contentType: "application/json",
        data: JSON.stringify(bookingDto),
        success: function (res) {
            console.log(res + "성공");
            alert("예약 완료.");
            location.href =
                    `/room/book/share/${roomId}` +
                    `?booking_checkin_date=${bookingDto.booking_checkin_date}&booking_checkout_date=${bookingDto.booking_checkout_date}&booking_num_of_guest=${bookingDto.booking_num_of_guest}
                    &booking_total_pay_amount=${bookingDto.booking_total_pay_amount}&profile_img_url=${profile_img_url}`;
        },
        error: function (res) {
            console.log(res + " 에러 발생");
            alert("이미 예약된 숙소입니다.");
            location.href = "/";
        },
    });
});

/**
 * 원화에 콤마 찍어서 단위 바꿔주는 함수
 *
 * @param price
 * @returns {string}
 */
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

const priceWeekdayDiv = document.querySelector(
        ".screens-room-book__reservation__part-3"
);
const priceWeekendDiv = document.querySelector(
        ".screens-room-book__reservation__part-4"
);
const extraPersonFeeDiv = document.querySelector(
        ".screens-room-book__reservation__part-5"
);
const bookingSum = document.querySelector("#BookingPriceSum");

priceWeekdayDiv.children[0].children[0].innerHTML = priceToString(
        priceWeekdayDiv.children[0].children[0].innerHTML
);
priceWeekendDiv.children[0].children[0].innerHTML = priceToString(
        priceWeekendDiv.children[0].children[0].innerHTML
);
extraPersonFeeDiv.children[0].children[0].innerHTML = priceToString(
        extraPersonFeeDiv.children[0].children[0].innerHTML
);

/**
 * 인원수 변경 버튼
 *
 * @type {Element}
 */
// 게스트 인원 수 수정 버튼
const inputPeopleNum = document.querySelector(
        ".screens-room-book__reservation__number-people"
);

// 인원 수 조정 모달
const togglePeopleNum = document.querySelector(
        ".screens-room-book__number-people-toggle"
);
inputPeopleNum.addEventListener("click", function (event) {
    event.stopPropagation();

    togglePeopleNum.classList.toggle("active");
    // if (togglePeopleNum.classList.contains("active")) {
    //     document.querySelector(
    //             ".screens-room-book__reservation__number-people").style.outline = "2px solid black";
    // } else {
    //     document.querySelector(
    //             ".screens-room-book__reservation__number-people").style.outline = "";
    // }
});

// 바디를 눌렀을 때 인원 수 토글이 아니면 토글창을 끈다.
document.body.addEventListener('click', function (event) {
    // Check if the clicked element or any of its ancestors include '.screens-room-book__number-people-toggle'
    if (!event.target.closest('.screens-room-book__number-people-toggle')) {
        if (togglePeopleNum.classList.contains("active")) {
            togglePeopleNum.classList.remove("active");
        }
    }
});

/**
 * 인원 수 변경 (+, -)
 *
 * @type {Element}
 */
let btnMinus = document.querySelector(".screens-room-book__toggle-btn-minus");
const btnPlus = document.querySelector(".screens-room-book__toggle-btn-plus");

priceWeekday = priceWeekdayDiv.children[2];
priceWeekend = priceWeekendDiv.children[2];
priceExtraPerson = extraPersonFeeDiv.children[2];

let priceWeekdayValue = 0;
let priceWeekendValue = 0;
let priceExtraPersonValue = 0;

btnMinus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true"
        role="presentation" focusable="false">
          <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
btnMinus.setAttribute("style", "border: 1px #EDEDED solid;");

/**
 * 인원 수 변경 (+, -) - 플러스 버튼
 */

btnPlus.addEventListener("click", function (e) {
    // 플러스 버튼을 누르면 값이 올라간다.
    const inputToggle = document.querySelector(
            ".screens-room-book__toggle-num");
    const max = document.querySelector("input[name='room_max_capa']").value;
    const standard = document.querySelector(
            "input[name='room_standard_capa']"
    ).value;

    // 숙박 최대 인원 초과 시 아무 일도 하지 않음
    if (Number(inputToggle.value) >= Number(max)) {
        return;
    }

    // 플러스 버튼 클릭 시 인원 조정 모달창에 인원 수 + 1
    inputToggle.value = Number(inputToggle.value) + 1;

    // 기준 인원 수가 초과될 시 오른쪽 사이드 바에 추가된 인원 수 만큼 표시
    if (Number(standard) < Number(inputToggle.value)) {
        extraPersonFeeDiv.children[0].children[1].innerHTML =
                Number(inputToggle.value) - Number(standard);
    } else { // 인원 수가 기준 인원 수에 충족되면 0으로 초기화
        extraPersonFeeDiv.children[0].children[1].innerHTML = 0;
    }

    // 추가된 인원 수만큼 정보 표시
    document.querySelector("input[name='booking_num_of_guest']").value =
            Number(inputToggle.value);
    document.querySelector("#totalGuest-button").innerHTML = Number(
            inputToggle.value);

    // 주중 숙박 가격 총합 계산
    priceWeekdayValue = Number(priceWeekday.value) * Number(
            document.querySelector(
                    ".screens-room-book__reservation__part-3").children[0].children[1].innerHTML);

    // 주말 숙박 가격 총합 계산
    priceWeekendValue = Number(priceWeekend.value) * Number(
            document.querySelector(
                    ".screens-room-book__reservation__part-4").children[0].children[1].innerHTML);

    // 추가인원 innerHTML을 수정해준다.
    priceExtraPersonValue =
            // 추가 인원에 대한 요금
            Number(priceExtraPerson.value) *
            // 추가 인원 수
            Number(extraPersonFeeDiv.children[0].children[1].innerHTML) *
            // 숙박 일수
            Number(extraPersonFeeDiv.children[0].children[2].innerHTML);

    // 추가 인원에 대한 가격 산정 후 추가 인원 가격 표시 HTML을 수정
    extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
            priceExtraPersonValue
    )}`;

    // 합계를 계산하고 합계 HTML을 수정해준다.
    bookingSum.innerHTML = `${priceToString(
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue
    )}`;

    // 합계 input hidden value를 수정해준다.
    document.querySelector("input[name='booking_price_sum']").value =
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue;

    // 값을 올렸을 때 최대 인원 수에 해당하면 플러스 버튼 disable
    if (Number(inputToggle.value) >= Number(max)) {
        btnPlus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
      </svg>
    `;
        btnPlus.setAttribute("style", "border: 1px #EDEDED solid;");
        btnPlus.classList.add("disable");
    }

    // 값을 올렸을 때 최소 인원 (=1) 보다 크면 마이너스 버튼 able
    if (1 < Number(inputToggle.value)) {
        btnMinus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
           aria-hidden="true"
           role="presentation" focusable="false"
           style="display: block; height: 12px; width: 12px; fill: #717171;">
          <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
        btnMinus.setAttribute("style", "  border: 1px solid #B0B0B0;");
        btnMinus.classList.remove("disable");
    }
});

/**
 * 인원 수 변경 (+, -) - 마이너스 버튼
 */
btnMinus.addEventListener("click", function (e) {
    // 마이너스 버튼을 누르면 값이 내려간다.
    const inputToggle = document.querySelector(
            ".screens-room-book__toggle-num");
    const max = document.querySelector("input[name='room_max_capa']").value;
    const standard = document.querySelector(
            "input[name='room_standard_capa']"
    ).value;

    if (Number(inputToggle.value) <= 1) {
        return;
    }

    inputToggle.value = Number(inputToggle.value) - 1;
    if (Number(standard) < Number(inputToggle.value)) {
        extraPersonFeeDiv.children[0].children[1].innerHTML =
                Number(inputToggle.value) - Number(standard);
    } else {
        extraPersonFeeDiv.children[0].children[1].innerHTML = 0;
    }

    document.querySelector("input[name='booking_num_of_guest']").value =
            Number(inputToggle.value);
    document.querySelector("#totalGuest-button").innerHTML = Number(
            inputToggle.value);

    // 주중 숙박 가격 총합 계산
    priceWeekdayValue = Number(priceWeekday.value) * Number(
            document.querySelector(
                    ".screens-room-book__reservation__part-3").children[0].children[1].innerHTML);

    // 주말 숙박 가격 총합 계산
    priceWeekendValue = Number(priceWeekend.value) * Number(
            document.querySelector(
                    ".screens-room-book__reservation__part-4").children[0].children[1].innerHTML);

    // 추가인원 innerHTML을 수정해준다.
    priceExtraPersonValue =
            Number(priceExtraPerson.value) *
            Number(extraPersonFeeDiv.children[0].children[1].innerHTML) *
            Number(extraPersonFeeDiv.children[0].children[2].innerHTML);
    extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
            priceExtraPersonValue
    )}`;
    // 합계를 계산하고 합계 HTML을 수정해준다.
    bookingSum.innerHTML = `${priceToString(
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue
    )}`;

    // 합계 input hidden value를 수정해준다.
    document.querySelector("input[name='booking_price_sum']").value =
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue;

    // 값을 올렸을 때 최대 인원 수에 해당하면 플러스 버튼 disable
    if (Number(inputToggle.value) <= 1) {
        btnMinus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
        btnMinus.setAttribute("style", "border: 1px #EDEDED solid;");
        btnMinus.classList.add("disable");
    }

    // 값을 올렸을 때 최소 인원 (=1) 보다 크면 마이너스 버튼 able
    if (Number(inputToggle.value) < Number(max)) {
        btnPlus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
           aria-hidden="true"
           role="presentation" focusable="false"
           style="display: block; height: 12px; width: 12px; fill: #717171;">
          <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
      </svg>
    `;
        btnPlus.setAttribute("style", "  border: 1px solid #B0B0B0;");
        btnPlus.classList.remove("disable");
    }
});

/**
 * 달력에 예약된 날짜를 표시하기 위한 데이터 처리 작업
 * @type {*[]}
 *
 */
const reservedDates = [];
const bookingDates = document.querySelectorAll(
        ".screens-room-book__bookingDate");
bookingDates.forEach(bookingDate => {
    const checkInDate = bookingDate.children[0].value.substring(0, 10);
    const checkOutDate = bookingDate.children[1].value.substring(0, 10);

    const startDate = new Date(checkInDate);
    const endDate = new Date(checkOutDate);

    for (let currentDate = startDate; currentDate <= endDate;
            currentDate.setDate(currentDate.getDate() + 1)) {
        const formattedDate = currentDate.toISOString().split('T')[0];
        reservedDates.push(formattedDate);
    }
});

/**
 * 날짜 변경
 * @type {Element}
 */
const inputCheckIn = document.querySelector("#check-in-button");
const inputCheckOut = document.querySelector("#check-out-button");
$(".screens-room-book__reservation__check-in-out")
.dateRangePicker({
    showShortcuts: false,
    format: "YYYY-MM-DD",
    beforeShowDay: function (date) {
        const currentDate = new Date();
        currentDate.setHours(0, 0, 0, 0); // Set hours, minutes, seconds, and milliseconds to zero for accurate comparison

        const dateString = formatDate(date);
        const isReserved = reservedDates.includes(dateString);
        const isBeforeToday = date < currentDate;

        return [!isReserved && !isBeforeToday];
    },
})
.bind("datepicker-first-date-selected", function (event, obj) {
})
.bind("datepicker-change", function (event, obj) {
    // togglePeopleNum.classList.remove("active");
    inputCheckIn.innerHTML = formatDate(new Date(obj.date1));
    inputCheckOut.innerHTML = formatDate(new Date(obj.date2));

    document.querySelector("input[name='booking_checkin_date']").value =
            formatDate(new Date(obj.date1));
    document.querySelector("input[name='booking_checkout_date']").value =
            formatDate(new Date(obj.date2));

    const countDay = countWeekdaysAndWeekends(
            formatDate(new Date(obj.date1)),
            formatDate(new Date(obj.date2))
    );

    priceWeekdayDiv.children[0].children[1].innerHTML = `${countDay.weekdays}`;
    priceWeekendDiv.children[0].children[1].innerHTML = `${countDay.weekends}`;
    extraPersonFeeDiv.children[0].children[2].innerHTML = `${
            countDay.weekdays + countDay.weekends
    }`;

    priceWeekdayValue = Number(priceWeekday.value) * Number(countDay.weekdays);
    priceWeekendValue = Number(priceWeekend.value) * Number(countDay.weekends);
    priceExtraPersonValue =
            Number(priceExtraPerson.value) *
            Number(countDay.weekdays + countDay.weekends) *
            Number(extraPersonFeeDiv.children[0].children[1].innerHTML);

    priceWeekdayDiv.children[1].innerHTML = `₩ ${priceToString(
            priceWeekdayValue
    )}`;
    priceWeekendDiv.children[1].innerHTML = `₩ ${priceToString(
            priceWeekendValue
    )}`;
    extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
            priceExtraPersonValue
    )}`;

    bookingSum.innerHTML = `${priceToString(
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue
    )}`;

    document.querySelector("input[name='booking_price_sum']").value =
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue;
});

const calendar = document.querySelector(".date-picker-wrapper");
calendar.style.zIndex = 100;
calendar.style.borderRadius = "10px";

function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0"); // Adding 1 because months are zero-based
    const day = String(date.getDate()).padStart(2, "0");

    return `${year}-${month}-${day}`;
}

function countWeekdaysAndWeekends(startDate, endDate) {
    const start = new Date(startDate);
    const end = new Date(endDate);
    let weekdays = 0;
    let weekends = 0;

    let currentDate = new Date(start);
    currentDate.setDate(currentDate.getDate() + 1);

    // Iterate over each day in the range
    while (currentDate <= end) {
        const dayOfWeek = currentDate.getDay();

        // Sunday (0) and Saturday (6) are weekends
        if (dayOfWeek === 0 || dayOfWeek === 6) {
            weekends++;
        } else {
            weekdays++;
        }

        // Move to the next day
        currentDate.setDate(currentDate.getDate() + 1);
    }

    return {weekdays, weekends};
}
