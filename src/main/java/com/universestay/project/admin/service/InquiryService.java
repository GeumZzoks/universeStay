package com.universestay.project.admin.service;

import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.ReplyDto;
import com.universestay.project.common.SearchCondition;

import java.util.List;

public interface InquiryService {

//////    about Inquiry table

    int getCount() throws Exception;

    InquiryDto readInquiry(int inquiry_id) throws Exception;

    List<InquiryDto> getPage(SearchCondition sc) throws Exception;

    int writeInquiry(InquiryDto dto) throws Exception;

    int modifyInquiry(InquiryDto dto) throws Exception;

    int removeInquiry(int inquiry_id) throws Exception;

    int increaseInquiryHit(int inquiry_id) throws Exception;

//////    about Reply table

    int getSearchResultCount(SearchCondition sc) throws Exception;

    ReplyDto readReply(int reply_id) throws Exception;

    List<ReplyDto> readReplys(int inquiry_id) throws Exception;

    int writeReply(ReplyDto dto) throws Exception;

    int modifyReply(ReplyDto dto) throws Exception;

    int removeReply(int reply_id) throws Exception;



}
