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
            width: calc(100% - 200px);
            height: calc(100% - 70px);
        }

        .screen-admin-userInfo__container__1 {
            float: right;
            margin-right: 100px;
            margin-bottom: 20px;
        }

        .screen-admin-userInfo__container__1 > a {
        }

        .screen-admin-userInfo__container__2 {
            position: absolute;
            border: 2px solid lightgray;
            border-radius: 20px;
            width: 1500px;
            /*height: 800px;*/
            top: 30px;
            left: 30px;
            font-size: 20px;
        }

        .screen-admin-userInfo__container__2 > div {
            display: inline-block;
            margin-top: 10px;
            margin-left: 20px;
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
        <div>ID :</div>
        <div>${dto.user_id}</div>
        <br>
        <div>추천인 ID :</div>
        <div>${dto.user_id2}</div>
        <br>
        <div>상태코드 :</div>
        <div id="status"></div>
<%--        <div>${dto.status_id}</div>--%>
        <br>
        <div>비밀번호 :</div>
        <div>${dto.user_pwd}</div>
        <br>
        <div>닉네임 :</div>
        <div>${dto.user_nickname}</div>
        <br>
        <div>이름 :</div>
        <div>${dto.user_name}</div>
        <br>
        <div>이메일 :</div>
        <div>${dto.user_email}</div>
        <br>
        <div>마지막 로그인 :</div>
        <div>${dto.user_last_login}</div>
        <br>
        <div>전화번호1 :</div>
        <div>${dto.user_phone_num1}</div>
        <br>
        <div>전화번호2 :</div>
        <div>${dto.user_phone_num2}</div>
        <br>
        <div>주소 :</div>
        <div>: ${dto.user_address}</div>
        <br>
        <div>생년월일 :</div>
        <div>${dto.user_birth}</div>
        <br>
        <div>신분증 인증 :</div>
        <div>${dto.user_is_certificated}</div>
        <br>
        <div>호스트 여부 :</div>
        <div>${dto.user_is_host}</div>
        <br>
        <div>호스트 전환일자 :</div>
        <div>${dto.user_hosting_started_at}</div>
        <br>
        <div>자기소개 :</div>
        <div>${dto.user_bio}</div>
        <br>
        <div>최초등록일자 :</div>
        <div>${dto.created_at}</div>
        <br>
        <div>최초등록자 ID :</div>
        <div>${dto.created_id}</div>
        <br>
        <div>최종변경일자 :</div>
        <div>${dto.updated_at}</div>
        <br>
        <div>최종변경자 ID :</div>
        <div>${dto.updated_id}</div>
        <br>
        <br><br>
    </section>
        <script>
            let status1;
            if(`${dto.status_id}` === 'U01') status1 = '활성';
            else if(`${dto.status_id}` === 'U02') status1 = '휴면';
            else if(`${dto.status_id}` === 'U03') status1 = '정지';
            else if(`${dto.status_id}` === 'U04') status1 = '탈퇴';
            else status1 = '에러'
            document.getElementById('status').innerHTML = status1;
            document.getElementById('mylink').addEventListener('click', function () {

                var mybtn = document.getElementById('mybtn');
                var options = [{U01: '활성'}, {U02: '휴면'}, {U03: '정지'}, {U04: '탈퇴'}];
                var statusContainer = document.querySelector('.screen-admin-userInfo__container__2 > div:nth-of-type(6)');
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
</body>
</html>
