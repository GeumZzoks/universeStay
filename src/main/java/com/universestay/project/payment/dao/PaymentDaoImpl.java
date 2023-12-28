package com.universestay.project.payment.dao;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.payment.dto.PaymentDto;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImpl implements PaymentDao {

    private SqlSession session;
    private String namespace = "com.universestay.project.resources.mybatis.mapper.payment.paymentMapper.";

    @Autowired
    public PaymentDaoImpl(SqlSession session) {
        this.session = session;
    }


    @Override
    public Map<String, Object> findPaymentUser(String booking_id) throws CommonException {
        return session.selectOne(namespace + "findPaymentUser", booking_id);
    }

    @Override
    public Map<String, Object> findOrderById(String booking_id) throws CommonException {
        return session.selectOne(namespace + "findOrderById", booking_id);
    }

    @Override
    public int insertPaymentInfo(PaymentDto paymentDto) throws CommonException {
        return session.insert(namespace + "insertPaymentInfo", paymentDto);
    }

    @Override
    public int updateOrderById(String paymentId) throws CommonException {
        return session.update(namespace + "updateOrderById", paymentId);
    }

    @Override
    public Map<String, Object> findBookingById(String bookingId) throws CommonException {
        return session.selectOne(namespace + "findBookingById", bookingId);
    }

    @Override
    public Map<String, Object> findPaymentById(String payment_merchant_uid) throws CommonException {
        return session.selectOne(namespace + "findPaymentById", payment_merchant_uid);
    }

    @Override
    public Integer updatePaymentById(Object paymentId) throws CommonException {
        return session.update(namespace + "updatePaymentById", paymentId);
    }

    @Override
    public Integer updatePaymentStatusByBookingId(String bookingId) throws CommonException {
        return session.update(namespace + "updatePaymentStatusByBookingId", bookingId);
    }
}
