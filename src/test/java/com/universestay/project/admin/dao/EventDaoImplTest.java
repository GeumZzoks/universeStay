package com.universestay.project.admin.dao;

import com.universestay.project.common.SearchCondition;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EventDaoImplTest {

    @Autowired
    private EventDao eventDao;

    @org.junit.Test
    public void abc() throws Exception {
        SearchCondition sc = new SearchCondition();
        System.out.println("sc = " + sc);

        List<Map<String, Object>> list = eventDao.searchSelectPage(sc);
        for (Map<String, Object> map : list) {
            System.out.println("map = " + map);

        }

    }

    @Test
    public void select() throws Exception {

    }

    @Test
    public void selectAll() throws Exception {

    }

    @Test
    public void update() throws Exception {

    }

    @Test
    public void delete() throws Exception {

    }
}