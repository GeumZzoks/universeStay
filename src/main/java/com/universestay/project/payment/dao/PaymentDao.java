package com.universestay.project.payment.dao;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.payment.dto.PaymentDto;
import java.util.Map;

public interface PaymentDao {

    Map<String, Object> findPaymentUser(String booking_id) throws CommonException;

    int insertPaymentInfo(PaymentDto paymentDto) throws CommonException;

}