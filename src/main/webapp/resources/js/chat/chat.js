var client;

//채팅 저장
function insertChat() {

  var user_id = "${user_id}";
  var chat_room_id = "${chat_room_id}";
  var chat_ctt = $("#msgi").val();

  // 서버로 전송할 데이터를 객체화
  var insertChatDto = {
    user_id: user_id,
    chatting_room_id: chat_room_id,
    chat_ctt: chat_ctt
  };

  $.ajax({
    url: "/chat/insertChat.do",
    type: "post",
    data: JSON.stringify(insertChatDto),
    contentType: "application/json",
    success: function (result) {

      if (result == 1) {
        alert("메시지가 전송되었습니다. 메시지함을 확인하세요");
      }
    },
    error: function (xhr, status, err) {
      console.log("처리실패!");
      console.log(xhr);
      console.log(status);
      console.log(err);
    }
  });
}

//생성된 메시지로 가기//맨 아래로 가기
function moveDown() {
  $(".chat_ctt").scrollTop($(".chat_ctt")[0].scrollHeight);
  $('#alertK').css('display', 'none');

}

$(document).ready(function () {
  //시작할때 스크롤 내리기
  $(".chat_ctt").scrollTop($(".chat_ctt")[0].scrollHeight);

  var isEnd = false;
  var isScrolled = false;
  var fetchList = function () {
    if (isEnd == true) {
      return;
    }

    // 채팅 리스트를 가져올 때 시작 번호
    // renderList 함수에서 html 코드의 <li> 태그에 data-no 속성으로
    // data- 속성의 값을 가져오기 위해 data() 함수 사용

    $.ajax({
      url: "${pageContext.request.contextPath}/chat/chatList.do?chat_room_id=${chat_room_id}",
      type: "GET",
      dataType: "json",
      success: function (result) {

        document.querySelector('.chat_ctt').scrollTo(
            {top: position.top, behavior: 'auto'});
        isScrolled = false;
      },
      error: function (xhr, status, err) {
        console.log("처리실패!");
        console.log(xhr);
        console.log(status);
        console.log(err);
      }
    });
  }

  var renderList = function (vo) {
    // 리스트 html을 정의
    var date = moment(vo.sendDate).format('YY/MM/DD HH:mm');
    var html = "";

    content = "<p class='otherChat bg-light p-2'>" + vo.chatContent
        + "</p>";

    html = "<li class='pl-2' data-no='" + vo.no + "'>"
        + "<strong>" + vo.user_id + "</strong>"
        + "<div class='row ml-0'>"
        + content
        + "<strong class='align-self-center'>" + date
        + "<a href='#' class='reportModalK'>"
        + "</a></strong>"
        + "</div>"
        + "</li>";

    return html;

  }
  //무한 스크롤
  $(".chatcontent").scroll(function () {
    var $window = $(this);
    var scrollTop = $window.scrollTop();
    var windowHeight = $window.height();
    var documentHeight = $(document).height();

    // scrollbar의 thumb가 위의1px까지 도달 하면 리스트를 가져옴
    if (scrollTop < 1 && isScrolled == false) {
      isScrolled = true;
      fetchList();

    }
  })

  ////////////////////socket
  //새로운 메시지 알림
  function newAlerts(content, endNo) {
    $('#alertK').css('display', 'block');
    $('#alertK').html(
        "<strong>" + content.user_id + "</strong>님이 메시지를 보냈습니다.");
  }

  $(function () {
    var chatBox = $('.box');
    var messageInput = $('textarea[name="msg"]');
    var roomNo = "${chat_room_id}";
    var member = $('.content').data('${user_id}');
    var sock = new SockJS(
        "${pageContext.request.contextPath}/endpoint");
    client = Stomp.over(sock);

    function sendmsg() {
      var message = messageInput.val();
      //alert("메시지"+message);
      if (message == "") {
        return false;
      }
      //insertChat();
      client.send('/app/hello/' + chat_room_id, {}, JSON
      .stringify({
        chatContent: message,
        user_id: "${user_id}",
      }));

      messageInput.val('');
    }

    client.connect({}, function () {
      // 여기는 입장시
      //	           일반메세지 들어오는곳
      client.subscribe('/subscribe/chat/' + chat_room_id, function (chat) {
        //받은 데이터
        var content = JSON.stringify(chat.body);

        var html = renderList(content);
        $("#list-guestbook").append(html);
        newAlerts(content);

      });

    });
    //	         대화시
    $('.send').click(function () {
      sendmsg();
    });

    //채팅창 떠날시에
    function disconnect() {
      if (client != null) {
        client.disconnect();
      }
    }

    window.onbeforeunload = function (e) {
      disconnect();
    }

    function closeConnection() {
      sock.close();
    }

    function viewList() {

      alert('viewList');
      var url = "/chat/chatList?page=" + page
          + "&perPageNum=" + perPageNum;
      location.replace(url);
    }

  });

});

$(document).ready(function () {
  $('.chat_list').click(function () {
    var chatting_room_id = $(this).data('chat-room-id');
    var room_id = $(this).data('room-id');
    console.log(chatting_room_id);
    location.href = '/enter/chattingRoomList/' + chatting_room_id + '?room_id='
        + room_id;
  });
});