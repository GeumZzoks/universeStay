<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/12/06
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
    <title>쿠폰</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<div class="screens-admin-coupon__container">
    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-coupon__content">
        <h3 style="color:indianred; margin-top: 20px; font-weight: 600;">쿠폰</h3>
        <div class="screens-admin-coupon__content-input">
            <h2 style="position: absolute; top: 34px; left: calc(40% - 80px); color:indianred; font-weight: 600;">
                쿠폰생성</h2>
            <form action="/admin/coupon/input" method="POST">
                <div class="screens-admin-coupon__content-input-div">
                    <h3>이벤트 번호</h3>
                    <input type="number" name="event_id" placeholder="미진행시 공백">
                    <h3>쿠폰이름</h3>
                    <input type="text" name="coupon_name" placeholder="쿠폰 이름을 입력해주세요.">
                    <h3>쿠폰설명</h3>
                    <textarea name="coupon_desc" rows="3" placeholder="쿠폰 설명을 입력해주세요."></textarea>
                </div>
                <div class="screens-admin-coupon__content-input-div" style="left: 350px;">
                    <h3>발행사유</h3>
                    <textarea name="coupon_usage" rows="3" placeholder="발행 사유를 입력해주세요."></textarea>
                    <h3>사용가능일수</h3>
                    <input type="number" name="coupon_usable_day" placeholder="일">
                    <h3 style="position: absolute; top: 78px; right: 60px;">프로모션 진행 여부</h3>
                    <select name="coupon_is_activated" style="position: absolute; top: 113px; right: 98px">
                        <option value="N">발급중지</option>
                        <option value="Y">발급가능</option>
                    </select>
                </div>
                <div class="screens-admin-coupon__content-input-div" style="left: 670px;">
                    <h3>쿠폰타입</h3>
                    <select name="coupon_type" id="select_type" onchange="selectType()">
                        <option value="정액할인">정액할인</option>
                        <option value="정률할인">정률할인</option>
                    </select>
                    <h3>혜택(원/%)</h3>
                    <input type="number" name="coupon_discount_amount" id="inputType" placeholder="원 or %">
                    <h3>사용제한금액</h3>
                    <input type="number" name="coupon_discount_limit" placeholder="최소 or 최대금액">
                </div>
                <button type="submit" id="screens-admin-coupon__content-input-div__submit">등록</button>
            </form>
        </div>

        <div class="screens-admin-coupon__content-search">
            <h2 style="position: absolute; top: -24px; left: calc(50% - 30px); color:indianred; font-weight: 600;">
                쿠폰검색</h2>
            <form action="/admin/coupon">
                <h3>쿠폰타입</h3>
                <select name="type">
                    <option value="">--</option>
                    <option value="price" ${ph.sc.type=='price' ? "selected" : ""}>정액할인</option>
                    <option value="percent" ${ph.sc.type=='percent' ? "selected" : ""}>정률할인</option>
                </select>
                <h3>쿠폰상태</h3>
                <select name="option">
                    <option value="">--</option>
                    <option value="Y" ${ph.sc.option=='Y' ? "selected" : ""}>발급가능</option>
                    <option value="N" ${ph.sc.option=='N' ? "selected" : ""}>발급중지</option>
                </select>
                <h3>쿠폰이름</h3>
                <input type="text" name="keyword" value="${ph.sc.keyword}" placeholder="이름으로 검색">
                <button type="submit">검색</button>
            </form>
        </div>

        <table class="screens-admin-coupon__content-table">
            <tr>
                <th class="screens-admin-coupon__content-table__check"><input type="checkbox" onclick="checkAll(this)">
                </th>
                <th class="screens-admin-coupon__content-table__no">쿠폰번호</th>
                <th class="screens-admin-coupon__content-table__created_date">생성일</th>
                <th class="screens-admin-coupon__content-table__name">쿠폰이름</th>
                <th class="screens-admin-coupon__content-table__desc">쿠폰설명</th>
                <th class="screens-admin-coupon__content-table__usage">발행사유</th>
                <th class="screens-admin-coupon__content-table__usable_day">유효기간</th>
                <th class="screens-admin-coupon__content-table__type">쿠폰타입</th>
                <th class="screens-admin-coupon__content-table__discount">혜택</th>
                <th class="screens-admin-coupon__content-table__status">상태</th>
            </tr>

            <c:forEach var="couponDto" items="${list}">
                <tr>
                    <td class="screens-admin-coupon__content-table__check"><input type="checkbox" name="check"
                                                                                  value="${couponDto.coupon_id}"></td>
                    <td class="screens-admin-coupon__content-table__no">${couponDto.coupon_id}</td>
                    <td class="screens-admin-coupon__content-table__created_date">${couponDto.coupon_created_date}</td>
                    <td class="screens-admin-coupon__content-table__name">${couponDto.coupon_name}</td>
                    <td class="screens-admin-coupon__content-table__desc">${couponDto.coupon_desc}</td>
                    <td class="screens-admin-coupon__content-table__usage">${couponDto.coupon_usage}</td>
                    <td class="screens-admin-coupon__content-table__usable_day">${couponDto.coupon_usable_day}일</td>
                    <td class="screens-admin-coupon__content-table__type">${couponDto.coupon_type}</td>
                    <c:choose>
                        <c:when test="${couponDto.coupon_type eq '정액할인'}">
                            <td class="screens-admin-coupon__content-table__discount">
                                <fmt:formatNumber type="number" maxFractionDigits="3"
                                                  value="${couponDto.coupon_discount_amount}"/>원<br>
                                (최소 <fmt:formatNumber type="number" maxFractionDigits="3"
                                                      value="${couponDto.coupon_discount_limit}"/>원)
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td class="screens-admin-coupon__content-table__discount">
                                <fmt:formatNumber type="number" maxFractionDigits="3"
                                                  value="${couponDto.coupon_discount_rate}"/>%<br>
                                (최소 <fmt:formatNumber type="number" maxFractionDigits="3"
                                                      value="${couponDto.coupon_discount_limit}"/>원)
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${couponDto.coupon_is_activated eq 'Y'}">
                            <td class="screens-admin-coupon__content-table__status">발급가능</td>
                        </c:when>
                        <c:otherwise>
                            <td class="screens-admin-coupon__content-table__status" style="color: red">발급중지</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
        <div class="screens-admin-coupon__content-btn__bottom">
            <button onclick="update()">수정</button>
            <button onclick="Delete()">삭제</button>
            <button onclick="Issue()">발급</button>
            <button onclick="StopIssue()">중지</button>
        </div>
        <div class="screens-admin-coupon__paging-container">
            <div class="screens-admin-coupon__paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div style="margin-top: -110px;">검색 결과가 없습니다.</div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="screens-admin-coupon__page"
                           href="<c:url value="/admin/coupon${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="screens-admin-coupon__page ${i==ph.sc.page? "paging-active" : ""}"
                           href="<c:url value="/admin/coupon${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="screens-admin-coupon__page"
                           href="<c:url value="/admin/coupon${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    // 컨트롤러 동작 성공 or 에러 발생시 alert 메세지
    let msg = "${msg}";
    if (msg == "IPT_OK") alert("쿠폰이 생성되었습니다.");
    if (msg == "IPT_ERR") alert("쿠폰 생성에 실패하였습니다. 입력한 내용을 확인해주세요.");
    if (msg == "DEL_OK") alert("쿠폰이 성공적으로 삭제되었습니다.");
    if (msg == "DEL_ERR") alert("쿠폰 삭제에 실패하였습니다. 다시 시도해주세요.");
    if (msg == "ISU_OK") alert("선택한 쿠폰이 발급되었습니다.");
    if (msg == "ISU_ERR") alert("쿠폰 발급에 실패하였습니다. 다시 시도해주세요.");
    if (msg == "STISU_OK") alert("선택한 쿠폰 발급이 중단되었습니다.");
    if (msg == "STISU_ERR") alert("쿠폰 발급 중단에 실패하였습니다. 다시 시도해주세요.");

    // 선택한 타입에 따라 입력될 컬럼 변경
    function selectType() {
        let type = document.getElementById("select_type");
        let inputType = document.getElementById("inputType");
        let selected_type = type.options[type.selectedIndex].value;

        if (selected_type === "정률할인") {
            inputType.setAttribute("name", "coupon_discount_rate")
        } else {
            inputType.setAttribute("name", "coupon_discount_amount");
        }
    }


    // 전체 체크 기능
    function checkAll(checkAll) {
        const checkboxes
            = document.querySelectorAll('input[type="checkbox"]');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = checkAll.checked
        })
    }

    function update() {
        const query = 'input[name="check"]:checked'
        const selectedElements = document.querySelectorAll(query)

        const selectedElementsCnt = selectedElements.length;

        if (selectedElementsCnt == 0) {
            alert("수정할 쿠폰을 선택해주세요.");
            return false;
        } else {
            alert("발급된 쿠폰은 수정할 수 없습니다.")
        }
    }

    // 체크된 항목 일괄 삭제 기능
    function Delete() {
        //체크박스 체크된 항목
        const query = 'input[name="check"]:checked'
        const selectedElements = document.querySelectorAll(query)

        //체크박스 체크된 항목의 개수
        const selectedElementsCnt = selectedElements.length;

        if (selectedElementsCnt == 0) {
            alert("삭제할 항목을 선택해주세요.");
            return false;
        } else {
            if (confirm("정말로 삭제하시겠습니까?")) {
                // 배열생성
                const arr = new Array(selectedElementsCnt);
                // 체크된 각 항목마다 value 지정
                document.querySelectorAll('input[name="check"]:checked').forEach(function (v, i) {
                    arr[i] = v.value;
                });
                // form 데이터 생성
                const form = document.createElement('form'); // form 생성
                form.setAttribute('method', 'post'); // 메서드 지정
                form.setAttribute('action', '/admin/coupon/delete'); // form action url

                var input1 = document.createElement('input');
                input1.setAttribute("type", "hidden");
                input1.setAttribute("name", "coupon_id");
                input1.setAttribute("value", arr);
                form.appendChild(input1);
                console.log(form);
                document.body.appendChild(form);
                form.submit();
            }
        }
    }

    // 체크된 항목 일괄 발급 기능
    function Issue() {
        const query = 'input[name="check"]:checked'
        const selectedElements = document.querySelectorAll(query)

        const selectedElementsCnt = selectedElements.length;

        if (selectedElementsCnt == 0) {
            alert("발급할 쿠폰을 선택해주세요.");
            return false;
        } else {
            if (confirm("선택한 쿠폰을 발급하시겠습니까?")) {
                const arr = new Array(selectedElementsCnt);

                document.querySelectorAll('input[name="check"]:checked').forEach(function (v, i) {
                    arr[i] = v.value;
                });

                const form = document.createElement('form');
                form.setAttribute('method', 'post');
                form.setAttribute('action', '/admin/coupon/issue');

                var input1 = document.createElement('input');
                input1.setAttribute("type", "hidden");
                input1.setAttribute("name", "coupon_id");
                input1.setAttribute("value", arr);
                form.appendChild(input1);
                console.log(form);
                document.body.appendChild(form);
                form.submit();
            }
        }
    }

    // 체크된 항목 일괄 발급중지 기능
    function StopIssue() {
        const query = 'input[name="check"]:checked'
        const selectedElements = document.querySelectorAll(query)

        const selectedElementsCnt = selectedElements.length;

        if (selectedElementsCnt == 0) {
            alert("발급을 중단할 쿠폰을 선택해주세요.");
            return false;
        } else {
            if (confirm("선택한 쿠폰의 발급을 중단하시겠습니까?")) {
                const arr = new Array(selectedElementsCnt);

                document.querySelectorAll('input[name="check"]:checked').forEach(function (v, i) {
                    arr[i] = v.value;
                });

                const form = document.createElement('form');
                form.setAttribute('method', 'post');
                form.setAttribute('action', '/admin/coupon/stopIssue');

                var input1 = document.createElement('input');
                input1.setAttribute("type", "hidden");
                input1.setAttribute("name", "coupon_id");
                input1.setAttribute("value", arr);
                form.appendChild(input1);
                console.log(form);
                document.body.appendChild(form);
                form.submit();
            }
        }
    }
</script>
</body>
</html>
