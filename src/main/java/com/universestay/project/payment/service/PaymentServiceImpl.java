package com.universestay.project.payment.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.payment.dao.PaymentDao;
import com.universestay.project.payment.dto.PaymentDto;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {

    private PaymentDao paymentDao;

    @Autowired
    public PaymentServiceImpl(PaymentDao paymentDao) {
        this.paymentDao = paymentDao;
    }

    @Override
    public Map<String, Object> findPaymentUser(String booking_id) throws CommonException {
        return paymentDao.findPaymentUser(booking_id);
    }

    @Override
    public Map<String, Object> findOrderById(String booking_id) throws CommonException {
        return paymentDao.findOrderById(booking_id);
    }

    @Override
    public int insertPaymentInfo(PaymentDto paymentDto) throws CommonException {
        return paymentDao.insertPaymentInfo(paymentDto);
    }


    @Override
    public int updateOrderById(String paymentId) throws CommonException {
        return paymentDao.updateOrderById(paymentId);
    }

    @Override
    public Map<String, Object> findBookingById(String bookingId) throws CommonException {
        return paymentDao.findBookingById(bookingId);
    }

    @Override
    public Map<String, Object> findPaymentById(String payment_merchant_uid) throws CommonException {
        return paymentDao.findPaymentById(payment_merchant_uid);
    }

    @Override
    public Integer updatePaymentById(Object paymentId) throws CommonException {
        return paymentDao.updatePaymentById(paymentId);
    }

    @Override
    public Integer updatePaymentStatusByBookingId(String bookingId) throws CommonException {
        return paymentDao.updatePaymentStatusByBookingId(bookingId);
    }
}
