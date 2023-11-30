<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>이벤트</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<div class="screens-admin-hostingManagement__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-hostingManagement__content">
        <h3 style="color: indianred; margin-top: 20px">호스팅관리</h3>

        <div class="screens-admin-hostingManagement__btn-box">
            <button class="screens-admin-hostingManagement__btn screens-admin-hostingManagement__btn-approve">
                승인 완료
            </button>
            <button class="screens-admin-hostingManagement__btn screens-admin-hostingManagement__btn-reject">
                승인 반려
            </button>
        </div>

        <div class="screens-admin-hostingManagement__content-table-div">
            <table class="screens-admin-hostingManagement__content-table">
                <tr>
                    <th class="screens-admin-hostingManagement__content-table__check-all">
                        <input type="checkbox">
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__name">숙소 이름</th>
                    <th class="screens-admin-hostingManagement__content-table__advances-desc">숙소 장점
                        설명
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__sapce-desc">공간 상세
                        설명
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__etc-desc">기타 상세 설명
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__price-weekday">주중 1박
                        요금
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__price-weekend">주말 1박
                        요금
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__price-add">인원 추가 요금
                    </th>
                    <th class="screens-admin-hostingManagement__content-table__created-at">등록일자</th>
                    <th class="screens-admin-hostingManagement__content-table__status-approve">숙소 승인
                        상태
                    </th>
                </tr>
                <c:forEach var="room" items="${roomList}">
                    <tr>
                        <td><input type="checkbox"
                                   value="${room.room_id}"
                                   class="screens-admin-hostingManagement__content-table__check">
                        </td>
                        <td> ${room.room_name} </td>
                        <td> ${room.room_total_desc} </td>
                        <td> ${room.room_space_desc} </td>
                        <td> ${room.room_etc_desc} </td>
                        <td> ${room.room_weekday_price} </td>
                        <td> ${room.room_weekend_price} </td>
                        <td> ${room.room_extra_person_fee} </td>
                        <td> ${room.created_at} </td>
                        <td> ${room.status_id} </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br>
    </div>
</div>

<script src="../../../resources/js/admin/hostingManagement.js"></script>

</body>
</html>
