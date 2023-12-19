var client;

//생성된 메시지로 가기//맨 아래로 가기
function moveDown() {
  $(".chat_ctt").scrollTop($(".chat_ctt")[0].scrollHeight);
  $('#alertK').css('display', 'none');

}

//무한 스크롤
$(".chat_ctt").scroll(function () {
  var $window = $(this);
  var scrollTop = $window.scrollTop();

  // scrollbar의 thumb가 위의1px까지 도달 하면 리스트를 가져옴
  if (scrollTop < 1 && isScrolled == false) {
    isScrolled = true;
    fetchList();

  }
});

$(document).ready(function () {
  $('.chat_list').click(function () {
    var chatting_room_id = $(this).data('chat-room-id');
    var room_id = $(this).data('room-id');
    location.href = '/enter/chattingRoomList/' + chatting_room_id + '?room_id='
        + room_id;
  });
});