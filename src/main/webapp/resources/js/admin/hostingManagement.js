// 체크 박스 기능
const checkAllBox = document.querySelector(
    ".screens-admin-hostingManagement__content-table__check-all");
const checkBoxs = document.querySelectorAll(
    ".screens-admin-hostingManagement__content-table__check");
const approveBtn = document.querySelector(
    '.screens-admin-hostingManagement__btn-approve');
const rejectBtn = document.querySelector(
    '.screens-admin-hostingManagement__btn-reject');

checkAllBox.addEventListener("click", function (e) {
  if (e.target.checked) {
    checkBoxs.forEach(checkBox => {
      checkBox.checked = true;
    });
  } else {
    checkBoxs.forEach(checkBox => {
      checkBox.checked = false;
    });
  }
});

// 승인 완료, 반려 버튼 ajax 통신
approveBtn.addEventListener("click", function (e) {

  // 누른 버튼의 텍스트
  const status = e.target.innerText;

  // 체크된 숙소의 아이디를 배열에 저장
  const roomList = [];
  checkBoxs.forEach(checkBox => {
    if (checkBox.checked) {
      roomList.push(checkBox.value);
    }
  });

  console.dir(roomList);

  const requestData = {
    status: status, room_id: roomList
  };

  console.dir(requestData);

// AJAX 요청 보내고 응답을 처리하는 함수 호출
  sendAjaxRequest('http://localhost:8080/admin/hostingManagement', 'PUT',
      requestData, function (error, response) {
        if (error) {
          console.error('AJAX request error:', error);
        } else {
          console.log('AJAX response:', response);
          // 여기서 응답 데이터를 처리합니다.
        }
      });

});

rejectBtn.addEventListener("click", function (e) {
  // 누른 버튼의 텍스트
  const status = e.target.innerText;

  // 체크된 숙소의 아이디를 배열에 저장
  const roomList = [];
  checkBoxs.forEach(checkBox => {
    if (checkBox.checked) {
      roomList.push(checkBox.value);
    }
  });

  console.dir(roomList);

  const requestData = {
    status: status, room_id: roomList
  };

  console.dir(requestData);
});

// AJAX 요청을 보내는 함수

function sendAjaxRequest(url, method, data, callback) {
  // XMLHttpRequest 객체 생성
  var xhr = new XMLHttpRequest();

  // 요청을 열고 초기화
  xhr.open(method, url, true);

  // 요청 상태가 변경될 때마다 호출되는 콜백 함수 설정
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) { // 요청이 완료되었을 때
      if (xhr.status === 200) { // 응답 상태 코드가 200 (성공)인 경우
        callback(null, xhr.responseText); // 콜백 함수 호출 (오류 없음)
      } else {
        callback(new Error('Request failed with status: ' + xhr.status), null); // 콜백 함수 호출 (오류 발생)
      }
    }
  };

  // 요청 헤더 설정
  xhr.setRequestHeader('Content-Type', 'application/json');

  // 요청 데이터를 JSON 문자열로 변환하여 전송
  xhr.send(JSON.stringify(data));
}