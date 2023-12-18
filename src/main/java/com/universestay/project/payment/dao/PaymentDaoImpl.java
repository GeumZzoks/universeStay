package com.universestay.project.payment.dao;

import com.universestay.project.common.exception.CommonException;
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
}
