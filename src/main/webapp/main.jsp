<%@ page import="org.springframework.ui.Model" %><%--
  Created by IntelliJ IDEA.
  User: hannaryu
  Date: 11/28/23
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>main</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <%--    <link rel="stylesheet" href="/resources/css/common/global.css">--%>
    <%--    <link rel="stylesheet" href="/resources/css/user/main.css">--%>

</head>
<body>
<script>
    let statusId = "${statusId}";
    if (statusId=="U04") alert("현재 휴면 상태입니다. 해제하시겠습니까?");
</script>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/user/nav.jsp"/>

<section class="screens-user-main__main">
    <div class="screens-user-main__main__wrapper">
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>


    </div>
</section>


<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

<%--<script>--%>
<%--&lt;%&ndash;  &lt;%&ndash;%>--%>
<%--&lt;%&ndash;      String statusId = (String) request.getAttribute("statusId");&ndash;%&gt;--%>


<%--&lt;%&ndash;      System.out.println("statusId = " + statusId);&ndash;%&gt;--%>
<%--&lt;%&ndash;      if (statusId.equals("U04")) {&ndash;%&gt;--%>
<%--&lt;%&ndash;  %>&ndash;%&gt;--%>


<%--  // window.onload = function() {--%>
<%--  //   alert("현재 휴면 상태입니다. 해제하시겠습니까?")--%>
<%--  // };--%>

<%--&lt;%&ndash;  <% } else if(statusId.equals("U04")) {&ndash;%&gt;--%>
<%--&lt;%&ndash;  %>&ndash;%&gt;--%>

<%--&lt;%&ndash;  window.onload = function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;    alert("회원탈퇴된 아이디 입니다. 관리자에게 문의하세요")&ndash;%&gt;--%>
<%--&lt;%&ndash;  };&ndash;%&gt;--%>

<%--&lt;%&ndash;<%}%>&ndash;%&gt;--%>

<%--</script>--%>
</body>
</html>
