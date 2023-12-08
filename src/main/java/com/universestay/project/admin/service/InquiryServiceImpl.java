package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.InquiryDao;
import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.ReplyDto;
import com.universestay.project.common.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InquiryServiceImpl implements InquiryService{

    @Autowired
    InquiryDao inquiryDao;

    @Override
    public int getCount() throws Exception {
        return inquiryDao.countInquiry();
    }

    @Override
    public InquiryDto readInquiry(int inquiry_id) throws Exception {
        return inquiryDao.selectInquiry(inquiry_id);
    }

    @Override
    public List<InquiryDto> getPage(SearchCondition sc) throws Exception {
        return inquiryDao.selectPage(sc);
    }

    @Override
    public int writeInquiry(InquiryDto dto) throws Exception {
        return inquiryDao.insertInquiry(dto);
    }

    @Override
    public int modifyInquiry(InquiryDto dto) throws Exception {
        return inquiryDao.updateInquiry(dto);
    }

    @Override
    public int removeInquiry(int inquiry_id) throws Exception {
        return inquiryDao.deleteInquiry(inquiry_id);
    }

    @Override
    public int increaseInquiryHit(int inquiry_id) throws Exception {
        return inquiryDao.updateInquiryHits(inquiry_id);
    }

    @Override
    public int getSearchResultCount(SearchCondition sc) throws Exception {
        return inquiryDao.countSearchResult(sc);
    }

    @Override
    public ReplyDto readReply(int reply_id) throws Exception {
        return inquiryDao.selectReply(reply_id);
    }

    @Override
    public List<ReplyDto> readReplys(int inquiry_id) throws Exception {
        return inquiryDao.selectReplys(inquiry_id);
    }

    @Override
    public int writeReply(ReplyDto dto) throws Exception {
        return inquiryDao.insertReply(dto);
    }

    @Override
    public int modifyReply(ReplyDto dto) throws Exception {
        return inquiryDao.updateReply(dto);
    }

    @Override
    public int removeReply(int reply_id) throws Exception {
        return inquiryDao.deleteReply(reply_id);
    }
}
