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

console.dir(geocoder);

// 주소로 좌표를 검색합니다
geocoder.addressSearch(roomAddress, function (result, status) {

  // 정상적으로 검색이 완료됐으면
  if (status === kakao.maps.services.Status.OK) {

    const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    const marker = new kakao.maps.Marker({
      map: map,
      position: coords
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

// 편의시설 모달
const btnModalAmenity = document.querySelector(
    ".screens-room-roomDetail__section-3__room-info__info-2__modal-btn");
const btnModalCloseAmenity = document.querySelector(
    ".screens-room-roomDetail__section-3__room-info__info-2__modal-btn-close");
const wrapper = document.querySelector(
    ".screens-room-roomDetail__wrapper");
const modalBack = document.querySelector(
    ".screens-room-roomDetail__modal-back");
let currentScrollY;

btnModalAmenity.addEventListener("click", openModal);
btnModalCloseAmenity.addEventListener("click", closeModal);

function openModal() {
  wrapper.classList.add('modal-open');
  modalBack.setAttribute("style", "display: block;");
  currentScrollY = window.scrollY;
  document.body.style.position = 'fixed';
  document.body.style.width = '100%';
  document.body.style.top = `-${currentScrollY}px`; // 현재 스크롤 위치
  document.body.style.overflowY = 'scroll';

  setTimeout(() => window.addEventListener("click", (e) => {
    e.target === modalBack ? closeModal() : false;
  }), 0);
}

function closeModal() {
  wrapper.classList.remove('modal-open');
  modalBack.setAttribute("style", "display: none;");
  document.body.style.position = '';
  document.body.style.width = '';
  document.body.style.top = '';
  document.body.style.overflowY = '';
  window.scrollTo(0, currentScrollY);

  window.removeEventListener("click", closeModal);
}
