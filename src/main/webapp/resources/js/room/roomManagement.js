// 모달창
const roomCards = document.querySelectorAll(
    '.screens-room-management__card');

const modal = document.querySelector(
    '.screens-room-management__modalWrap');

const closeBtn = document.querySelector(
    '.screens-room-management__closeBtn');

closeBtn.onclick = function () {
  modal.style.display = 'none';
}

let room_id = 0;
for (let i = 0; i < roomCards.length; i++) {
  roomCards[i].addEventListener("click", function (e) {
    room_id = e.target.parentElement.parentElement.children[0].value;
    modal.style.display = 'block';
  })
}

// const roomDelete = document.querySelector(".screens-room-management__roomDelete");
// roomDelete.onclick = function () {
//   location.href = ;
// }

// 제이쿼리 써보기
// 모달창 내부 수정/활성화/비활성화/폐점 버튼
$(".screens-room-management__shutdownHostroom").on("click", function (e) {
  // console.dir(e.target);
  if (!confirm("정말로 삭제하시겠습니까?")) {
    return;
  }
  location.href = "/room/statusHostroom?room_id=" + room_id
      + "&room_status_id=R03";
});

$(".screens-room-management__deActivateHostroom").on("click", function (e) {
  // console.dir(e.target);
  if (!confirm("숙소를 비활성화 하시겠습니까?")) {
    return;
  }
  location.href = "/room/statusHostroom?room_id=" + room_id
      + "&room_status_id=R02";
});

$(".screens-room-management__activateHostroom").on("click", function (e) {
  // console.dir(e.target);
  if (!confirm("숙소를 활성화 하시겠습니까?")) {
    return;
  }
  location.href = "/room/statusHostroom?room_id=" + room_id
      + "&room_status_id=R01";
});