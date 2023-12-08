package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.InquiryDto;
import com.universestay.project.admin.dto.ReplyDto;
import com.universestay.project.common.SearchCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class InquiryDaoImplTest {

    @Autowired
    InquiryDao inquiryDao;

    @Test
    public void countInquiry() throws Exception {
        int result = inquiryDao.countInquiry();
        System.out.println("result = " + result);
        assertTrue(result >= 0);
    }

    @Test
    public void selectInquiry() throws Exception {
        InquiryDto dto = null;
        System.out.println("Before dto = " + dto);
        dto = inquiryDao.selectInquiry(1);
        System.out.println("After dto = " + dto);
        assertTrue(dto != null);
    }

    @Test
    public void insertInquiry() throws Exception {
//        InquiryDto dto = new InquiryDto();
//        System.out.println("Before dto = " + dto);
//        dto.setUser_id("00387727-709f-40f7-b414-d8f0384df164");
//        dto.setInquiry_title("titlezzz");
//        dto.setInquiry_ctt("contentzzz");
//        dto.setInquiry_is_open("N");
//        dto.setCreated_id("00387727-709f-40f7-b414-d8f0384df164");
//        System.out.println("After dto = " + dto);
//        int result = inquiryDao.insertInquiry(dto);
//        assertTrue(result == 1);
        for (int i = 26; i < 32; i++) {
            InquiryDto dto = new InquiryDto();
            dto.setUser_id("0ca24692-89ea-11ee-b9d1-0242ac125004");
            dto.setInquiry_title("title-" + i);
            dto.setInquiry_ctt("content-" + i);
            dto.setInquiry_is_open("N");
            dto.setCreated_id("0ca24692-89ea-11ee-b9d1-0242ac125004");
            int result = inquiryDao.insertInquiry(dto);
            assertTrue(result == 1);
        }
    }

    @Test
    public void updateInquiry() throws Exception {
        InquiryDto dto = null;
        dto = inquiryDao.selectInquiry(10);
        dto.setInquiry_title("zzz");
        dto.setInquiry_ctt("xxx");
        dto.setInquiry_is_open("Y");
        dto.setInquiry_is_answered("Y");
        dto.setUpdated_id(dto.getUser_id());
        int result = inquiryDao.updateInquiry(dto);
        assertTrue(result == 1);
    }

    @Test
    public void deleteInquiry() throws Exception {
        int result = inquiryDao.deleteInquiry(11);
        assertTrue(result == 1);
    }

    @Test
    public void countSearchResult() throws Exception {
        SearchCondition sc = new SearchCondition(1, 10, "user_id", "00387727-709f-40f7-b414-d8f0384df164");
        int count = inquiryDao.countSearchResult(sc);
        System.out.println("count = " + count);
        assertTrue(count >= 0);
    }

    @Test
    public void selectPage() throws Exception {
        SearchCondition sc = new SearchCondition(1, 10);
        List<InquiryDto> list = null;
        System.out.println("Before list = " + list);
        list = inquiryDao.selectPage(sc);
        System.out.println("After list = ");
        for (InquiryDto dto : list) {
            System.out.println("dto = " + dto);
        }
        assertTrue(list != null);
    }

    @Test
    public void selectSearchResultPage() throws Exception {
        SearchCondition sc = new SearchCondition(1, 10, "user_id", "00387727-709f-40f7-b414-d8f0384df164");
        List<InquiryDto> list = null;
        System.out.println("Before list = " + list);
        list = inquiryDao.selectSearchResultPage(sc);
        System.out.println("After list = ");
        for (InquiryDto dto : list) {
            System.out.println("dto = " + dto);
        }
        assertTrue(list != null);

    }

    @Test
    public void updateInquiryHits() throws Exception {
        int result = inquiryDao.updateInquiryHits(1);
        assertTrue(result == 1);
    }

    @Test
    public void selectReply() throws Exception {
        ReplyDto dto = inquiryDao.selectReply(1);
        System.out.println("dto = " + dto);
        assertTrue(dto != null);
    }

    @Test
    public void selectReplys() throws Exception {
        List<ReplyDto> list = inquiryDao.selectReplys(1);
        System.out.println("===================================");
        for(ReplyDto dto : list){
            System.out.println("dto = " + dto);
        }
        assertTrue(list != null);
    }

    @Test
    public void insertReply() throws Exception {
        for (int i = 37; i < 45; i++) {
            ReplyDto dto = new ReplyDto();
            dto.setInquiry_id(3);
            dto.setReply_writer_id("0093d47c-12a8-46bc-b254-717081ae7a0d");
            dto.setReply_ctt("zzzzzzzzzzzzz" + i);
            dto.setCreated_id("0093d47c-12a8-46bc-b254-717081ae7a0d");
            int result = inquiryDao.insertReply(dto);
            assertTrue(result == 1);
        }
    }

    @Test
    public void updateReply() throws Exception {
        ReplyDto dto = inquiryDao.selectReply(2);
        dto.setReply_ctt("QQQQQQQQQQQ");
        int result = inquiryDao.updateReply(dto);
        assertTrue(result == 1);
    }

    @Test
    public void deleteReply() throws Exception {
        int result = inquiryDao.deleteReply(2);
        assertTrue(result == 1);
    }
}