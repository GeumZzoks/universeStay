<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 12/17/23
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>결제창</title>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>

        // let IMP = window.IMP;
        IMP.init("imp55505214");

        function requestPay() {
            IMP.request_pay({
                pg: "TC0ONETIME",
                pay_method: "card",
                merchant_uid: `${crypto.randomUUID()}`,   // 주문번호는 결제창 요청 시 항상 고유 값으로 채번 되어야 합니다.
                name: "노르웨이 회전 의자",
                amount: 64900,                         // 숫자 타입
                buyer_email: "gildong@gmail.com",
                buyer_name: "홍길동",
                buyer_tel: "010-4242-4242",
                buyer_addr: "서울특별시 강남구 신사동",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
                //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                if (rsp.success) {
                    
                } else {
                    alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                }
            });
        }

    </script>
</head>
<body>
<button onclick="requestPay()">결제하기</button>

</body>
</html>
