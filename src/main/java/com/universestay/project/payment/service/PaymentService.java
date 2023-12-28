package com.universestay.project.payment.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.payment.dto.PaymentDto;
import java.util.Map;

public interface PaymentService {

    Map<String, Object> findPaymentUser(String booking_id) throws CommonException;

    Map<String, Object> findOrderById(String booking_id) throws CommonException;

    int insertPaymentInfo(PaymentDto paymentDto) throws CommonException;

    int updateOrderById(String paymentId) throws CommonException;

    Map<String, Object> findBookingById(String bookingId) throws CommonException;

    Map<String, Object> findPaymentById(String payment_merchant_uid) throws CommonException;

    Integer updatePaymentById(Object paymentId) throws CommonException;

    Integer updatePaymentStatusByBookingId(String bookingId) throws CommonException;
}
