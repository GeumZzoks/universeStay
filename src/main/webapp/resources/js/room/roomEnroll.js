// 숙소 유형을 선택하세요
function show(anything) {

  const roomCategory = new Map();

  roomCategory.set('아파트', 'RC01');
  roomCategory.set('주택', 'RC02');
  roomCategory.set('별채', 'RC03');
  roomCategory.set('호텔', 'RC04');
  roomCategory.set('모텔', 'RC05');
  roomCategory.set('펜션', 'RC06');
  roomCategory.set('콘도', 'RC07');
  roomCategory.set('레지던스', 'RC08');
  roomCategory.set('오피스텔', 'RC09');
  roomCategory.set('한옥', 'RC10');
  roomCategory.set('캠핑장/아웃도어', 'RC11');
  roomCategory.set('호스텔', 'RC12');
  roomCategory.set('리조트', 'RC13');

  document.querySelector(
      '.screens-room-roomEnroll__dropdown__textBox').value = anything;

  document.querySelector(
      '.screens-room-roomEnroll__dropdown__valueBox').value = roomCategory.get(
      anything);
}

let dropdown = document.querySelector('.screens-room-roomEnroll__dropdown');

dropdown.onclick = function () {
  dropdown.classList.toggle('active');
}

// 숙소의 위치는 어디인가요?
// KaKao API
const mapContainer = document.querySelector('.screens-room-roomEnroll__map'), // 지도를 표시할 div
    mapOption = {
      center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
      level: 5 // 지도의 확대 레벨
    };

//지도를 미리 생성
const map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
const geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
const marker = new daum.maps.Marker({
  position: new daum.maps.LatLng(37.537187, 127.005476),
  map: map
});

function sample5_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      const addr = data.address; // 최종 주소 변수

      // 주소 정보를 해당 필드에 넣는다.
      document.querySelector(
          '.screens-room-roomEnroll__address-main').value = addr;
      // 주소로 상세 정보를 검색
      geocoder.addressSearch(data.address, function (results, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === daum.maps.services.Status.OK) {

          const result = results[0]; //첫번째 결과의 값을 활용

          // 해당 주소에 대한 좌표를 받아서
          const coords = new daum.maps.LatLng(result.y, result.x);
          // 지도를 보여준다.
          mapContainer.style.display = "block";
          map.relayout();
          // 지도 중심을 변경한다.
          map.setCenter(coords);
          // 마커를 결과값으로 받은 위치로 옮긴다.
          marker.setPosition(coords)
        }
      });
    }
  }).open();
}

// 숙소 기본정보를 알려주세요
const btnsMinus = document.querySelectorAll(
    ".screens-room-roomEnroll__info-basic__btn-minus");
const btnsPlus = document.querySelectorAll(
    ".screens-room-roomEnroll__info-basic__btn-plus");

btnsMinus.forEach(btnMinus => {
  btnMinus.addEventListener("click", handleClickBtnMinus);
});
btnsPlus.forEach(btnPlus => {
  btnPlus.addEventListener("click", handleClickBtnPlus);
});

function handleClickBtnMinus(e) {
  let input;
  let btnMinus;
  const inputStandardCapa = document.querySelector(
      "input[name='room_standard_capa']");

  if (e.target.nodeName == 'path') {
    input = e.target.parentElement.parentElement.nextElementSibling;
  } else if (e.target.nodeName == 'svg') {
    input = e.target.parentElement.nextElementSibling;
  } else {
    input = e.target.nextElementSibling;
  }

  if (input.value == 1) {
    return;
  }

  input.value = Number(input.value) - 1;

  if (input.name == 'room_max_capa' && Number(input.value) < Number(
      inputStandardCapa.value)) {
    inputStandardCapa.value = input.value;
  }

  if (input.value == 1) {
    btnMinus = input.previousElementSibling;
    btnMinus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
    btnMinus.setAttribute("style", "border: 1px #EDEDED solid;");
    btnMinus.classList.remove("screens-room-roomEnroll__info-basic__btn-minus");
    btnMinus.classList.add(
        "screens-room-roomEnroll__info-basic__btn-minus--disable");

    if (input.name == 'room_max_capa') {
      const btnMinusStandardCapa = inputStandardCapa.previousElementSibling;
      btnMinusStandardCapa.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
      btnMinusStandardCapa.setAttribute("style", "border: 1px #EDEDED solid;");
      btnMinusStandardCapa.classList.remove(
          "screens-room-roomEnroll__info-basic__btn-minus");
      btnMinusStandardCapa.classList.add(
          "screens-room-roomEnroll__info-basic__btn-minus--disable");
    }
  }

  if (((input.name == 'room_standard_capa' || input.name == 'room_max_capa')
          && input.value == 15) ||
      (!(input.name == 'room_standard_capa' || input.name == 'room_max_capa')
          && input.value == 49)) {
    btnPlus = input.nextElementSibling;
    btnPlus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
         role="presentation" focusable="false"
         style="display: block; height: 12px; width: 12px; fill: #717171;">
        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
      </svg>
    `;
    btnPlus.setAttribute("style", "border: 1px #B0B0B0 solid;");
    btnPlus.classList.remove(
        "screens-room-roomEnroll__info-basic__btn-plus--disable");
    btnPlus.classList.add("screens-room-roomEnroll__info-basic__btn-plus");

    if (input.name == 'room_max_capa') {
      const btnMinusStandardCapa = inputStandardCapa.nextElementSibling;
      btnMinusStandardCapa.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
         role="presentation" focusable="false"
         style="display: block; height: 12px; width: 12px; fill: #717171;">
        <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
      </svg>
    `;
      btnMinusStandardCapa.setAttribute("style", "border: 1px #B0B0B0 solid;");
      btnMinusStandardCapa.classList.remove(
          "screens-room-roomEnroll__info-basic__btn-plus--disable");
      btnMinusStandardCapa.classList.add(
          "screens-room-roomEnroll__info-basic__btn-plus");
    }
  }
}

