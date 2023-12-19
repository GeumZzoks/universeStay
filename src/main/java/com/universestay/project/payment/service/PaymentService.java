package com.universestay.project.payment.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.payment.dto.PaymentDto;
import java.util.Map;

public interface PaymentService {

    Map<String, Object> findPaymentUser(String booking_id) throws CommonException;

    int insertPaymentInfo(PaymentDto paymentDto) throws CommonException;
}
