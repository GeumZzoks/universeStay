<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="utf-8"/>
<!-- moment()함수 -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- socket -->
<script
        src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
  /* .chatcontent {
      overflow: auto;
      height: 100%;
      position: relative;
  }   */
  .chat-containerK {
    /* overflow: hidden; */
    width: 100%;
    /* max-width : 200px; */
  }

  .chatcontent {
    height: 700px;
    width: 100%;
    /* width:300px; */
    overflow-y: scroll;
  }

  .chat-fix {
    position: fixed;
    bottom: 0;
    width: 100%;
  }

  #alertK {
    display: none;
  }

  #msgi {
    resize: none;
  }

  .myChat {
    background-color: #E0B1D0;
    display: inline-block;
    /* position: absolute;*/
    /* right: 0px; */
    /* float: right; */
    max-width: 200px;
    /* width : 100%; */
  }

  li {
    list-style-type: none;
  }

  .chatBox {
    display: inline-block;
  }

  .chatBox dateK {
    vertical-align: text-bottom;
  }

  .me {
    text-align: right;
    /* text-align:center; */
  }

  .otherChat {
    max-width: 200px;
  }
</style>

<div id="chat-containerK" class="border border-secondary">

    <div class="chatWrap">
        <%-- 		<div class="main_tit">
                    <h1>방 이름 [ ${roomNo}번 ] 아이디[${loginMember.memberId}]</h1>
                </div> --%>
        <div class="content chatcontent " data-room-no="${chat_room_id}"
             data-member="${user_id}">
            <div id="list-guestbook" class="">
                <c:forEach items="${firstList}" var="chatMessageDto">
                    <!-- 내 채팅일 경우 -->
                    <c:if test="${loginMember.memberId eq chatMessageDto.memberId}">

                        <li data-no="${chatMessageDto.no}" class="me pr-2">
                            <strong class="">${chatMessageDto.memberId}</strong>
                            <div class="me ">
                                <strong style="display : inline;"
                                        class="align-self-end"><fmt:formatDate
                                        value="${chatMessageDto.sendDate }"
                                        pattern="yy/MM/dd HH:mm"/></strong>
                                <p class="myChat text-left p-2">${chatMessageDto.chatContent }</p>
                            </div>
                        </li>
                    </c:if>
                    <!-- 다른사람의 채팅일 경우 -->
                    <c:if test="${loginMember.memberId ne chatMessageDto.memberId}">

                        <li data-no="${chatMessageDto.no}" class="pl-2">
                            <strong>${chatMessageDto.memberId}</strong>
                            <div class="row ml-0">
                                <p class="otherChat bg-light p-2">${chatMessageDto.chatContent }</p>
                                <strong class="align-self-center"><fmt:formatDate
                                        value="${chatMessageDto.sendDate }"
                                        pattern="yy/MM/dd HH:mm"/>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </div>

        </div>
        <div class="chat-fixK">
            <div id="alertK" onclick="moveDown();" class="alert alert-success" role="alert">
                <strong></strong>
            </div>
            <div class="fix_btn row">
                <textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea>
                <!-- <input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" /> -->
                <button type="button" class="send col-sm-4 btn btn-secondary">보내기</button>
            </div>
        </div>

    </div>
</div>
<script src="/resources/js/chat/chat.js"></script>
