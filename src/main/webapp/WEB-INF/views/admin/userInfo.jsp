<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유저 정보</title>
    <style>
      .screen-admin-userInfo__container {
        /*float: right;*/
        /*display: flex;*/
        /*flex-direction: column;*/
        position: fixed;
        overflow: auto;
        left: 250px;
        top: 70px;
        width: calc(100% - 250px);
        height: calc(100% - 70px);
      }

      .screen-admin-userInfo__container__1 {
        float: right;
        margin-right: 100px;
        margin-bottom: 20px;
        /*justify-content: flex-end;*/
      }

      .screen-admin-userInfo__container__1 > a {
        /*justify-content: flex-end;*/
      }

      .screen-admin-userInfo__container__2 {
          position: absolute;
          border: 2px solid lightgray;
          border-radius: 20px;
          width: 1500px;
          height: 800px;
          top: 30px;
          left: 50px;
      }

      .screen-admin-userInfo__container__2 > p {
        margin-bottom: 10px;
        font-size: 20px;
      }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/footer.jsp" flush="false"/>

<article class="screen-admin-userInfo__container">
    <section class="screen-admin-userInfo__container__1">
        <a href="/admin/user/list${sc.getQueryString()}">
            <button>목록</button>
        </a>
        <a id="mylink">
            <button id="mybtn">수정</button>
        </a>
    </section>
    <section class="screen-admin-userInfo__container__2">
        <span>ID : </span><span>${dto.user_id}</span><br>
        <span>추천인 ID : </span><span>${dto.user_id2}</span><br>
        <span>상태코드 : </span><span>${dto.status_id}</span><br>
        <span>비밀번호 : </span><span>${dto.user_pwd}</span><br>
        <span>닉네임 : </span><span>${dto.user_nickname}</span><br>
        <span>이름 : </span><span>${dto.user_name}</span><br>
        <span>이메일 : </span><span>${dto.user_email}</span><br>
        <span>마지막 로그인 : </span><span>${dto.user_last_login}</span><br>
        <span>전화번호1 : </span><span>${dto.user_phone_num1}</span><br>
        <span>전화번호2 : </span><span>${dto.user_phone_num2}</span><br>
        <span>주소 : </span><span>: ${dto.user_address}</span><br>
        <span>생년월일 : </span><span>${dto.user_birth}</span><br>
        <span>신분증 인증 : </span><span>${dto.user_is_certificated}</span><br>
        <span>호스트 여부 : </span><span>${dto.user_is_host}</span><br>
        <span>호스트 전환일자 : </span><span>${dto.user_hosting_started_at}</span><br>
        <span>자기소개 : </span><span>${dto.user_bio}</span><br>
        <span>최초등록일자 : </span><span>${dto.created_at}</span><br>
        <span>최초등록자 ID : </span><span>${dto.created_id}</span><br>
        <span>최종변경일자 : </span><span>${dto.updated_at}</span><br>
        <span>최종변경자 ID : </span><span>${dto.updated_id}</span><br>
    </section>
    <script>
        document.getElementById('mylink').addEventListener('click', function () {

            var mylink = document.getElementById('mylink');
            var mybtn = document.getElementById('mybtn');
            var options = [{U01: '활성'}, {U02: '휴면'}, {U03: '정지'}, {U04: '탈퇴'}];
            var statusContainer = document.querySelector('.screen-admin-userInfo__container__2 > span:nth-of-type(6)');
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

            // 저장버튼 눌렀을 때 동작
            } else {
                mybtn.innerHTML = '수정';

                // 선택된 옵션 값을 가져오기
                var selectedOptionValue = selectElement.value;

                statusContainer.innerHTML = '${dto.status_id}';

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

                // 폼에 input 요소 추가
                f.appendChild(user_id);
                f.appendChild(status_id);

                document.body.appendChild(f);
                f.submit();
            }
        })

        function heyhey() {
            <%--let f = document.createElement('form');--%>
            <%--f.setAttribute('method', 'get');--%>
            <%--f.setAttribute('action', '/admin/user/update');--%>

            <%--var user_id = document.createElement('input');--%>
            <%--user_id.setAttribute('type', 'hidden');--%>
            <%--user_id.setAttribute('name', 'user_id');--%>
            <%--// user_id.setAttribute('value', 'abcdabca');--%>
            <%--user_id.setAttribute('value', `${dto.user_id}`);--%>

            <%--var status_id = document.createElement('input');--%>
            <%--status_id.setAttribute('type', 'hidden');--%>
            <%--status_id.setAttribute('name', 'status_id');--%>
            <%--status_id.setAttribute('value', optionElement.value);--%>

            <%--// 폼에 input 요소 추가--%>
            <%--f.appendChild(user_id);--%>
            <%--f.appendChild(status_id);--%>

            <%--document.body.appendChild(f);--%>
            <%--f.submit();--%>
        }


    </script>

</article>
</body>
</html>
