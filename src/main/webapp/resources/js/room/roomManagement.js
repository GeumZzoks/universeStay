// 헤더 메뉴바
// 헤더메뉴바 밑에 선을 만들어 주기위해
// 부모태그잡아오고 부모태그의 1번째자식에 클래스네임을 추가해준다.
// 호버로 되었을때 밑줄 없어지게

// window.onload = function () {
//
//   const btnRoom = document.querySelector(
//       '.screens-room-management__menuButton-box__btn-room');
//   btnRoom.classList.add('checked');
//
//   btnRoom.addEventListener('click', function () {
//     location.href = '/room/management';
//   })
//
//   for(let i=0; i<4; i++){
//     if(btnRoom.att)
//   }

//
// 클릭 시 버튼의 색상 변경
//   document.querySelectorAll('.room-management-header-btn').forEach(
//       function (button) {
//         button.addEventListener('click', function () {
//           // 모든 버튼에서 'checked' 클래스 제거
//           document.querySelectorAll('.room-management-header-btn').forEach(
//               function (btn) {
//                 btn.classList.remove('checked');
//               });
//
//           // 선택된 버튼에 'checked' 클래스 추가
//           this.classList.add('checked');
//         });
//       });
//
// }

// document.querySelectorAll('.room-management-header-btn').addEventListener(
//     'click',
//     function () {
//       changeColor(this);
//     });

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
        // = "[" + roomName + "] 숙소의 운영 상태를 선택 해 주세요";
        // TODO: 숙소의 이름을 함께 보여주고 싶은데 숙소 이름이 길 경우 모달창도 같이 길어져 예뻐지지 않음..
        = "등록한 숙소의 운영 상태를 선택 해 주세요";
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
      location.href = "/room/modify?room_id=" + room_id;
      console.log(room_id);
      console.log(location.href);
    });
