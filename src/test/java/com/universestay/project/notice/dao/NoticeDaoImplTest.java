package com.universestay.project.notice.dao;

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
public class NoticeDaoImplTest {

    @Autowired
    NoticeDao noticeDao;

    @Test
    public void selectAll() throws Exception {
        System.out.println(noticeDao.selectAll());
    }

    @Test
    public void select() throws Exception {
        System.out.println(noticeDao.select(14));
    }

    @Test
    public void delete() throws Exception {
        System.out.println("@@@@@@@DELETE COUNT = " + noticeDao.delete(14));
    }

    @Test
    public void insert() throws Exception {
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setAdmin_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setNotice_title("2023/11/25 토요일 - 서버 점검이 있습니다.");
        noticeDto.setNotice_ctt(
                "universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/23 목요일 23:50 ~ 24:00 까지 점검이 있을 예정입니다.");
        noticeDto.setCreated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setUpdated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        System.out.println("@@@@@@@INSERT COUNT = " + noticeDao.insert(noticeDto));
    }

    @Test
    public void update() throws Exception {
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setNotice_id(18);
        noticeDto.setNotice_title("변경된 제목!!!");
        noticeDto.setNotice_ctt("변경된 내용!!!");
        noticeDto.setNotice_is_open("Y");
        noticeDto.setUpdated_id("8028bee4-6025-4c58-8c7f-839d7dc0d45t");
        System.out.println("@@@@@@UPDATE COUNT = " + noticeDao.update(noticeDto));
    }

}