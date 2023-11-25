// 월 선택 박스
function show(anything) {
  document.querySelector('.dropdown__textBox').value = anything;
}

let dropdown = document.querySelector('.dropdown');

dropdown.onclick = function () {
  dropdown.classList.toggle('active');
}