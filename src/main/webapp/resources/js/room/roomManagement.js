// 모달창
// 모달창 오픈
const modal = document.querySelector(
    '.screens-room-management__modalWrap');

// 모달창 클로즈
const closeBtn = document.querySelector(
    '.screens-room-management__closeBtn');

// 룸카드 배열
const roomCards = document.querySelectorAll(
    '.screens-room-management__card');

// 모달창 포토
const modalPhoto = document.querySelector(
    '.screens-room-management__modal-photo');

closeBtn.onclick = function () {
  modal.style.display = 'none';
}

let room_id = 0;
let room_main_photo = 0;
let roomStatus = 0;
let roomName = 0;
// let roomCreatedAt = 0;
// let roomAddress = 0;

for (let i = 0; i < roomCards.length; i++) {
  roomCards[i].addEventListener("click", function (e) { // 클릭했을 때
    modal.style.display = 'block';

    // 룸 폐점
    room_id = e.target.parentElement.parentElement.children[0].value;
    // 모달창 이미지
    room_main_photo = e.target.parentElement.parentElement.children[1].value;
    modalPhoto.setAttribute("src", room_main_photo);

    const btnDeac = document.querySelector(
        ".screens-room-management__deactivateHostroom");
    const btnAc = document.querySelector(
        ".screens-room-management__activateHostroom");
    // 룸 상태
    roomStatus = e.target.parentElement.parentElement.children[2].value;
    if (roomStatus == 'R01') {
      btnAc.style.display = "none";
      btnDeac.style.display = "block";
    } else {
      btnAc.style.display = "block";
      btnDeac.style.display = "none";
    }

    roomName = e.target.parentElement.parentElement.children[3].value;
    document.querySelector(
        '.screens-room-management__modalText-box__text').innerHTML
        = "[" + roomName + "] 숙소의 운영 상태를 선택 해 주세요";

    // TODO : 추후 숙소 이름 => 숙소 등록일 (일자만 잘라오기) & 숙소 주소로 업데이트 하기
    // roomCreatedAt = e.target.parentElement.parentElement.children[4].value;
    //
    // document.querySelector(
    //     '.screens-room-management__createdAt').innerHTML = "숙소 등록일: "
    //     + roomCreatedAt;
    //
    // roomAddress = e.target.parentElement.parentElement.children[5].value;
    //
    // document.querySelector(
    //     '.screens-room-management__address').innerHTML = roomAddress;
    //
    // console.log(roomCreatedAt);
    // console.log(roomAddress);

    // console.log(e);
    // console.log(e.target);
    // console.dir(e);
    // console.dir(e.target);
    // console.log(e.target.parentElement.parentElement.children[0].value);
    // console.log(e.target.parentElement.parentElement.children[1].value);
    // console.log(e.target.parentElement.parentElement.children[2]);
    // console.log(e.target.parentElement.parentElement.children[3]);
  })
}

// const roomDelete = document.querySelector(".screens-room-management__roomDelete");
// roomDelete.onclick = function () {
//   location.href = ;
// }

// 모달창 내부 버튼 활성화/비활성화/폐점/수정하기 버튼
// 제이쿼리 써보기
$(".screens-room-management__shutdownHostroom").on("click", function (e) {
  if (!confirm("정말로 삭제하시겠습니까?")) { // !(Y: true) => 리턴 실행 안됨 아래 링크로 이동, !(N: false) => 리턴이 실행됨
    return;
  }
  location.href = "/room/statusHostroom?room_id=" + room_id
      + "&room_status_id=R03";
});

// 숙소 활성화 링크
$(".screens-room-management__deActivateHostroom").on("click", function (e) {
  if (!confirm("숙소를 비활성화 하시겠습니까?")) {
    return;
  }
  location.href = "/room/statusHostroom?room_id=" + room_id
      + "&room_status_id=R02";
});

// 숙소 활성화 링크
$(".screens-room-management__activateHostroom").on("click", function (e) {
  if (!confirm("숙소를 활성화 하시겠습니까?")) {
    return;
  }
  console.log(location.href);
  location.href = "/room/statusHostroom?room_id=" + room_id
      + "&room_status_id=R01";
});

// 숙소 수정하기 링크
$(".screens-room-management__modifyHostRoom-box__alink").on("click",
    function (e) {
      console.log(room_id);
      location.href = "/room/modify?room_id=" + room_id;

      console.log("/room/modify?room_id=" + room_id);
      console.log(href);
      console.log(room_id);
    });