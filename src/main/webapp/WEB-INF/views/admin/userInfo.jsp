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
    <div class="screen-admin-userInfo__container__1">
        <a>
            <button>목록</button>
        </a>
        <a>
            <button>수정</button>
        </a>
    </div>
    <section class="screen-admin-userInfo__container__2">
        <p>ID : ${dto.user_id}</p>
        <p>추천인 ID : ${dto.user_id2}</p>
        <p>상태코드 : ${dto.status_id}</p>
        <p>프로필이미지 ID : ${dto.profile_img_id}</p>
        <p>비밀번호 : ${dto.user_pwd}</p>
        <p>닉네임 : ${dto.user_nickname}</p>
        <p>이름 : ${dto.user_name}</p>
        <p>이메일 : ${dto.user_email}</p>
        <p>마지막 로그인 : ${dto.user_last_login}</p>
        <p>전화번호1 : ${dto.user_phone_num1}</p>
        <p>전화번호2 : ${dto.user_phone_num2}</p>
        <p>주소 : ${dto.user_address}</p>
        <p>생년월일 : ${dto.user_birth}</p>
        <p>신분증 인증 : ${dto.user_is_certificated}</p>
        <p>호스트 여부 : ${dto.user_is_host}</p>
        <p>호스트 전환일자 : ${dto.user_hosting_started_at}</p>
        <p>프로필 이미지 URL : ${dto.user_img_url}</p>
        <p>자기소개 : ${dto.user_bio}</p>
        <p>최초등록일자 : ${dto.created_at}</p>
        <p>최초등록자 ID : ${dto.created_id}</p>
        <p>최종변경일자 : ${dto.updated_at}</p>
        <p>최종변경자 ID : ${dto.updated_id}</p>
    </section>
</article>
</body>
</html>