function handleClickBtnPlus(e) {
  let input;
  const inputMaxCapa = document.querySelector("input[name='room_max_capa']");

  if (e.target.nodeName == 'path') {
    input = e.target.parentElement.parentElement.previousElementSibling;
  } else if (e.target.nodeName == 'svg') {
    input = e.target.parentElement.previousElementSibling;
  } else {
    input = e.target.previousElementSibling;
  }

  if (((input.name == 'room_standard_capa' || input.name == 'room_max_capa')
          && input.value == 16) ||
      (!(input.name == 'room_standard_capa' || input.name == 'room_max_capa')
          && input.value == 50)) {
    return;
  }

  input.value = Number(input.value) + 1;

  if (input.name == 'room_standard_capa' && Number(input.value) > Number(
      inputMaxCapa.value)) {
    inputMaxCapa.value = input.value;
  }

  if (input.value == 2) {
    btnMinus = input.previousElementSibling;
    btnMinus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
         role="presentation" focusable="false"
         style="display: block; height: 12px; width: 12px; fill: #717171;">
        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
    btnMinus.setAttribute("style", "border: 1px #B0B0B0 solid;");
    btnMinus.classList.remove(
        "screens-room-roomEnroll__info-basic__btn-minus--disable");
    btnMinus.classList.add("screens-room-roomEnroll__info-basic__btn-minus");

    if (input.name == 'room_standard_capa') {
      const btnMinusMaxCapa = inputMaxCapa.previousElementSibling;
      btnMinusMaxCapa.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
         role="presentation" focusable="false"
         style="display: block; height: 12px; width: 12px; fill: #717171;">
        <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
      </svg>
    `;
      btnMinusMaxCapa.setAttribute("style", "border: 1px #B0B0B0 solid;");
      btnMinusMaxCapa.classList.remove(
          "screens-room-roomEnroll__info-basic__btn-minus--disable");
      btnMinusMaxCapa.classList.add(
          "screens-room-roomEnroll__info-basic__btn-minus");
    }
  }

  if (((input.name == 'room_standard_capa' || input.name == 'room_max_capa')
          && input.value == 16) ||
      (!(input.name == 'room_standard_capa' || input.name == 'room_max_capa')
          && input.value == 50)) {
    btnPlus = input.nextElementSibling;
    btnPlus.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
      </svg>
    `;
    btnPlus.setAttribute("style", "border: 1px #EDEDED solid;");
    btnPlus.classList.remove(
        "screens-room-roomEnroll__info-basic__btn-plus");
    btnPlus.classList.add(
        "screens-room-roomEnroll__info-basic__btn-plus--disable");

    if (input.name == 'room_standard_capa') {
      const btnPlusMaxCapa = inputMaxCapa.nextElementSibling;
      btnPlusMaxCapa.innerHTML = `
      <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" 
        style="display:block;height:12px;width:12px;fill:#EDEDED" aria-hidden="true" 
        role="presentation" focusable="false">
          <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
      </svg>
    `;
      btnPlusMaxCapa.setAttribute("style", "border: 1px #EDEDED solid;");
      btnPlusMaxCapa.classList.remove(
          "screens-room-roomEnroll__info-basic__btn-plus");
      btnPlusMaxCapa.classList.add(
          "screens-room-roomEnroll__info-basic__btn-plus--disable");
    }
  }
}

// 숙소 편의시설 정보를 추가하세요
const ulList = document.querySelectorAll(
    ".screens-room-roomEnroll__select");
ulList.forEach(ul => {
  const liList = ul.children;
  let num = 1;

  Array.prototype.forEach.call(liList, (li) => {
    const input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("value", num);
    num *= 2;
    li.appendChild(input);
  });
});

const facilitySelectSpaces = document.querySelectorAll(
    ".screens-room-roomEnroll__select");

facilitySelectSpaces.forEach(selectSpace => {
  selectSpace.addEventListener("click", handleSelectSpace);
});

function handleSelectSpace(e) {

  const clickedBtn = e.target;
  const clickedBtnData = e.target.nextElementSibling;
  const category = e.target.parentElement.parentElement;
  const categoryData = e.target.parentElement.parentElement.nextElementSibling;

  if (clickedBtn.classList.contains(
      "screens-room-roomEnroll__select-btn")) {
    clickedBtn.classList.toggle("screens-room-roomEnroll__btn-active");
  }

  if (clickedBtn.classList.contains(
      "screens-room-roomEnroll__select-btn")) {
    if (clickedBtn.classList.contains("screens-room-roomEnroll__btn-active")) {
      categoryData.value = Number(categoryData.value) + Number(
          clickedBtnData.value);
    } else {
      categoryData.value -= clickedBtnData.value;
    }
  }
}

// 숙소 가격을 책정해주세요
// const inputsPrice = document.querySelectorAll(
//     ".screens-room-roomEnroll__input-price");
//
// inputsPrice.forEach(inputPrice => {
//   inputPrice.addEventListener('keyup', function (e) {
//     let value = e.target.value;
//     value = Number(value.replaceAll(',', ''));
//     if (isNaN(value)) {         //NaN인지 판별
//       inputPrice.value = 0;
//     } else {                   //NaN이 아닌 경우
//       const formatValue = value.toLocaleString('ko-KR');
//       inputPrice.value = formatValue;
//     }
//   });
// });
