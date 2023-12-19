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
                    console.log(rsp);
                    if (rsp.success) {
                        console.log(rsp);
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
            dataType: "json",
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
                    custom_data: {
                        booking_id: bookingId
                    }
                }, function (rsp) {
                    console.log(rsp);
                    // 결제 성공 시
                    if (rsp.success) {
                        const paymentDto = {
                            booking_id: rsp.custom_data.booking_id,
                            payment_is_success: rsp.success,
                            payment_apply_num: rsp.apply_num,
                            payment_buyer_name: rsp.buyer_name,
                            payment_buyer_addr: rsp.buyer_addr,
                            payment_buyer_email: rsp.buyer_email,
                            payment_buyer_postcode: rsp.buyer_postcode,
                            payment_buyer_tel: rsp.buyer_tel,
                            payment_imp_uid: rsp.imp_uid,
                            payment_merchant_uid: rsp.merchant_uid,
                            payment_name: rsp.name,
                            payment_paid_amount: rsp.paid_amount,
                            payment_paid_at: rsp.paid_at,
                            payment_pay_method: rsp.pay_method,
                            payment_pg_provider: rsp.pg_provider,
                            payment_pg_tid: rsp.pg_tid,
                            payment_pg_type: rsp.pg_type,
                            payment_receipt_url: rsp.receipt_url,
                            payment_status: rsp.status,
                            payment_currency: rsp.currency,
                            payment_card_name: rsp.card_name,
                            payment_bank_name: rsp.bank_name,
                            payment_card_quota: rsp.card_quota,
                            payment_card_number: rsp.card_number
                        }

                        console.log(paymentDto);
                        let payment_id = "";
                        $.ajax({
                            url: "/payment/saveResponse",
                            method: "post",
                            contentType: "application/json",
                            data: JSON.stringify(paymentDto),
                            success: function (res) {
                                payment_id = res;

                            }, error: function (res) {
                                console.log(res);
                            }
                        })

                        const imp_uid = rsp.imp_uid;
                        const merchant_uid = rsp.merchant_uid;
                        // 엑세스 토큰(access token) 발급 받기
                        $.ajax({
                            url: "/payment/getAccessToken",
                            method: "post",
                            dataType: "json",
                            success: function (res) {
                                const access_token = res.response.access_token;
                                console.log(rsp.custom_data.booking_id);

                                // imp_uid로 포트원 서버에서 결제 정보 조회
                                // 결제 검증
                                $.ajax({
                                    url: "/payment/lookUpImpUid",
                                    method: "post",
                                    data: {
                                        imp_uid: imp_uid,
                                        Authorization: access_token,
                                        booking_id: rsp.custom_data.booking_id,
                                        payment_id: payment_id
                                    },
                                    success: function (res) {
                                        console.log(res);
                                    },
                                    error: function (res) {
                                        console.log(res);
                                    },
                                });
                            },
                        })

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