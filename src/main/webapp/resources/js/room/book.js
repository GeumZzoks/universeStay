// 예약하기 버튼 누르고 예약 창으로 넘어가기
const submitButton = document.getElementById("submit-button");
submitButton.addEventListener("click", function (ev) {
    const roomId = document.getElementById("submit-button").getAttribute(
            "value");

    const bookingDto = {
        room_id: roomId,
        booking_checkin_date: document.getElementById(
                "check-in-button").innerText,
        booking_checkout_date:
        document.getElementById("check-out-button").innerText,
        booking_num_of_guest: document.getElementById(
                "screens-room-book__total-guest"
        ).innerText,
    };

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
                    `?booking_checkin_date=${bookingDto.booking_checkin_date}&booking_checkout_date=${bookingDto.booking_checkout_date}&booking_num_of_guest=${bookingDto.booking_num_of_guest}`;
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
const bookingSum = document.querySelector(
        ".screens-room-book__reservation__part-6"
);

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
const inputPeopleNum = document.querySelector(
        ".screens-room-book__reservation__number-people"
);
const togglePeopleNum = document.querySelector(
        ".screens-room-book__number-people-toggle"
);
inputPeopleNum.addEventListener("click", function () {
    togglePeopleNum.classList.toggle("active");
    // if (togglePeopleNum.classList.contains("active")) {
    //     document.querySelector(
    //             ".screens-room-book__reservation__number-people").style.outline = "2px solid black";
    // } else {
    //     document.querySelector(
    //             ".screens-room-book__reservation__number-people").style.outline = "";
    // }
});

/**
 * 인원 수 변경 (+, -)
 *
 * @type {Element}
 */
const btnMinus = document.querySelector(".screens-room-book__toggle-btn-minus");
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

    if (inputToggle.value >= max) {
        return;
    }

    inputToggle.value = Number(inputToggle.value) + 1;
    if (standard < inputToggle.value) {
        extraPersonFeeDiv.children[0].children[1].innerHTML =
                inputToggle.value - standard;
    } else {
        extraPersonFeeDiv.children[0].children[1].innerHTML = 0;
    }

    // 오른쪽 정보 창에 인원 수 대입해주기
    document.querySelector("input[name='booking_num_of_guest']").value =
            inputToggle.value;
    document.querySelector("#totalGuest-button").innerHTML = inputToggle.value;

    // 추가인원 innerHTML을 수정해준다.
    priceExtraPersonValue =
            Number(priceExtraPerson.value) *
            Number(extraPersonFeeDiv.children[0].children[1].innerHTML) *
            Number(extraPersonFeeDiv.children[0].children[2].innerHTML);
    extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
            priceExtraPersonValue
    )}`;
    // 합계를 계산하고 합계 HTML을 수정해준다.
    bookingSum.children[1].innerHTML = `₩ 
    ${priceToString(
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue
    )}
  `;
    // 합계 input hidden value를 수정해준다.
    document.querySelector("input[name='booking_price_sum']").value =
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue;

    // 값을 올렸을 때 최대 인원 수에 해당하면 플러스 버튼 disable
    if (inputToggle.value >= max) {
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
    if (1 < inputToggle.value) {
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
    // 플러스 버튼을 누르면 값이 올라간다.
    const inputToggle = document.querySelector(
            ".screens-room-book__toggle-num");
    const max = document.querySelector("input[name='room_max_capa']").value;
    const standard = document.querySelector(
            "input[name='room_standard_capa']"
    ).value;

    if (inputToggle.value <= 1) {
        return;
    }

    inputToggle.value = Number(inputToggle.value) - 1;
    if (standard < inputToggle.value) {
        extraPersonFeeDiv.children[0].children[1].innerHTML =
                inputToggle.value - standard;
    } else {
        extraPersonFeeDiv.children[0].children[1].innerHTML = 0;
    }

    document.querySelector("input[name='booking_num_of_guest']").value =
            inputToggle.value;
    document.querySelector("#totalGuest-button").innerHTML = inputToggle.value;

    // 추가인원 innerHTML을 수정해준다.
    priceExtraPersonValue =
            Number(priceExtraPerson.value) *
            Number(extraPersonFeeDiv.children[0].children[1].innerHTML) *
            Number(extraPersonFeeDiv.children[0].children[2].innerHTML);
    extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
            priceExtraPersonValue
    )}`;
    // 합계를 계산하고 합계 HTML을 수정해준다.
    bookingSum.children[1].innerHTML = `₩ 
    ${priceToString(
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue
    )}
  `;
    // 합계 input hidden value를 수정해준다.
    document.querySelector("input[name='booking_price_sum']").value =
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue;

    // 값을 올렸을 때 최대 인원 수에 해당하면 플러스 버튼 disable
    if (inputToggle.value <= 1) {
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
    if (inputToggle.value < max) {
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
 * TODO: 어떤 역할인지 확인 및 수정 필요
 */
const reservedDates = [];

const bookingDates = document.querySelectorAll(
        ".screens-room-roomDetail__bookingDate"
);
bookingDates.forEach((bookingDate) => {
    const checkInDate = bookingDate.children[0].value.substring(0, 10);
    const checkOutDate = bookingDate.children[1].value.substring(0, 10);

    const startDate = new Date(checkInDate);
    const endDate = new Date(checkOutDate);

    for (
            let currentDate = startDate;
            currentDate <= endDate;
            currentDate.setDate(currentDate.getDate() + 1)
    ) {
        const formattedDate = currentDate.toISOString().split("T")[0];
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

    bookingSum.children[1].innerHTML = `₩ 
    ${priceToString(
            priceWeekdayValue + priceWeekendValue + priceExtraPersonValue
    )}
  `;

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
