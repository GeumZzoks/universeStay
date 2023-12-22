// 카카오 맵 API
const mapContainer = document.querySelector(".screens-room-roomDetail__map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다
const map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
const geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(roomAddress, function (result, status) {

  // 정상적으로 검색이 완료됐으면
  if (status === kakao.maps.services.Status.OK) {

    const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    const marker = new kakao.maps.Marker({
      map: map, position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    const infowindow = new kakao.maps.InfoWindow({
      content: '<div style="width:150px; text-align:center; padding:6px 3px; background: #FF365A; color: #FFFFFF; font-family: NotoSansKR-Medium">숙소위치</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
  }
});

// 예약하기 버튼 누르고 예약 창으로 넘어가기
const submitButton = document.getElementById("submit-button");
submitButton.addEventListener("click", function (ev) {

  const roomId = document.getElementById("submit-button").getAttribute(
      "value");

  const bookingDto = {
    booking_checkin_date: document.getElementById(
        "check-in-button").innerText,
    booking_checkout_date: document.getElementById(
        "check-out-button").innerText,
    booking_num_of_guest: document.getElementById(
        "totalGuest-button").innerText,
    weekdayPrice: priceToString(priceWeekdayValue),
    weekendPrice: priceToString(priceWeekendValue),
    extraPersonFee: priceToString(priceExtraPersonValue),
    BookingPriceSum: priceToString(priceWeekdayValue + priceWeekendValue
        + priceExtraPersonValue),

  }

  if (bookingDto.booking_checkin_date == 'YYYY-MM-DD'
      || bookingDto.booking_checkout_date
      == 'YYYY-MM-DD') {
    alert("체크인 날짜와 체크아웃 날짜를 입력해주세요.");
    return;
  }

  location.href = `/room/book/${roomId}`
      + `?booking_checkin_date=${bookingDto.booking_checkin_date}&booking_checkout_date=${bookingDto.booking_checkout_date}&booking_num_of_guest=${bookingDto.booking_num_of_guest}
            &weekdayPrice=${bookingDto.weekdayPrice}&weekendPrice=${bookingDto.weekendPrice}&extraPersonFee=${bookingDto.extraPersonFee}&BookingPriceSum=${bookingDto.BookingPriceSum}`;

});

// 편의시설 모달
const btnModalAmenity = document.querySelector(
    ".screens-room-roomDetail__section-3__room-info__info-2__modal-btn");
const btnModalCloseAmenity = document.querySelector(
    ".screens-room-roomDetail__modal-btn-close-amenity");
const btnModalCloseRoomDesc = document.querySelector(
    ".screens-room-roomDetail__modal-btn-close-room-desc");
const wrapper = document.querySelector(
    ".screens-room-roomDetail__wrapper");
const modalBack = document.querySelector(
    ".screens-room-roomDetail__modal-back");
let currentScrollY;

btnModalAmenity.addEventListener("click", () => {
  openModal("amenity")
});
btnModalCloseAmenity.addEventListener("click", (e) => {
  closeModal("amenity")
});
btnModalCloseRoomDesc.addEventListener("click", (e) => {
  closeModal("descMore")
});

function openModal(modalName) {
  if (modalName == "amenity") {
    wrapper.classList.add('modal-open-amenity');
  } else if (modalName == "descMore") {
    wrapper.classList.add('modal-desc-more');
  }
  modalBack.setAttribute("style", "display: block;");
  currentScrollY = window.scrollY;
  document.body.style.position = 'fixed';
  document.body.style.width = '100%';
  document.body.style.top = `-${currentScrollY}px`; // 현재 스크롤 위치
  document.body.style.overflowY = 'scroll';

  setTimeout(() => window.addEventListener("click", (e) => {
    e.target === modalBack ? closeModal(modalName) : false;
  }), 0);
}

function closeModal(modalName) {
  if (modalName == "amenity") {
    wrapper.classList.remove('modal-open-amenity');
  } else if (modalName == "descMore") {
    wrapper.classList.remove('modal-desc-more');
  }
  modalBack.setAttribute("style", "display: none;");
  document.body.style.position = '';
  document.body.style.width = '';
  document.body.style.top = '';
  document.body.style.overflowY = '';
  window.scrollTo(0, currentScrollY);

  window.removeEventListener("click", () => closeModal(modalName));
}

// 숙소 장점, 공간, 기타 설명 더보기 모달창
const descTexts = document.querySelectorAll(
    ".screens-room-roomDetail__section-3__info-3__desc2");
var btnsMore = document.querySelectorAll(
    ".screens-room-roomDetail__section-3__info-3__btn");
descTexts.forEach(descText => {
  const full = descText.textContent;
  if (full.length <= 300) {
    return;
  }
  const less = full.substring(0, 300) + "...";
  descText.textContent = less;
});

btnsMore.forEach(btnMore => {
  btnMore.addEventListener("click", function (e) {
    const modal_desc_more_title = document.querySelector(
        ".screens-room-roomDetail__modal-desc-more__title");
    const modal_desc_more_content = document.querySelector(
        ".screens-room-roomDetail__modal-desc-more__content");
    modal_desc_more_title.innerHTML = e.target.previousElementSibling.previousElementSibling.previousElementSibling.innerHTML;
    modal_desc_more_content.innerHTML = e.target.previousElementSibling.innerHTML;
    openModal("descMore");
  })
});

// 숙소 설명 공백 자르기
document.querySelectorAll(
    ".screens-room-roomDetail__section-3__info-3__desc2-2").forEach(textDiv => {
  textDiv.innerHTML = textDiv.innerHTML.trim();
})

//---------------------- dateRangePicker 라이브러리 --------------------------------------------
const inputCheckIn = document.querySelector("#check-in-button");
const inputCheckOut = document.querySelector("#check-out-button");
const priceWeekdayDiv = document.querySelector(
    ".screens-room-roomDetail__reservation__part-3");
const priceWeekendDiv = document.querySelector(
    ".screens-room-roomDetail__reservation__part-4");
const extraPersonFeeDiv = document.querySelector(
    ".screens-room-roomDetail__reservation__part-5");
const bookingSum = document.querySelector(
    ".screens-room-roomDetail__reservation__part-6");
const inputPeopleNum = document.querySelector(
    ".screens-room-roomDetail__reservation__number-people");
const togglePeopleNum = document.querySelector(
    ".screens-room-roomDetail__number-people-toggle");
const priceWeekday1day = document.querySelector(
    ".screens-room-roomDetail__price__part-1");

priceWeekdayDiv.children[0].children[0].innerHTML = priceToString(
    priceWeekdayDiv.children[0].children[0].innerHTML);
priceWeekendDiv.children[0].children[0].innerHTML = priceToString(
    priceWeekendDiv.children[0].children[0].innerHTML);
extraPersonFeeDiv.children[0].children[0].innerHTML = priceToString(
    extraPersonFeeDiv.children[0].children[0].innerHTML);
priceWeekday1day.innerHTML = priceToString(priceWeekday1day.innerHTML);

priceWeekday = priceWeekdayDiv.children[2];
priceWeekend = priceWeekendDiv.children[2];
priceExtraPerson = extraPersonFeeDiv.children[2];

var priceWeekdayValue = 0;
var priceWeekendValue = 0;
var priceExtraPersonValue = 0;

const reservedDates = [];

const bookingDates = document.querySelectorAll(
    ".screens-room-roomDetail__bookingDate");
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

$('.screens-room-roomDetail__reservation__check-in-out').dateRangePicker({
  showShortcuts: false,
  format: 'YYYY-MM-DD',
  beforeShowDay: function (date) {
    const currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0); // Set hours, minutes, seconds, and milliseconds to zero for accurate comparison

    const dateString = formatDate(date);
    const isReserved = reservedDates.includes(dateString);
    const isBeforeToday = date < currentDate;

    return [!isReserved && !isBeforeToday];
  }
}).bind('datepicker-first-date-selected', function (event, obj) {
}).bind('datepicker-change', function (event, obj) {

  const isValidDateRange = obj.date2 && (obj.date2 > obj.date1);

  if (!isValidDateRange) {
    $(this).data('dateRangePicker').clear();
    return;
  }
  inputCheckIn.innerHTML = formatDate(new Date(obj.date1));
  inputCheckOut.innerHTML = formatDate(new Date(obj.date2));

  document.querySelector(
      "input[name='booking_checkin_date']").value = formatDate(
      new Date(obj.date1));
  document.querySelector(
      "input[name='booking_checkout_date']").value = formatDate(
      new Date(obj.date2));

  const countDay = countWeekdaysAndWeekends(formatDate(new Date(obj.date1)),
      formatDate(new Date(obj.date2)));

  priceWeekdayDiv.children[0].children[1].innerHTML = `${countDay.weekdays}`;
  priceWeekendDiv.children[0].children[1].innerHTML = `${countDay.weekends}`;
  extraPersonFeeDiv.children[0].children[2].innerHTML = `${countDay.weekdays
  + countDay.weekends}`;

  priceWeekdayValue = Number(priceWeekday.value) * Number(countDay.weekdays);
  priceWeekendValue = Number(priceWeekend.value) * Number(countDay.weekends);
  priceExtraPersonValue = Number(priceExtraPerson.value) * Number(
      countDay.weekdays + countDay.weekends) * Number(
      extraPersonFeeDiv.children[0].children[1].innerHTML);

  priceWeekdayDiv.children[1].innerHTML = `₩ ${priceToString(
      priceWeekdayValue)}`;
  priceWeekendDiv.children[1].innerHTML = `₩ ${priceToString(
      priceWeekendValue)}`;
  extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
      priceExtraPersonValue)}`;

  bookingSum.children[1].innerHTML = `₩ 
    ${priceToString(
      priceWeekdayValue + priceWeekendValue + priceExtraPersonValue)}
  `;

  document.querySelector(
      "input[name='booking_price_sum']").value = priceWeekdayValue
      + priceWeekendValue + priceExtraPersonValue;
}).bind('datepicker-open', function () {
  document.querySelector(
      ".screens-room-roomDetail__reservation__check-in-out").style.outline = "2px solid black";
  togglePeopleNum.classList.remove("active");
  document.querySelector(
      ".screens-room-roomDetail__reservation__number-people").style.outline = "";
}).bind('datepicker-close', function () {
  document.querySelector(
      ".screens-room-roomDetail__reservation__check-in-out").style.outline = "";
}).bind('datepicker-opened', function () {
  document.querySelector(
      ".screens-room-roomDetail__reservation__check-in-out").classList.add(
      "active");
}).bind('datepicker-closed', function () {
  document.querySelector(
      ".screens-room-roomDetail__reservation__check-in-out").classList.remove(
      "active");
});

$('.screens-room-roomDetail__reservation__check-in-out').click(function (e) {
  e.stopPropagation();
  if (document.querySelector(
      ".screens-room-roomDetail__reservation__check-in-out").classList.contains(
      "active")) {
    $('.screens-room-roomDetail__reservation__check-in-out').data(
        'dateRangePicker').close();
  }
});

// 캘린더 css 변경
const calendar = document.querySelector(".date-picker-wrapper");
calendar.style.zIndex = 100;
calendar.style.borderRadius = '10px';

function formatDate(date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Adding 1 because months are zero-based
  const day = String(date.getDate()).padStart(2, '0');

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
    if (dayOfWeek === 5 || dayOfWeek === 6) {
      weekends++;
    } else {
      weekdays++;
    }

    // Move to the next day
    currentDate.setDate(currentDate.getDate() + 1);
  }

  return {weekdays, weekends};
}

// 가격 컴마
function priceToString(price) {
  return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 인원수
inputPeopleNum.addEventListener("click", function (event) {
  event.stopPropagation();

  togglePeopleNum.classList.toggle("active");
  if (togglePeopleNum.classList.contains("active")) {
    document.querySelector(
        ".screens-room-roomDetail__reservation__number-people").style.outline = "2px solid black";
  } else {
    document.querySelector(
        ".screens-room-roomDetail__reservation__number-people").style.outline = "";
  }
});

// 바디를 눌렀을 때 인원 수 토글이 아니면 토글창을 끈다.
document.body.addEventListener('click', function (event) {
  // Check if the clicked element or any of its ancestors include '.screens-room-roomDetail__number-people-toggle'
  if (!event.target.closest('.screens-room-roomDetail__number-people-toggle')) {
    if (togglePeopleNum.classList.contains("active")) {
      togglePeopleNum.classList.remove("active");
      document.querySelector(
          ".screens-room-roomDetail__reservation__number-people").style.outline = "";
    }
  }
});

// 인원수 플러스 마이너스 버튼
const btnMinus = document.querySelector(
    ".screens-room-roomDetail__toggle-btn-minus");
const btnPlus = document.querySelector(
    ".screens-room-roomDetail__toggle-btn-plus");

btnMinus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
btnMinus.setAttribute("style", "border: 1px #EDEDED solid;");

btnPlus.addEventListener("click", function (e) {
  e.stopPropagation();
  // 플러스 버튼을 누르면 값이 올라간다.
  const inputToggle = document.querySelector(
      ".screens-room-roomDetail__toggle-num");
  const max = document.querySelector("input[name='room_max_capa']").value;
  const standard = document.querySelector(
      "input[name='room_standard_capa']").value;

  if (Number(inputToggle.value) >= Number(max)) {
    return;
  }

  inputToggle.value = Number(inputToggle.value) + 1;
  if (Number(standard)
      < Number(inputToggle.value)) {
    extraPersonFeeDiv.children[0].children[1].innerHTML = Number(
            inputToggle.value)
        - Number(standard);
  } else {
    extraPersonFeeDiv.children[0].children[1].innerHTML = 0;
  }

  document.querySelector(
      "input[name='booking_num_of_guest']").value = Number(inputToggle.value);
  document.querySelector("#totalGuest-button").innerHTML = Number(
      inputToggle.value);

  // 추가인원 innerHTML을 수정해준다.
  priceExtraPersonValue = Number(priceExtraPerson.value) * Number(
      extraPersonFeeDiv.children[0].children[1].innerHTML) * Number(
      extraPersonFeeDiv.children[0].children[2].innerHTML);
  extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
      priceExtraPersonValue)}`;
  // 합계를 계산하고 합계 HTML을 수정해준다.
  bookingSum.children[1].innerHTML = `₩ 
    ${priceToString(
      priceWeekdayValue + priceWeekendValue + priceExtraPersonValue)}
  `;
  // 합계 input hidden value를 수정해준다.
  document.querySelector(
      "input[name='booking_price_sum']").value = priceWeekdayValue
      + priceWeekendValue + priceExtraPersonValue;

  // 값을 올렸을 때 최대 인원 수에 해당하면 플러스 버튼 disable
  if (Number(inputToggle.value) >= Number(max)) {
    btnPlus.innerHTML = `
      <svg class="btn-disable" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
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

btnMinus.addEventListener("click", function (e) {
  e.stopPropagation();
  // 플러스 버튼을 누르면 값이 올라간다.
  const inputToggle = document.querySelector(
      ".screens-room-roomDetail__toggle-num");
  const max = document.querySelector("input[name='room_max_capa']").value;
  const standard = document.querySelector(
      "input[name='room_standard_capa']").value;

  if (Number(inputToggle.value) <= 1) {
    return;
  }

  inputToggle.value = Number(inputToggle.value) - 1;
  if (Number(standard)
      < Number(inputToggle.value)) {
    extraPersonFeeDiv.children[0].children[1].innerHTML = Number(
            inputToggle.value)
        - Number(standard);
  } else {
    extraPersonFeeDiv.children[0].children[1].innerHTML = 0;
  }

  document.querySelector(
      "input[name='booking_num_of_guest']").value = Number(inputToggle.value);
  document.querySelector("#totalGuest-button").innerHTML = Number(
      inputToggle.value);

  // 추가인원 innerHTML을 수정해준다.
  priceExtraPersonValue = Number(priceExtraPerson.value) * Number(
      extraPersonFeeDiv.children[0].children[1].innerHTML) * Number(
      extraPersonFeeDiv.children[0].children[2].innerHTML);
  extraPersonFeeDiv.children[1].innerHTML = `₩ ${priceToString(
      priceExtraPersonValue)}`;
  // 합계를 계산하고 합계 HTML을 수정해준다.
  bookingSum.children[1].innerHTML = `₩ 
    ${priceToString(
      priceWeekdayValue + priceWeekendValue + priceExtraPersonValue)}
  `;
  // 합계 input hidden value를 수정해준다.
  document.querySelector(
      "input[name='booking_price_sum']").value = priceWeekdayValue
      + priceWeekendValue + priceExtraPersonValue;

  // 값을 올렸을 때 최대 인원 수에 해당하면 플러스 버튼 disable
  if (Number(inputToggle.value) <= 1) {
    btnMinus.innerHTML = `
      <svg class="btn-disable" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
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

const openBtn = document.querySelector(
    ".screens-room-roomDetail__btn-review-modal");
const reviewModal = document.querySelector(".reviewModal");
const overlay = reviewModal.querySelector(".reviewModal__overlay");
const closeBtn = reviewModal.querySelector(
    ".reviewModal__content__header__button");
const openreviewModal = () => {
  reviewModal.classList.remove("hidden");
  document.body.style.overflow = 'hidden';
}
const closereviewModal = () => {
  reviewModal.classList.add("hidden");
  document.body.style.overflow = 'auto';
}
overlay.addEventListener("click", closereviewModal);
closeBtn.addEventListener("click", closereviewModal);
openBtn.addEventListener("click", openreviewModal);

