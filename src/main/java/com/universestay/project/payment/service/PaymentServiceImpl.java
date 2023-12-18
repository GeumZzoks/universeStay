package com.universestay.project.payment.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.payment.dao.PaymentDao;
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
}
