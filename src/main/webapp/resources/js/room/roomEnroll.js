// 셀렉트 박스
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

// 숙소 주소입력 Script
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

// 숙소 편의시설
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
      console.log(categoryData.value);
      console.dir(categoryData.name);
    } else {
      categoryData.value -= clickedBtnData.value;
      console.log(categoryData.value);
      console.dir(categoryData.name);
    }
  }
}