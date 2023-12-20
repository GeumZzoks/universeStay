var client;

//생성된 메시지로 가기//맨 아래로 가기
function moveDown() {
  $(".chat_ctt").scrollTop($(".chat_ctt")[0].scrollHeight);
  $('#alertK').css('display', 'none');

}

$(document).ready(function () {
  $('.chat_list').click(function () {
    var chatting_room_id = $(this).data('chat-room-id');
    var room_id = $(this).data('room-id');
    location.href = '/enter/chattingRoomList/' + chatting_room_id + '?room_id='
        + room_id;
  });
});