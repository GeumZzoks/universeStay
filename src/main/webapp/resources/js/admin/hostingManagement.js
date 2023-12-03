// DOM 객체
let checkAllBox = document.querySelector(
    ".screens-admin-hostingManagement__content-table__check-all");
let checkAllBoxBtn = document.querySelector(
    ".screens-admin-hostingManagement__content-table__check-all-btn");
let checkBoxs = document.querySelectorAll(
    ".screens-admin-hostingManagement__content-table__check");
let statusBtns = document.querySelectorAll(
    '.screens-admin-hostingManagement__btn-status');
const searchBtn = document.querySelector(
    '.screens-admin-hostingManagement__search__btn');
const searchSelect = document.querySelector(
    '.screens-admin-hostingManagement__search__select');
const searchInput = document.querySelector(
    '.screens-admin-hostingManagement__search__input');
const contentTable = document.querySelector(
    '.screens-admin-hostingManagement__content-table');

// 체크 박스 기능
function handleCheckAllClick(e) {
  if (e.target.checked) {
    checkBoxs.forEach(checkBox => {
      checkBox.checked = true;
    });
  } else {
    checkBoxs.forEach(checkBox => {
      checkBox.checked = false;
    });
  }
}

function handleStatusBtnClick(e) {
  // 누른 버튼의 텍스트
  const status = e.target.innerText;

  // 체크된 숙소의 아이디를 배열에 저장
  const roomList = [];
  checkBoxs.forEach(checkBox => {
    if (checkBox.checked) {
      roomList.push(checkBox.value);
    }
  });

  const requestData = {
    status: status, room_id: roomList
  };

// AJAX 요청 보내고 응답을 처리하는 함수 호출
  sendAjaxRequest('http://localhost:8080/admin/hostingManagement', 'PUT',
      requestData, function (error, response) {
        if (error) {
          // 에러 발생시
          console.error('AJAX request error:', error);
          location.href = "http://localhost:8080/admin/hostingManagement";
        } else {
          // 여기서 응답 데이터를 처리합니다.
          console.log('AJAX response:', response);

          roomList.forEach(room_id => {
            const status_id = document.querySelector(
                "td[value='" + room_id + "']");
            status_id.innerHTML = (status === "승인 완료") ? '승인 완료' : '승인 반려';

            if (status_id.innerHTML === "승인 전") {
              status_id.style.background = 'yellow';
            } else if (status_id.innerHTML === "승인 완료") {
              status_id.style.background = 'green';
            } else {
              status_id.style.background = 'red';
            }
          });

          checkAllBoxBtn.checked = false;

          checkBoxs.forEach(checkBox => {
            checkBox.checked = false;
          });
        }
      });
}

function setupEventListeners() {

  // Attach event listener to a common ancestor element of checkBoxs
  checkAllBoxBtn.addEventListener('click', handleCheckAllClick);

  statusBtns.forEach(statusBtn => {
    statusBtn.addEventListener("click", handleStatusBtnClick);
  });
}

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

// 검색 기능 (fetch API 사용)
searchBtn.addEventListener('click', function () {

  fetch('http://localhost:8080/admin/hostingManagement', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      status_id: searchSelect.value,
      room_name: searchInput.value
    })
  })
  .then(response => {
    if (response.ok) {
      return response.json(); // Parse the JSON data
    } else {
      throw new Error('Server error');
    }
  })
  .then(data => {

    let html = '';
    html += '<tr class="screens-admin-hostingManagement__content-table__header">';
    html += '<th class="screens-admin-hostingManagement__content-table__check-all"><input type="checkbox" class="screens-admin-hostingManagement__content-table__check-all-btn"></th>';
    html += '<th class="screens-admin-hostingManagement__content-table__name">숙소 이름</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__advances-desc">숙소 장점 설명</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__sapce-desc">공간 상세 설명</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__etc-desc">기타 상세 설명</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__price-weekday">주중 1박 요금</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__price-weekend">주말 1박 요금 </th>';
    html += '<th class="screens-admin-hostingManagement__content-table__price-add">인원 추가 요금</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__created-at">등록일자</th>';
    html += '<th class="screens-admin-hostingManagement__content-table__status-approve">숙소 승인 상태</th>';
    html += '</tr>';

    for (let i = 0; i < data.length; i++) {
      const room = data[i];
      room.created_at = new Date(room.created_at).getFullYear() + '-' + ('0'
          + (new Date(room.created_at).getMonth() + 1)).slice(-2) + '-' + ('0'
          + (new Date(room.created_at).getDate())).slice(-2) + ' ' + ('0'
          + (new Date(room.created_at).getHours())).slice(-2) + ':' + ('0'
          + (new Date(room.created_at).getMinutes())).slice(-2);
      room.status_id = room.status_id == "RA01" ? "승인전" : (room.status_id
      == "RA02" ? "승인 완료"
          : "승인 반려");

      html += '<tr>';
      html += '<td><input type="checkbox" value="' + room.room_id
          + '"class="screens-admin-hostingManagement__content-table__check"></td>';
      html += '<td>' + room.room_name + '</td>';
      html += '<td>' + room.room_total_desc + '</td>';
      html += '<td>' + room.room_space_desc + '</td>';
      html += '<td>' + room.room_etc_desc + '</td>';
      html += '<td>' + room.room_weekday_price + '</td>';
      html += '<td>' + room.room_weekend_price + '</td>';
      html += '<td>' + room.room_extra_person_fee + '</td>';
      html += '<td>' + room.created_at + '</td>';
      html += '<td value="' + room.room_id
          + '"class="screens-admin-hostingManagement__content-table__status-id-td" data-status="'
          + room.status_id + '">'
          + room.status_id + '</td>';
      html += '</tr>';
    }

    contentTable.innerHTML = html;

    // 이벤트리스너 다시 달아줌
    checkAllBoxBtn = document.querySelector(
        ".screens-admin-hostingManagement__content-table__check-all-btn");
    checkBoxs = document.querySelectorAll(
        ".screens-admin-hostingManagement__content-table__check");
    statusBtns = document.querySelectorAll(
        '.screens-admin-hostingManagement__btn-status');

    setupEventListeners();
  })
  .catch(error => {
    console.error('Error in Fetch request:', error);
  });
});

setupEventListeners();
