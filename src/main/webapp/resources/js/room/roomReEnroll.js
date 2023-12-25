//----- 욕실 시작 -----
// 인풋태그에, 욕실카테고리에서 선택된 '버튼 합계의 값'을 디비에서 불러와 value에 담아 놨음
// 인풋태그를 잡아오고
const input_room_amenity_bath = document.querySelector(
    "input[name='room_amenity_bath']");

const inputValueBath = input_room_amenity_bath.value;

const numBath = Number(inputValueBath).toString(2).split(
    "").reverse();

const ulBath = input_room_amenity_bath.previousElementSibling;

const arrBath = [];
Array.prototype.forEach.call(ulBath.children, (li) => {
  arrBath.push(li.children[0]);
})

for (let i = 0; i < numBath.length; i++) {
  if (numBath[i] == '1') {
    arrBath[i].classList.add("screens-room-roomEnroll__btn-active");
  }
}
//----- 욕실 끝 -----

// 반복되는 코드 함수에 담기
function createdClassName(num, ul, arr) {
  Array.prototype.forEach.call(ul.children, (li) => {
    arr.push(li.children[0]);
  })

  for (let i = 0; i < num.length; i++) {
    if (num[i] == '1') {
      arr[i].classList.add("screens-room-roomEnroll__btn-active");
    }
  }
}

//----- 침실 및 세탁시설 시작 -----
const room_amenity_bedAndLaundry = document.querySelector(
    "input[name = 'room_amenity_bedAndLaundry']");
const inputValueBedAndLaundry = room_amenity_bedAndLaundry.value;
const numBedAndLaundry = Number(inputValueBedAndLaundry).toString(2).split(
    "").reverse();
const ulBedAndLaundry = room_amenity_bedAndLaundry.previousElementSibling;
const arrBedAndLaundry = [];
createdClassName(numBedAndLaundry, ulBedAndLaundry, arrBedAndLaundry);
//----- 침실 및 세탁시설 끝 -----

//----- 엔터테인먼트 시작 -----
const room_amenity_entertain = document.querySelector(
    "input[name = 'room_amenity_entertain']");
const inputValueEntertain = room_amenity_entertain.value;
const numEntertain = Number(inputValueEntertain).toString(2).split(
    "").reverse();
const ulEntertain = room_amenity_entertain.previousElementSibling;
const arrEntertain = [];
createdClassName(numEntertain, ulEntertain, arrEntertain);
//----- 엔터테인먼트 끝 -----

//----- 숙소안전 시작 -----
const room_amenity_safety = document.querySelector(
    "input[name = 'room_amenity_safety']");
const inputValueSafety = room_amenity_safety.value;
const numSafety = Number(inputValueSafety).toString(2).split(
    "").reverse();
const ulSafety = room_amenity_safety.previousElementSibling;
const arrSafety = [];
createdClassName(numSafety, ulSafety, arrSafety);
//----- 숙소안전 끝 -----

//----- 냉난방 시작 -----
const room_amenity_heatAndCold = document.querySelector(
    "input[name = 'room_amenity_heatAndCold']");
const inputValueHeatAndCold = room_amenity_heatAndCold.value;
const numHeatAndCold = Number(inputValueHeatAndCold).toString(2).split(
    "").reverse();
const ulHeatAndCold = room_amenity_heatAndCold.previousElementSibling;
const arrHeatAndCold = [];
createdClassName(numHeatAndCold, ulHeatAndCold, arrHeatAndCold);
//----- 냉난방 끝 -----

//----- 인터넷및업무공간 시작 -----
const room_amenity_internetAndWorkSpace = document.querySelector(
    "input[name = 'room_amenity_internetAndWorkSpace']");
const inputValueInternetAndWorkSpace = room_amenity_internetAndWorkSpace.value;
const numInternetAndWorkSpace = Number(inputValueInternetAndWorkSpace).toString(
    2).split(
    "").reverse();
const ulInternetAndWorkSpace = room_amenity_internetAndWorkSpace.previousElementSibling;
const arrInternetAndWorkSpace = [];
createdClassName(numInternetAndWorkSpace, ulInternetAndWorkSpace,
    arrInternetAndWorkSpace);
//----- 인터넷및업무공간 끝 -----

//----- 주방및식당 시작 -----
const room_amenity_kitchen = document.querySelector(
    "input[name = 'room_amenity_kitchen']");
const inputValueKitchen = room_amenity_kitchen.value;
const numKitchen = Number(inputValueKitchen).toString(2).split(
    "").reverse();
