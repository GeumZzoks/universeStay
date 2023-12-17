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
  }

  console.log(bookingDto);
  console.log(encodeURIComponent(bookingDto.booking_checkin_date))

  location.href = `/room/book/${roomId}`
      + `?booking_checkin_date=${bookingDto.booking_checkin_date}&booking_checkout_date=${bookingDto.booking_checkout_date}&booking_num_of_guest=${bookingDto.booking_num_of_guest}`;
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

//---------------------- 캘린더 라이브러리 --------------------------------------------
// const inputCheckIn = document.querySelector(
//     "#check-in-button");
// const inputCheckOut = document.querySelector(
//     "#check-out-button");
//
// const reservedDates = ['2023-12-21', '2023-12-22', '2023-12-23', '2023-12-27',
//   '2023-12-28'];
//
// $(function () {
//   let selectedStartDate = null;
//
//   $('.screens-room-roomDetail__reservation__check-in-out').daterangepicker({
//     autoUpdateInput: true,
//     locale: {
//       format: 'YYYY-MM-DD',
//       cancelLabel: '취소',
//       applyLabel: '확인'
//     },
//     isInvalidDate: function (date) {
//       var dateString = date.format('YYYY-MM-DD');
//
//       // Check if the date is reserved or after the closest reserved date
//       if (reservedDates.indexOf(dateString) !== -1) {
//         return true; // Date is reserved, mark as invalid
//       }
//
//       // Check if the date is after the selected start date
//       if (selectedStartDate && date.isAfter(selectedStartDate, 'day')) {
//         return true;
//       }
//
//       return false;
//     }
//   });
//
//   $('.screens-room-roomDetail__reservation__check-in-out').on(
//       'apply.daterangepicker',
//       function (ev, picker) {
//         // Use picker.startDate and picker.endDate directly
//         inputCheckIn.innerHTML = picker.startDate.format('YYYY-MM-DD');
//         inputCheckOut.innerHTML = picker.endDate.format('YYYY-MM-DD');
//       });
//
//   $('.screens-room-roomDetail__reservation__check-in-out').on(
//       'cancel.daterangepicker',
//       function (ev, picker) {
//         // Use picker.startDate and picker.endDate directly
//         inputCheckIn.innerHTML = picker.startDate.format('YYYY-MM-DD');
//         inputCheckOut.innerHTML = picker.endDate.format('YYYY-MM-DD');
//       });
//
//   $('.screens-room-roomDetail__reservation__check-in-out').on(
//       'showCalendar.daterangepicker',
//       function (ev, picker) {
//         // Capture the selected start date when the calendar is shown
//         selectedStartDate = picker.startDate;
//       });
//
//   $('.screens-room-roomDetail__reservation__check-in-out').on(
//       'hideCalendar.daterangepicker',
//       function () {
//         // Reset the selected start date when the calendar is hidden
//         selectedStartDate = null;
//       });
// });

const inputCheckIn = document.querySelector("#check-in-button");
const inputCheckOut = document.querySelector("#check-out-button");

const reservedDates = ['2023-12-21', '2023-12-22', '2023-12-23', '2023-12-27',
  '2023-12-28'];

$(function () {
  let selectedStartDate = null;

  $('.screens-room-roomDetail__reservation__check-in-out').daterangepicker({
    autoUpdateInput: true,
    locale: {
      format: 'YYYY-MM-DD',
      cancelLabel: '취소',
      applyLabel: '확인'
    },
    isInvalidDate: function (date) {
      var dateString = date.format('YYYY-MM-DD');

      // Check if the date is reserved or after the closest reserved date
      if (reservedDates.indexOf(dateString) !== -1) {
        return true; // Date is reserved, mark as invalid
      }

      // Check if the date is after the selected start date
      if (selectedStartDate) {
        console.log(selectedStartDate.format('YYYY-MM-DD'));
        let closestReservedDate = moment.min(
            reservedDates.map(reservedDate => moment(reservedDate)));

        // Disable dates after the closest reserved date
        return date.isAfter(closestReservedDate, 'day');
      }

      return false;
    }
  });

  $('.screens-room-roomDetail__reservation__check-in-out').on(
      'apply.daterangepicker',
      function (ev, picker) {
        // Use picker.startDate and picker.endDate directly
        inputCheckIn.innerHTML = picker.startDate.format('YYYY-MM-DD');
        inputCheckOut.innerHTML = picker.endDate.format('YYYY-MM-DD');
      });

  $('.screens-room-roomDetail__reservation__check-in-out').on(
      'cancel.daterangepicker',
      function (ev, picker) {
        // Use picker.startDate and picker.endDate directly
        inputCheckIn.innerHTML = picker.startDate.format('YYYY-MM-DD');
        inputCheckOut.innerHTML = picker.endDate.format('YYYY-MM-DD');
      });

  $('.screens-room-roomDetail__reservation__check-in-out').on(
      'showCalendar.daterangepicker',
      function (ev, picker) {
        // Capture the selected start date when the calendar is shown
        selectedStartDate = picker.startDate;
      });

  $('.screens-room-roomDetail__reservation__check-in-out').on(
      'hideCalendar.daterangepicker',
      function () {
        // Reset the selected start date when the calendar is hidden
        selectedStartDate = null;
      });
});
