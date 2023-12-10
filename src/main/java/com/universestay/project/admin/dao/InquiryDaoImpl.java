package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.ReplyDto;
import com.universestay.project.common.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class InquiryDaoImpl implements InquiryDao{

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.admin.dao.inquiryMapper.";

//////    about Inquiry table
    @Override
    public int countInquiry() throws Exception {
        return session.selectOne(namespace + "countInquiry");
    }

    @Override
    public InquiryDto selectInquiry(int inquiry_id) throws Exception {
        return session.selectOne(namespace + "selectInquiry", inquiry_id);
    }

    @Override
    public int insertInquiry(InquiryDto dto) throws Exception {
        return session.insert(namespace + "insertInquiry", dto);
    }

    @Override
    public int updateInquiry(InquiryDto dto) throws Exception {
        return session.update(namespace + "updateInquiry", dto);
    }

    @Override
    public int deleteInquiry(Integer inquiry_id) throws Exception {
        return session.delete(namespace + "deleteInquiry", inquiry_id);
    }

    @Override
    public int countSearchResult(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "countSearchResult", sc);
    }

    @Override
    public List<InquiryDto> selectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "selectPage", sc);
    }

    @Override
    public List<InquiryDto> selectSearchResultPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "selectSearchResultPage", sc);
    }

    @Override
    public int updateInquiryHits(int inquiry_id) throws Exception {
        return session.update(namespace + "updateInquiryHits", inquiry_id);
    }

//////    about Reply table

    @Override
    public ReplyDto selectReply(Integer reply_id) throws Exception {
        return session.selectOne(namespace + "selectReply", reply_id);
    }

    @Override
    public List<ReplyDto> selectReplys(Integer inquiry_id) throws Exception {
        return session.selectList(namespace + "selectReplys", inquiry_id);
    }

    @Override
    public int insertReply(ReplyDto dto) throws Exception {
        return session.insert(namespace + "insertReply", dto);
    }

    @Override
    public int updateReply(ReplyDto dto) throws Exception {
        return session.update(namespace + "updateReply", dto);
    }

    @Override
    public int deleteReply(Integer reply_id) throws Exception {
        return session.delete(namespace + "deleteReply", reply_id);
    }
}