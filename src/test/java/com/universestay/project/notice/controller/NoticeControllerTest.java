package com.universestay.project.notice.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
//@Log4j
public class NoticeControllerTest {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    @Test
    public void testList() throws Exception {
        System.out.println(
                mockMvc.perform(MockMvcRequestBuilders.get("/notice/list"))
                        .andReturn()
                        .getModelAndView()
                        .getModelMap());
    }

    @Test
    public void testRead() throws Exception {
        System.out.println(mockMvc.perform(MockMvcRequestBuilders.get("/notice/read")
                        .param("notice_id", "2"))
                .andReturn()
                .getModelAndView().getModelMap());
    }

    @Test
    public void testRemove() throws Exception {
        // 삭제 전 데이터베이스에 공지사항 번호 확인할 것!
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/notice/remove")
                .param("notice_id", "4")
        ).andReturn().getModelAndView().getViewName();
        System.out.println(resultPage);
    }

    @Test
    public void testWrite() throws Exception {
        String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/notice/write")
                .param("admin_id", "8028bee4-6025-4c58-8c7f-839d7dc0d45t")
                .param("notice_title", "2023/11/27 월요일 공지사항")
                .param("notice_ctt",
                        "universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/30 목요일 23:50 ~ 24:00 까지 점검이 있을 예정입니다.")
                .param("created_id", "8028bee4-6025-4c58-8c7f-839d7dc0d45t")
                .param("updated_id", "8028bee4-6025-4c58-8c7f-839d7dc0d45t")
        ).andReturn().getModelAndView().getViewName();

        System.out.println("RESULT PAGE : " + resultPage);
    }

    @Test
    public void testModify() throws Exception {
        String resultPage = mockMvc
                .perform(MockMvcRequestBuilders.post("/notice/modify")
                        .param("notice_id", "23")
                        .param("notice_title", "변경된 2023/11/27 공지사항")
                        .param("notice_ctt",
                                "변경된 universeStay를 이용하시는 고객 여러분 감사드립니다! 조금 더 안정적인 서비스 제공을 위하여 2023/11/23 목요일 23:50 ~ 24:00 까지 점검이 있을 예정입니다.")
                        .param("notice_is_open", "Y")
                        .param("updated_id", "8028bee4-6025-4c58-8c7f-839d7dc0d45t")
                ).andReturn().getModelAndView().getViewName();
        System.out.println(resultPage);
    }

}
