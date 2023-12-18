IMP.init("imp55505214");

const cardPaymentButtons = document.querySelectorAll(
        ".screens-room-booking__payment-button-card");

const bookingIdArray = document.querySelectorAll(
        ".screens-room-booking__hiddenValue");

for (let i = 0; i < cardPaymentButtons.length; i++) {
    cardPaymentButtons[i].addEventListener("click", function (ev) {
        const bookingId = bookingIdArray[i].dataset.value;

        $.ajax({
            url: "/payment/getPaymentInfo",
            method: "post",
            data: {bookingId: bookingId},
            success: function (res) {
                console.log(res);
                IMP.request_pay({
                    pg: "kcp",
                    pay_method: "card",
                    merchant_uid: `${crypto.randomUUID()}`,   // 주문번호는 결제창 요청 시 항상 고유 값으로 채번 되어야 합니다.
                    name: res.room_name,
                    amount: res.room_weekend_price,                         // 숫자 타입
                    buyer_email: res.user_email,
                    buyer_name: res.user_name,
                    buyer_tel: res.user_phone_num1,
                    // buyer_addr: "서울특별시 강남구 신사동",
                    // buyer_postcode: "01181"
                }, function (rsp) { // callback
                    //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {

                    } else {
                        alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                    }
                });

            },
            error: function (res) {
                console.log(res);
            },
        });

    });
}

const kakaoPaymentButtons = document.querySelectorAll(
        ".screens-room-booking__payment-button-kakao");

for (let i = 0; i < kakaoPaymentButtons.length; i++) {
    kakaoPaymentButtons[i].addEventListener("click", function (ev) {
        const bookingId = bookingIdArray[i].dataset.value;

        $.ajax({
            url: "/payment/getPaymentInfo",
            method: "post",
            data: {bookingId: bookingId},
            success: function (res) {
                console.log(res);
                IMP.request_pay({
                    pg: "kakaopay",
                    pay_method: "kakaopay",
                    merchant_uid: `${crypto.randomUUID()}`,   // 주문번호는 결제창 요청 시 항상 고유 값으로 채번 되어야 합니다.
                    name: res.room_name,
                    amount: res.room_weekend_price,                         // 숫자 타입
                    buyer_email: res.user_email,
                    buyer_name: res.user_name,
                    buyer_tel: res.user_phone_num1,
                    // buyer_addr: "서울특별시 강남구 신사동",
                    // buyer_postcode: "01181"
                }, async function (rsp) { // callback
                    //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        console.log(rsp);

                        // const {} = rsp.imp_uid
                        // rsp.merchant_uid

                        $.ajax({
                            url: "/payment/getAccessToken",
                            method: "post",
                            success: function (res) {
                                console.log(res);
                            },
                            error: function (res) {
                                console.log(res);
                            },
                        })

                        // const getToken = $.ajax({
                        //     crossOrigin: true,
                        //     url: "https://api.iamport.kr/users/getToken",
                        //     method: "post", // POST method
                        //     headers: {"Content-Type": "application/json"},
                        //     data: {
                        //         imp_key: "5372858343674204", // REST API 키
                        //         imp_secret: "jc6Sxc1cbULMvRP40c7cnkPkj73i2VSJWzor9RpxLTSzjkbhnASK4d4Uf5gobqPDl4UIrdCdSiZUbBBm" // REST API Secret
                        //     }
                        // });

                        console.log(getToken);
                        const access_token = getToken.data;

                    } else {
                        alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                    }
                });

            },
            error: function (res) {
                console.log(res);
            },
        });

    });
}

function requestPay(e) {
    console.log(e);
    $.ajax({
        url: "payment/getPaymentInfo",
        method: "get",

    })

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