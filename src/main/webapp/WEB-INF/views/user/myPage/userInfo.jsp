<%--
  Created by IntelliJ IDEA.
  User: hannaryu
  Date: 11/28/23
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>myPage</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>

<section>
    <div>
        <div>
            <div>계정 정보</div>

            <span class=""></span>

            <div>
                <span>이메일</span>
                <span>${user.user_email}</span>
            </div>
            <div>
                <span>이름</span>
                <span>${user.user_name}</span>
            </div>
            <div>
                <span>신분증 인증 여부</span>
                <span>${user.user_is_certificated}</span>
                <button>인증하기</button>
            </div>
            <div>
                <div>
                    <span>비밀번호</span>
                    <span> ********* </span>
                    <span></span>
                    <button>변경하기</button>
                </div>
                <div>
                    <span>비밀번호</span>
                    <div>
                        <div>
                            <span>현재 비밀번호</span>
                            <input>
                        </div>
                        <div>
                            <span>신규 비밀번호</span>
                            <input>
                        </div>
                        <div>
                            <span>신규 비밀번호 재입력</span>
                            <input>
                        </div>
                        <button>취소</button>
                        <button>변경 완료</button>
                    </div>
                    <span></span>
                </div>

            </div>
        </div>

        <span></span>

        <div>
            <form>
                <div>
                    <span>프로필 사진</span>
                    <img>
                </div>
                <div>
                    <span>닉네임</span>
                    <input>
                </div>
                <div>
                    <span>자기소개</span>
                    <textarea></textarea>
                </div>
                <div>
                    <span>휴대전화</span>
                    <input>
                </div>
                <div>
                    <span>전화번호</span>
                    <input>
                </div>
                <button>취소</button>
                <button>수정하기</button>
            </form>
        </div>


    </div>
</section>

</body>
</html>

