<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-04
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문의사항</title>
    <style></style>
</head>
<style>
    .screens-admin-inquiry__container {
        box-sizing: border-box;
    }

    .screens-admin-inquiry__content {
        width: 1200px;
        background: yellow;
        border-radius: 20px;
        position: absolute;
        left: 250px;
        top: 120px;

    }

    .screens-admin-inquiry__content__1 {
        text-align: right;
        margin: 10px 20px;

    }

    .screens-admin-inquiry__content__2 {
        background: gainsboro;
        text-align: center;
        font-size: 20px;
        display: grid;
        grid-template-columns: 1fr 3fr 1fr 3fr 1fr 3fr;
        /* grid-template-columns: 100px 200px auto */

        grid-template-rows: repeat(3, minmax(50px, auto));
        /*grid-template-rows: 200px 200px 500px;*/
        /*grid-auto-rows: minmax(100px, auto);*/

        row-gap: 0px;
        column-gap: 0px;
        /*gap: 10px; 20px*/
    }

    .screens-admin-inquiry__content__2 * {
        padding: 5px;
        border: 1px solid black;
    }


    .screens-admin-inquiry__content__2 > div:nth-of-type(1) {
        grid-column: 1/2;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(2) {
        grid-column: 2/7;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(3) {
        grid-column: 1/2;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(4) {
        grid-column: 2/3;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(5) {
        grid-column: 3/4;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(6) {
        grid-column: 4/5;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(7) {
        grid-column: 5/6;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(8) {
        grid-column: 6/7;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(9) {
        grid-column: 1/2;
    }

    .screens-admin-inquiry__content__2 > div:nth-of-type(10) {
        grid-column: 2/7;
    }

    .screens-admin-inquiry__content__3 {

    }

    .screens-admin-inquiry__content__3__form {
        text-align: right;
        margin-top: 20px;
        margin-right: 20px;
    }

    .screens-admin-inquiry__content__3__form > input:nth-of-type(3) {
        width: 1000px;
        height: 80px;
    }

    .screens-admin-inquiry__content__3__form > input:nth-of-type(4) {
        width: 40px;
        height: 40px;
        margin-left: 10px;

    }

    .screens-admin-inquiry__content__4 {
        width: calc(100% - 20px);
        margin-top: 50px;
        background: lightpink;
        text-align: center;
        font-size: 20px;
        display: grid;

        /*grid-auto-columns: minmax(100px, auto);*/
        /*grid-auto-rows: minmax(100px, auto);*/

        row-gap: 10px;
        column-gap: 20px;
        /*gap: 10px; 20px*/
    }

    .screens-admin-inquiry__content__4 > div {
        border: 1px solid black;
        margin-top: 15px;
        background: #62baea;
        text-align: center;
        font-size: 10px;
        display: grid;

        grid-template-columns: 3fr 13fr 1fr;
        grid-template-rows: 1fr 1fr;
    }

    .screens-admin-inquiry__content__4 > div > * {
        padding: 10px;
    }

    .screens-admin-inquiry__content__4 > div > div:nth-of-type(1) {
        grid-column: 1/2;
        grid-row: 1/2;
    }

    .screens-admin-inquiry__content__4 > div > input {
        border: 1px solid black;
        grid-column: 2/3;
        grid-row: 1/3;
    }

    .screens-admin-inquiry__content__4 > div > div:nth-of-type(2) {
        grid-column: 3/4;
        grid-row: 1/3;
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
        justify-content: flex-end;
        align-items: start;
    }

    .screens-admin-inquiry__content__4 > div > div:nth-of-type(3) {
        grid-column: 1/2;
        grid-row: 2/3;
    }
</style>
<body>
<div class="screens-admin-inquiry__container">
    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
    <div class="screens-admin-inquiry__content">
        <div class="screens-admin-inquiry__content__1">
            <button><a href="<c:url value='/admin/inquiry/list${sc.getQueryString()}'/>">목록</a></button>
        </div>
        <div class="screens-admin-inquiry__content__2">
            <div class="screens-admin-inquiry__content__2-box1">제목</div>
            <div class="screens-admin-inquiry__content__2-box2">${dto.inquiry_title}</div>
            <div class="screens-admin-inquiry__content__2-box3">공개여부</div>
            <div class="screens-admin-inquiry__content__2-box4">${dto.inquiry_is_open}</div>
            <div class="screens-admin-inquiry__content__2-box5">ID</div>
            <div class="screens-admin-inquiry__content__2-box6">${dto.user_id}</div>
            <div class="screens-admin-inquiry__content__2-box7">작성일</div>
            <div class="screens-admin-inquiry__content__2-box8">${dto.created_at}</div>
            <div class="screens-admin-inquiry__content__2-box9">내용</div>
            <div class="screens-admin-inquiry__content__2-box10">${dto.inquiry_ctt}</div>
        </div>
        <div class="screens-admin-inquiry__content__3">
            <form class="screens-admin-inquiry__content__3__form"
                  action="<c:url value='/admin/inquiry/writereply${sc.getQueryString()}'/>" method="post">
                <input type="hidden" name="inquiry_id" value="${dto.inquiry_id}"/>
                <input type="hidden" name="reply_writer_id" value="${dto.user_id}" readonly/>
                <input type="text" name="reply_ctt" placeholder="내용을 입력해주세요..."/>
                <input type="submit" value="등록">
            </form>
        </div>
        <div class="screens-admin-inquiry__content__4">
            <c:forEach var="dto2" items="${list}" varStatus="status">
                <div class="screens-admin-inquiry__content__4-${status.count}">
                    <div>${dto2.reply_writer_id}</div>
                    <input value="${dto2.reply_ctt}" readonly/>
                    <div>
                        <a href="#;"><button class="screens-admin-inquiry__content__4-cancelbtn screens-admin-inquiry__content__4-cancelbtn-${status.count}" onclick="cancelUpdateReply()" hidden>취소</button></a>
                        <a href="#;"><button class="screens-admin-inquiry__content__4-modifybtn screens-admin-inquiry__content__4-modifybtn-${status.count}" onclick="updateReply(${status.count}, ${dto2.reply_id})">수정</button></a>
                        <a href="#;"><button class="screens-admin-inquiry__content__4-removebtn" onclick="deleteReply(${dto2.reply_id})">삭제</button></a>
                    </div>
                    <div>${dto2.created_at}</div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script>
        function cancelUpdateReply() {
            window.location.reload();
        }

        function updateReply(num, replyId) {
            let modifybtn = document.querySelector('.screens-admin-inquiry__content__4-modifybtn-' + num);
            let inputtag = document.querySelector('.screens-admin-inquiry__content__4-' + num + '>input');
            // let modifybtns = document.querySelectorAll('.screens-admin-inquiry__content__4-modifybtn');

            if (modifybtn.textContent === '수정') {
                alert("gg")
                modifybtn.innerHTML = '완료';
                inputtag.removeAttribute("readonly");
                let def = document.querySelector('.screens-admin-inquiry__content__4-cancelbtn-' + num);
                def.removeAttribute("hidden");
            } else {
                alert("123")
                let f = document.createElement('form');
                f.setAttribute('method', 'post');
                f.setAttribute('action', '/admin/inquiry/updatereply');

                let sc = document.createElement('input');
                sc.setAttribute('type', 'hidden');
                sc.setAttribute('name', 'sc');
                sc.setAttribute('value', `${sc}`);
                f.appendChild(sc);

                let updated_id = document.createElement('input');
                updated_id.setAttribute('type', 'hidden');
                updated_id.setAttribute('name', 'updated_id');
                updated_id.setAttribute('value', `${dto.user_id}`);
                f.appendChild(updated_id);

                let inquiry_id = document.createElement('input');
                inquiry_id.setAttribute('type', 'hidden');
                inquiry_id.setAttribute('name', 'inquiry_id');
                inquiry_id.setAttribute('value', ${dto.inquiry_id});
                f.appendChild(inquiry_id);

                let reply_id = document.createElement('input');
                reply_id.setAttribute('type', 'hidden');
                reply_id.setAttribute('name', 'reply_id');
                reply_id.setAttribute('value', replyId);
                f.appendChild(reply_id);

                let reply_ctt = document.createElement('input');
                reply_ctt.setAttribute('type', 'hidden');
                reply_ctt.setAttribute('name', 'reply_ctt');
                reply_ctt.setAttribute('value', inputtag.value);
                f.appendChild(reply_ctt);

                document.body.appendChild(f);
                f.submit();

                modifybtn.innerHTML = '수정';
            }


        }

        function deleteReply(replyId) {

            var f = document.createElement('form');
            f.setAttribute('method', 'post');
            f.setAttribute('action', '/admin/inquiry/deletereply');

            var sc = document.createElement('input');
            sc.setAttribute('type', 'hidden');
            sc.setAttribute('name', 'sc');
            sc.setAttribute('value', `${sc}`);

            var reply_id = document.createElement('input');
            reply_id.setAttribute('type', 'hidden');
            reply_id.setAttribute('name', 'reply_id');
            reply_id.setAttribute('value', replyId)

            var inquiry_id = document.createElement('input');
            inquiry_id.setAttribute('type', 'hidden');
            inquiry_id.setAttribute('name', 'inquiry_id');
            inquiry_id.setAttribute('value', ${dto.inquiry_id})

            f.appendChild(sc);
            f.appendChild(reply_id);
            f.appendChild(inquiry_id);

            document.body.appendChild(f);
            f.submit();
        }

    </script>
</body>
</html>
