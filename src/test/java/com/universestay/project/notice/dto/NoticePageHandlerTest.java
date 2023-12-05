package com.universestay.project.notice.dto;

import static org.junit.Assert.assertTrue;

import com.universestay.project.admin.dto.NoticePageHandler;
import org.junit.Test;

public class NoticePageHandlerTest {

    @Test
    public void test() {
        NoticePageHandler pageHandler = new NoticePageHandler(
                250, 1);
        assertTrue(pageHandler.getBeginPage() == 1);
        assertTrue(pageHandler.getEndPage() == 10);
        pageHandler.print();
        System.out.println("pageHandler = " + pageHandler);
    }

    @Test
    public void test2() {
        NoticePageHandler pageHandler = new NoticePageHandler(
                250, 11);
        assertTrue(pageHandler.getBeginPage() == 11);
        assertTrue(pageHandler.getEndPage() == 20);
        pageHandler.print();
        System.out.println("pageHandler = " + pageHandler);
    }

    @Test
    public void test3() {
        NoticePageHandler pageHandler = new NoticePageHandler(
                255, 25);
        pageHandler.print();
        System.out.println("pageHandler = " + pageHandler);
        assertTrue(pageHandler.getBeginPage() == 21);
        assertTrue(pageHandler.getEndPage() == 26);
    }

    @Test
    public void test4() {
        NoticePageHandler pageHandler = new NoticePageHandler(
                255, 11);
        pageHandler.print();
        System.out.println("pageHandler = " + pageHandler);
        assertTrue(pageHandler.getBeginPage() == 11);
        assertTrue(pageHandler.getEndPage() == 20);
    }
}
