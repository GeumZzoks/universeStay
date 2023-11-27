package com.universestay.project.notice.service;

import com.universestay.project.notice.dto.NoticeDto;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceImplTest {

    @Autowired
    NoticeService noticeService;

    @Test
    public void getList() throws Exception {
        System.out.println(noticeService.getList());
    }

    @Test
    public void read() throws Exception {
        System.out.println(noticeService.read(18));
    }

    @Test
    public void remove() throws Exception {
        System.out.println(noticeService.remove(18));
    }

    @Test
    public void write() throws Exception {
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setAdmin_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setNotice_title("2023/11/25 토요일 - 서버 점검이 있습니다.");
        noticeDto.setNotice_ctt(
                "universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/23 목요일 23:50 ~ 24:00 까지 점검이 있을 예정입니다.");
        noticeDto.setCreated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setUpdated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        System.out.println("write COUNT = " + noticeService.write(noticeDto));
    }

    @Test
    public void modify() throws Exception {
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setNotice_id(19);
        noticeDto.setNotice_title("변경된 제목!!!");
        noticeDto.setNotice_ctt("변경된 내용!!!");
        noticeDto.setNotice_is_open("Y");
        noticeDto.setUpdated_id("8028bee4-6025-4c58-8c7f-839d7dc0d45t");
        System.out.println("modify COUNT = " + noticeService.modify(noticeDto));
    }

}