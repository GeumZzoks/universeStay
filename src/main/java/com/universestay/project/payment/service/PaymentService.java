package com.universestay.project.payment.service;

import com.universestay.project.common.exception.CommonException;
import java.util.Map;

public interface PaymentService {

    Map<String, Object> findPaymentUser(String booking_id) throws CommonException;
}
