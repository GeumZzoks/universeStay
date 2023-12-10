package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.ReplyDto;
import com.universestay.project.common.SearchCondition;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InquiryDao {

//////    about Inquiry table
    int countInquiry() throws Exception;

    InquiryDto selectInquiry(int inquiry_id) throws Exception;

    int insertInquiry(InquiryDto dto) throws Exception;

    int updateInquiry(InquiryDto dto) throws Exception;

    int deleteInquiry(Integer inquiry_id) throws Exception;

    int countSearchResult(SearchCondition sc) throws Exception;

    List<InquiryDto> selectPage(SearchCondition sc) throws Exception;

    List<InquiryDto> selectSearchResultPage(SearchCondition sc) throws Exception;

    int updateInquiryHits(int inquiry_id) throws Exception;

//////    about Reply table
    ReplyDto selectReply(Integer reply_id) throws Exception;

    List<ReplyDto> selectReplys(Integer inquiry_id) throws Exception;

    int insertReply(ReplyDto dto) throws Exception;

    int updateReply(ReplyDto dto) throws Exception;

    int deleteReply(Integer reply_id) throws Exception;
}