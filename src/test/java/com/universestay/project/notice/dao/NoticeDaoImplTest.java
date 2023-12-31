package com.universestay.project.notice.dao;

import com.universestay.project.admin.dao.NoticeDao;
import com.universestay.project.admin.dto.NoticeDto;
import java.util.HashMap;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@Log4j
public class NoticeDaoImplTest {

    @Autowired
    NoticeDao noticeDao;

    @Test
    public void count() throws Exception {
        System.out.println("공지시항 전체 개수 : " + noticeDao.count());
    }

    @Test
    public void selectAll() throws Exception {
        // 공지사항 목록 출력
        System.out.println(noticeDao.selectAll());
    }

    @Test
    public void select() throws Exception {
        // 공지사항 조회 출력
        System.out.println(noticeDao.select(320));
    }

    @Test
    public void delete() throws Exception {
        // 공지사항 삭제(1개 삭제되면 1로 반환 삭제되지 않으면 0)
        System.out.println("DELETE COUNT = " + noticeDao.delete(301));
    }

    @Test
    public void insert() throws Exception {
        // 공지사항 등록(NoticeDto에 데아터 담아서 noticeDao.insert 메서드로 데이터 전달, 글 등록 완료 시 1 / 등록이 안될 시 0 반환)
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setAdmin_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
//        noticeDto.setNotice_title("@@@@@ 2023/11/25 토요일 - 서버 점검이 있습니다.");
        noticeDto.setNotice_ctt(
                "universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/23 목요일 23:50 ~ 24:00 까지 점검이 있을 예정입니다.");
        noticeDto.setNotice_is_open("Y");
        noticeDto.setCreated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setUpdated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        for (int i = 0; i < 200; i++) {
            noticeDto.setNotice_title(i + "번째 공지사항");
            System.out.println("INSERT COUNT = " + noticeDao.insert(noticeDto));
        }
        System.out.println("notice_id : " + noticeDto.getNotice_id());
    }

    @Test
    public void insertSelectKey() throws Exception {
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setAdmin_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setNotice_title("@@@@@ 2023/11/25 토요일 - 서버 점검이 있습니다.");
        noticeDto.setNotice_ctt(
                "universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/23 목요일 23:50 ~ 24:00 까지 점검이 있을 예정입니다.");
        noticeDto.setCreated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        noticeDto.setUpdated_id("0ca24692-89ea-11ee-b9d1-0242ac120002");
        System.out.println("INSERT COUNT = " + noticeDao.insertSelectKey(noticeDto));
        System.out.println("notice_id : " + noticeDto.getNotice_id());
    }

    @Test
    public void update() throws Exception {
        // 공지사항 수정(NoticeDto에 데이터 담아서 noticeDao.update 메서드로 입력한 데이터 전달, 글 수정 완료 시 1 / 안됐을 시 0 반환)
        NoticeDto noticeDto = new NoticeDto();
        noticeDto.setNotice_id(18);
        noticeDto.setNotice_title("변경된 제목!!!");
        noticeDto.setNotice_ctt("변경된 내용!!!");
        noticeDto.setNotice_is_open("Y");
        noticeDto.setUpdated_id("8028bee4-6025-4c58-8c7f-839d7dc0d45t");
        System.out.println("UPDATE COUNT = " + noticeDao.update(noticeDto));
    }

    @Test
    public void selectAdminId() throws Exception {
        System.out.println("GET Admin_id : " + noticeDao.selectAdminId("alskadmlcraz1@gmail.com"));
    }

    @Test
    public void selectMainPage() throws Exception {
        Map map = new HashMap();
        map.put("offset", 1);
        map.put("pageSize", 10);
        System.out.println(noticeDao.selectMainPage(map));
    }

    @Test
    public void 공개_공지사항_카운트() throws Exception {
        System.out.println(noticeDao.openCount());
    }

    @Test
    public void 메인_공지사항_상세() throws Exception {
        System.out.println(noticeDao.mainSelect(530));
    }

}