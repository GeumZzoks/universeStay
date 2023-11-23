<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이벤트 등록</title>
    <link rel="stylesheet" href="../../../resources/css/common/admin/event.css">
</head>
<body>
    <div class="bar-top">
      <button class="bar-top__btn">로그아웃</button>
      <button class="bar-top__btn">관리자 1</button>
    </div>

    <aside class="bar-side">
      <button class="bar-side__homebtn"><a href="/event/list">
        UniverseStay</a></button>
      <button class="bar-side__btn">유저관리</button><br>
      <button class="bar-side__btn">호스트관리</button><br>
      <button class="bar-side__btn">공지사항</button><br>
      <button class="bar-side__btn">이벤트</button><br>
      <button class="bar-side__btn">1:1문의</button>
    </aside>

    <div class="content">
      <h3 style="color:indianred;">이벤트 등록</h3>
      <h5>이벤트 제목</h5>
      <input type="text" style="width: 50%;">
      <h5>이벤트 내용</h5>
      <textarea style="width:99%; height: 300px; overflow: scroll;"></textarea>
      <br>
      <h5>첨부파일(이미지)</h5>
      <input type="file" style="position: absolute; margin-top: -15px; background-color: transparent">
    </div>
    <div class="content-bottom"><a href="/event/write"><button class="content-bottom__btn">이벤트 게시글 등록</button></a></div>

</body>
</html>
