<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유저 정보</title>
    <style>
        .screen-admin-userInfo__container {
            background-color: gainsboro;
            width: 100vw;
            height: 100%;
            position: absolute;
        }

        .screen-admin-userInfo__container__1 {
            width: 80%;
            height: 85%;
            min-height: 550px;
            position: relative;
            float: left;
            margin: 0 100px 0 230px;
            top: 78px;
            bottom: 25px;
            padding: 0 20px 0 20px;
            background-color: white;
            overflow: auto;
        }

        .screens-admin-userInfo__btn {
            width: 150px;
            height: 40px;
            float: right;
            position: fixed;
            right: 20px;
            top: 100px;
            z-index: 1;
        }

        .screens-admin-userInfo__btn button {
            background-color: indianred;
            color: white;
            border: 0;
            width: 50px;
            height: 24px;
            cursor: pointer;
            margin-left: 10px;
        }

        .screens-admin-userInfo__btn a {
            text-decoration: none;

        }

        .screen-admin-userInfo__container__2 {
            width: 80%;
            height: auto;
            min-height: 550px;
            position: absolute;
            float: left;
            margin: 20px 100px 0 230px;
            top: 110px;
            bottom: 25px;
            padding: 0 20px 0 20px;
            overflow: auto;
        }

        .screen-admin-userInfo__container__2 > div {
            display: inline-block;
            margin-top: 10px;
            margin-left: 20px;
            width: auto;
            min-width: 100px;
        }

        .screen-admin-userInfo__container__2 > div:nth-of-type(2) select {
            position: absolute;
            margin-left: 5px;
            top: 7px;
            width: 60px;
            height: 20px;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/footer.jsp" flush="false"/>

<article class="screen-admin-userInfo__container">
    <section class="screen-admin-userInfo__container__1">
        <h3 style="color: indianred; margin-top: 20px; font-weight: 600;">유저 정보</h3>
        <div class="screens-admin-userInfo__btn">
            <a href="/admin/user/list${sc.getQueryString()}">
                <button>목록</button>
            </a>
            <a id="mylink">
                <button id="mybtn">수정</button>
            </a>
        </div>
    </section>
    <section class="screen-admin-userInfo__container__2">
        <div>유저 상태</div>
        <c:choose>
            <c:when test="${dto.status_id eq 'U01'}">
                <div id="status" style="color: mediumseagreen"></div>
            </c:when>
            <c:when test="${dto.status_id eq 'U02'}">
                <div id="status" style="color: black"></div>
            </c:when>
            <c:when test="${dto.status_id eq 'U03'}">
                <div id="status" style="color: #E61E4D"></div>
            </c:when>
            <c:otherwise>
                <div id="status" style="color: darkgray"></div>
            </c:otherwise>
        </c:choose>
        <%--        <div>${dto.status_id}</div>--%>
        <br>
        <div>유저 ID</div>
        <div>${dto.user_id}</div>
        <br>
        <div>이름</div>
        <div>${dto.user_name}</div>
        <br>
        <div>닉네임</div>
        <div>${dto.user_nickname}</div>
        <br>
        <div>이메일</div>
        <div>${dto.user_email}</div>
        <br>
        <div>전화번호 1</div>
        <div>${dto.user_phone_num1}</div>
        <br>
        <div>전화번호 2</div>
        <div>${dto.user_phone_num2}</div>
        <br>
        <div>생년월일</div>
        <div>${dto.user_birth}</div>
        <br>
        <div>주소</div>
        <div>${dto.user_address}</div>
        <br>
        <div>자기소개</div>
        <div>${dto.user_bio}</div>
        <br>
        <div>호스트 여부</div>
        <div>${dto.user_is_host}</div>
        <br>
        <div>호스트 전환일자</div>
        <div>${dto.user_hosting_started_at}</div>
        <br>
        <div>신분증 인증</div>
        <div>${dto.user_is_certificated}</div>
        <br>
        <div>추천인 ID</div>
        <div>${dto.user_id2}</div>
        <br>
        <div>마지막 로그인</div>
        <div>${dto.user_last_login}</div>
        <br>
        <div>최초등록일자</div>
        <div>${dto.created_at}</div>
        <br>
        <div>최초등록자 ID</div>
        <div>${dto.created_id}</div>
        <br>
        <div>최종변경일자</div>
        <div>${dto.updated_at}</div>
        <br>
        <div>최종변경자 ID</div>
        <div>${dto.updated_id}</div>
        <br>
        <br><br>
    </section>
    <script>
        let status1;
        if (`${dto.status_id}` === 'U01') status1 = '활성';
        else if (`${dto.status_id}` === 'U02') status1 = '휴면';
        else if (`${dto.status_id}` === 'U03') status1 = '정지';
        else if (`${dto.status_id}` === 'U04') status1 = '탈퇴';
        else status1 = '에러'
        document.getElementById('status').innerHTML = status1;
        document.getElementById('mylink').addEventListener('click', function () {

            var mybtn = document.getElementById('mybtn');
            var options = [{U01: '활성'}, {U02: '휴면'}, {U03: '정지'}, {U04: '탈퇴'}];
            var statusContainer = document.querySelector('.screen-admin-userInfo__container__2 > div:nth-of-type(2)');
            var selectElement = document.createElement('select');
            selectElement.name = 'status_id';
            options.forEach(function (optionValue) {
                var optionElement = document.createElement('option');
                // console.log(options);
                // console.log(optionValue);
                // console.log(Object.keys(optionValue)[0]);
                // console.log(optionValue[Object.keys(optionValue)[0]]);
                optionElement.value = Object.keys(optionValue)[0]; // 주의
                optionElement.text = optionValue[Object.keys(optionValue)[0]]; // 주의
                selectElement.appendChild(optionElement);
            })

            // 수정버튼 눌렀을 때 동작
            if (mybtn.textContent === '수정') {
                mybtn.innerHTML = '저장';
                statusContainer.append(selectElement);

                // 선택된 값이 변경될 때마다 저장
                selectElement.addEventListener('change', function () {
                    selectedOptionValue = selectElement.value;
                });
                // 저장버튼 눌렀을 때 동작
            } else {
                mybtn.innerHTML = '수정';
                statusContainer.innerHTML = '${dto.status_id}';
                updateUser(selectedOptionValue);
            }
        })

        function updateUser(selectedOptionValue) {

            var f = document.createElement('form');
            f.setAttribute('method', 'get');
            f.setAttribute('action', '/admin/user/update');

            var user_id = document.createElement('input');
            user_id.setAttribute('type', 'hidden');
            user_id.setAttribute('name', 'user_id');
            user_id.setAttribute('value', `${dto.user_id}`);

            var status_id = document.createElement('input');
            status_id.setAttribute('type', 'hidden');
            status_id.setAttribute('name', 'status_id');
            status_id.setAttribute('value', selectedOptionValue);
            console.log(selectedOptionValue);

            f.appendChild(user_id);
            f.appendChild(status_id);

            document.body.appendChild(f);
            f.submit();
        }
    </script>
</article>
<jsp:include page="/WEB-INF/views/common/admin/footer.jsp" flush="false"/>
</body>
</html>
