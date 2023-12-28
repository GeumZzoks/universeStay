IMP.init("imp55505214");

// 카드 결제
const cardPaymentButtons = document.querySelectorAll(
        ".screens-room-myBookings__payment-button-card");

const bookingIdArray = document.querySelectorAll(
        ".screens-room-myBookings__hiddenValue");

for (let i = 0; i < cardPaymentButtons.length; i++) {
    cardPaymentButtons[i].addEventListener("click", function (ev) {
        const bookingId = bookingIdArray[i].dataset.value;

        // 초기 필요한 데이터 가져오기
        $.ajax({
            url: "/payment/getPaymentInfo",
            method: "post",
            dataType: "json",
            data: {bookingId: bookingId},
            success: function (res) {
                const randomUUID = generateUUID();

                IMP.request_pay({
                    pg: "kcp",
                    pay_method: "card",
                    merchant_uid: randomUUID,   // 주문번호는 결제창 요청 시 항상 고유 값으로 채번 되어야 합니다.
                    name: res.room_name,
                    amount: res.booking_total_pay_amount,                         // 숫자 타입
                    buyer_email: res.user_email,
                    buyer_name: res.user_name,
                    buyer_tel: res.user_phone_num1,
                    custom_data: {
                        booking_id: bookingId
                    }
                }, function (rsp) {
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

                        let payment_id = "";
                        $.ajax({
                            url: "/payment/saveResponse",
                            method: "post",
                            contentType: "application/json",
                            data: JSON.stringify(paymentDto),
                            success: function (res) {
                                payment_id = res;

                                const imp_uid = rsp.imp_uid;
                                const merchant_uid = rsp.merchant_uid;
                                // 엑세스 토큰(access token) 발급 받기
                                $.ajax({
                                    url: "/payment/getAccessToken",
                                    method: "post",
                                    dataType: "json",
                                    success: function (res) {
                                        const access_token = res.response.access_token;

                                        // 결제 검증, imp_uid로 포트원 서버에서 결제 정보 조회
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
                                                alert("결제가 정상 처리되었습니다.");
                                                window.location.reload(true);
                                            },
                                            error: function (res) {
                                                alert(res);
                                            },
                                        });
                                    },
                                })

                            }, error: function (res) {
                                console.log(res);
                            }
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

// 카카오페이 결제
const kakaoPaymentButtons = document.querySelectorAll(
        ".screens-room-myBookings__payment-button-kakao");

for (let i = 0; i < kakaoPaymentButtons.length; i++) {
    kakaoPaymentButtons[i].addEventListener("click", function (ev) {
        const bookingId = bookingIdArray[i].dataset.value;

        // 초기 필요한 데이터 가져오기
        $.ajax({
            url: "/payment/getPaymentInfo",
            method: "post",
            dataType: "json",
            data: {bookingId: bookingId},
            success: function (res) {
                const randomUUID = generateUUID();

                IMP.request_pay({
                    pg: "kakaopay",
                    pay_method: "kakaopay",
                    merchant_uid: randomUUID,   // 주문번호는 결제창 요청 시 항상 고유 값으로 채번 되어야 합니다.
                    name: res.room_name,
                    amount: res.booking_total_pay_amount,                         // 숫자 타입
                    buyer_email: res.user_email,
                    buyer_name: res.user_name,
                    buyer_tel: res.user_phone_num1,
                    custom_data: {
                        booking_id: bookingId
                    }
                }, function (rsp) {

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

                        let payment_id = "";
                        $.ajax({
                            url: "/payment/saveResponse",
                            method: "post",
                            contentType: "application/json",
                            data: JSON.stringify(paymentDto),
                            success: function (res) {
                                payment_id = res;

                                const imp_uid = rsp.imp_uid;
                                const merchant_uid = rsp.merchant_uid;
                                // 엑세스 토큰(access token) 발급 받기
                                $.ajax({
                                    url: "/payment/getAccessToken",
                                    method: "post",
                                    dataType: "json",
                                    success: function (res) {
                                        const access_token = res.response.access_token;

                                        // 결제 검증, imp_uid로 포트원 서버에서 결제 정보 조회
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
                                                alert("결제가 정상 처리되었습니다.");
                                                window.location.reload(true);
                                            },
                                            error: function (res) {
                                                alert(res);
                                            },
                                        });
                                    },
                                })

                            }, error: function (res) {
                                console.log(res);
                            }
                        })

                    } else {
                        alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
                    }
                });

            },
            error: function (res) {
                console.log(res);
                alert("상품 데이터를 불러오는데 실패하였습니다.");
            },
        });

    });
}

/* TODO: 밖에 화면 누르면 꺼지게 하기 */
// document.body.addEventListener('click', function (event) {
//     console.log(event);
// });

const refundButtons = document.querySelectorAll(
        ".screens-room-myBookings__refund-button");

for (let i = 0; i < bookingIdArray.length; i++) {
    const bookingId = bookingIdArray[i].dataset.value;

    refundButtons[i].addEventListener("click", function () {
        if (confirm("결제를 취소하시겠습니까?"))
                // 초기 필요한 데이터 가져오기
        {
            $.ajax({
                url: "/payment/getBookingInfo",
                method: "post",
                dataType: "json",
                data: {bookingId: bookingId},
                success: function (res) {
                    console.log(res);
                    // 결제 취소 환불 API
                    $.ajax({
                        // 예: http://www.myservice.com/payments/cancel
                        url: "/payment/refundPay",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({
                            merchant_uid: res.payment_merchant_uid, // 예: ORD20180131-0000011
                            cancel_request_amount: res.payment_paid_amount, // 환불금
                            reason: "테스트 결제 환불" // 환불사유
                        }),
                        success: function (res) {
                            alert("결제 취소 처리되었습니다.");
                            window.location.reload(true);
                        }

                    });
                }
            });
        }
    });
}

const cancelButtons = document.querySelectorAll(
        ".screens-room-myBookings__cancel-button");

for (let i = 0; i < cancelButtons.length; i++) {
    const bookingId = bookingIdArray[i].dataset.value;

    cancelButtons[i].addEventListener("click", function () {
        if (confirm("예약을 취소하시겠습니까?"))
                // 초기 필요한 데이터 가져오기
        {
            $.ajax({
                url: "/payment/canclePay",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    bookingId
                }),
                success: function (res) {
                    alert("예약 취소 처리되었습니다.");
                    window.location.reload(true);
                }

            });
        }
    });
}

/**
 * UUID 만드는 함수
 * @returns {string}
 */
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
            function (c) {
                var r = Math.random() * 16 | 0,
                        v = c === 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
}