//----- 욕실 시작 -----
// 인풋태그에, 욕실카테고리에서 선택된 '버튼 합계의 값'을 디비에서 불러와 value에 담아 놨음
// 인풋태그를 잡아오고
const input_room_amenity_bath = document.querySelector(
    "input[name='room_amenity_bath']");

// 인풋 태그에 있는 밸류를 긁어 온다
// 잡아온 태그를 우선 콘솔에 찍어서 태그애트리뷰트에서 value애트리뷰트를 찾음. 찾았기 때문에 밸류를 쓸 수 있는 거임
console.log(input_room_amenity_bath);
console.log("인풋태그 밸류 " + input_room_amenity_bath.value);
const inputValueBath = input_room_amenity_bath.value;

// 인풋태그 밸류의 값이 10진수 이므로 (=383)
// 2진수로 변환해줘야한다.

// 틀린 예 383
console.log("383을 2진수로 바꾸기 틀린 예 " + Number(inputValueBath.toString(2)));
// 올바른 예 101111111 : 먼저 383을 숫자로 바꾼 후 2진수로 변환하기.
console.log("383을 2진수로 바꾸기 올바른 예 " + Number(inputValueBath).toString(2));

// 뷰에서는 2진수 값이 버튼 첫번째부터 시작되고 : 욕조>비데>바디클렌저 (우리가 글케 설정해줌)
// 디비에는 2진수 값이 거꾸로 순서임 : 101111111 => 28 27 26 25 24 23 22 21 20
// '101111111'을 배열로 변환 후 인덱스(위치)를 활용해서 버튼이 클릭 되어있는 액션을 주고 싶기 때문에 (1은 클릭됨, 0은 클릭되지 않음)
// '101111111' 값을 뒤집어야 뷰의 버튼과 일치하게 됨.

// 2진수 값 뒤집기 과정 : 배열에 담고, 역순으로 바꾸고, 다시 문자열로 변환
// 다시 문자열로 바꿀 필요가 있나? => 원래 문자열이였기 때문에 문자열로 바꿔준거고 바꾸지 않아도 됨(reverse에서 끝나도 됨)
console.log(
    "split: 하나의 문자열을 배열로 분할" + Number(inputValueBath).toString(2).split(""));
console.log(
    "reverse: 배열의 요소를 역순으로 재 배열 " + Number(inputValueBath).toString(2).split(
        "").reverse());
console.log(
    "join: 배열의 요소를 하나의 문자열로 합침" + Number(inputValueBath).toString(2).split(
        "").reverse().join(""));

const numBath = Number(inputValueBath).toString(2).split(
    "").reverse();

// 버튼이 선택되었던 값이면(111111101) 버튼 태그에 효과를 주기 위해 클래스를 추가한다.
// 추가하기 위해서 버튼태그를 찾아야 한다.
// 찾기 위해
// 아래와 같이 인풋태그 애트리뷰트 중 previousElementSibling 속성을 활용하여 버튼태그를 찾고자 함
// ul태그로 올라가서
console.dir(input_room_amenity_bath.previousElementSibling);
const ulBath = input_room_amenity_bath.previousElementSibling;

// ul의 자식 li => ul.children
console.log(ulBath.children);

// li의 첫번째 자식 버튼! 찾음 => li.children[0]
console.log(ulBath.children[0].children[0]);

// 버튼을 찾았으니 for문을 돌려서 배열에 버튼을 모두 넣어준다.
const arrBath = [];
Array.prototype.forEach.call(ulBath.children, (li) => {
  arrBath.push(li.children[0]);
})

// 버튼이 클릭되었던 값 '1'이면 클래스 이름을 추가해줘, css속성을 부여한다. (드디어 버튼이 클릭된 형태가 됨)
for (let i = 0; i < numBath.length; i++) {
  if (numBath[i] == '1') {
    arrBath[i].classList.add("screens-room-roomEnroll__btn-active");
    console.log(numBath);
  }
}
//----- 욕실 끝 -----

// 반복되는 코드 함수에 담기
function createdClassName(num, ul, arr) {
  Array.prototype.forEach.call(ul.children, (li) => {
    arr.push(li.children[0]);
  })

// 버튼이 클릭되었던 값 '1'이면 클래스 이름을 추가해줘, css속성을 부여한다. (드디어 버튼이 클릭된 형태가 됨)
  for (let i = 0; i < num.length; i++) {
    if (num[i] == '1') {
      arr[i].classList.add("screens-room-roomEnroll__btn-active");
      console.log(num);
    }
  }
}

//----- 침실 및 세탁시설 시작 -----
// 인풋 태그 잡아오기(히든으로 숨겨둔 값을 가져오기 위해)
const room_amenity_bedAndLaundry = document.querySelector(
    "input[name = 'room_amenity_bedAndLaundry']");
console.dir(room_amenity_bedAndLaundry.value);

// 인풋 태그 밸류 확인(값)
const inputValueBedAndLaundry = room_amenity_bedAndLaundry.value;

// 값 2진수 변환
const numBedAndLaundry = Number(inputValueBedAndLaundry).toString(2).split(
    "").reverse();

//버튼에 클래스네임 추가하기
// 1. 버튼찾기 2.배열에 담기 3.클래스네임 추가
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
const numInternetAndWorkSpace = Number(inputValueHeatAndCold).toString(2).split(
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
// jsp에서 forEach문을 이용해, 서버에서 전달받은 등록시 선택한 '전망 리스트'를 인풋히든태그에 꺼내놓았다.
// 인풋히든태그 모두 잡아와 배열에 담김
const hiddenView = document.querySelectorAll(".hiddenView");

// 잡아온 인풋히든태그들의 값에서 '번호'만 추출해야하고,
// 추출한 번호를 버튼의 순서에 적용해 클릭되게 해야한다.

// 버튼태그 잡아오기 (클래스 네임 적용): div자식 ul
const viewUl = document.querySelector(
    ".screens-room-roomEnroll__views").children[0];

// 인풋히든태그
for (const hiddenViewElement of hiddenView) {
  // 인풋히튼태그 밸류 숫자로 만들어놈
  const num_view = Number(
      hiddenViewElement.value.substring(2, hiddenViewElement.value.length));
  // [num_view -1]을 통해 서버에 저장된 전망값을 버튼의 순서에 적용 가능
  // "몇번째" li의 0번째 자식(버튼)
  viewUl.children[num_view - 1].children[0].classList.add(
      "screens-room-roomEnroll__btn-active");

  // 합계 인풋히든태그를 잡아와서
  const inputHiddenView = document.querySelector(
      ".screens-room-roomEnroll__view");
  console.log(inputHiddenView);
  // 버튼값 넣어주기
  console.log(viewUl.children[num_view - 1].children[1]);
  console.log(viewUl.children[num_view - 1].children[1].value);

  inputHiddenView.value = Number(inputHiddenView.value) + Number(
      viewUl.children[num_view - 1].children[1].value);

}
//----- 숙소 전망 끝 -----
//----- 사진 등록 -----