const ulKitchen = room_amenity_kitchen.previousElementSibling;
const arrKitchen = [];
createdClassName(numKitchen, ulKitchen,
    arrKitchen);
//----- 주방및식당 끝 -----

//----- 야외 시작 -----
const room_amenity_outdoor = document.querySelector(
    "input[name = 'room_amenity_outdoor']");
const inputValueOutdoor = room_amenity_outdoor.value;
const numOutdoor = Number(inputValueOutdoor).toString(2).split(
    "").reverse();
const ulOutdoor = room_amenity_outdoor.previousElementSibling;
const arrOutdoor = [];
createdClassName(numOutdoor, ulOutdoor,
    arrOutdoor);
//----- 야외 끝 -----

//----- 주차장및기타시설 시작 -----
const room_amenity_garageAndEtc = document.querySelector(
    "input[name = 'room_amenity_garageAndEtc']");
const inputValueGarageAndEtc = room_amenity_garageAndEtc.value;
const numGarageAndEtc = Number(inputValueGarageAndEtc).toString(2).split(
    "").reverse();
const ulGarageAndEtc = room_amenity_garageAndEtc.previousElementSibling;
const arrGarageAndEtc = [];
createdClassName(numGarageAndEtc, ulGarageAndEtc,
    arrGarageAndEtc);
//----- 주차장및기타시설 끝 -----

//----- 서비스 시작 -----
const room_amenity_service = document.querySelector(
    "input[name = 'room_amenity_service']");
const inputValueService = room_amenity_service.value;
const numService = Number(inputValueService).toString(2).split(
    "").reverse();
const ulService = room_amenity_service.previousElementSibling;
const arrService = [];
createdClassName(numService, ulService,
    arrService);
//----- 서비스 끝 -----

//----- 숙소 전망 시작 -----
const room_view = document.querySelector(
    "input[name = 'room_view']");
const inputValueView = room_view.value;
const numView = Number(inputValueView).toString(2).split(
    "").reverse();
const ulView = room_view.previousElementSibling;
const arrView = [];
createdClassName(numView, ulView,
    arrView);
//----- 숙소 전망 끝 -----

// error 처리
const inputRoomCategory = document.querySelector(
    "input[name='room_category_id']");
const roomCategoryTextBox = document.querySelector(
    ".screens-room-roomEnroll__dropdown__textBox");
const roomCategoryErrorMessage = document.querySelector(
    ".screens-room-roomEnroll__error-room-category");
const roomCategoryOptions = document.querySelector(
    ".screens-room-roomEnroll__dropdown__option");

const inputRoomAddress = document.querySelector(
    ".screens-room-roomEnroll__address-main");
const roomAddressErrorMessage = document.querySelector(
    ".screens-room-roomEnroll__error-room-address");

const textAreaRoomName = document.querySelector(
    ".screens-room-roomEnroll__textarea-room-name");
const roomNameErrorMessage = document.querySelector(
    ".screens-room-roomEnroll__error-room-name");

roomCategoryOptions.addEventListener("click", handleInputChange);
inputRoomAddress.addEventListener("input", handleRoomAddressInput);
textAreaRoomName.addEventListener("input", handleRoomNameTextArea);

function handleInputChange() {
  if (inputRoomCategory.value !== '') {
    roomCategoryTextBox.classList.remove(
        'screens-room-roomEnroll__error-border-style');
    roomCategoryErrorMessage.classList.remove('screens-room-roomEnroll__error');
    roomCategoryErrorMessage.innerHTML = '숙소 유형이 선택되었습니다';
  }
}

function handleRoomAddressInput() {
  inputRoomAddress.classList.remove(
      'screens-room-roomEnroll__error-border-style');
  roomAddressErrorMessage.classList.remove('screens-room-roomEnroll__error');
  roomAddressErrorMessage.innerHTML = '숙소 위치가 입력되었습니다';
}

function handleRoomNameTextArea() {
  if (textAreaRoomName.value === '') {
    textAreaRoomName.classList.add(
        'screens-room-roomEnroll__error-border-style');
    roomNameErrorMessage.classList.add('screens-room-roomEnroll__error');
    roomNameErrorMessage.innerHTML = '숙소 이름을 지어주세요';
  } else {
    textAreaRoomName.classList.remove(
        'screens-room-roomEnroll__error-border-style');
    roomNameErrorMessage.classList.remove('screens-room-roomEnroll__error');
    roomNameErrorMessage.innerHTML = '숙소 위치가 입력되었습니다';
  }
}
