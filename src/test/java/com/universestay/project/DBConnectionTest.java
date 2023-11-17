package com.universestay.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Date;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DBConnectionTest {

    @Autowired
    ApplicationContext context;

    @Autowired
    DataSource ds; // 컨테이너로부터 자동 주입받는다.

    @Test
    public void initContext() {
        String[] beanDefinitionNames = context.getBeanDefinitionNames();
        System.out.println(Arrays.toString(beanDefinitionNames));
    }

    @Test
    public void jdbcConnectionTest() throws Exception {
//        ApplicationContext ac = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/**/root-context.xml");
//        DataSource ds = ac.getBean(DataSource.class);

        CommonStatus commonStatus = null;

        Connection conn = ds.getConnection(); // 데이터베이스의 연결을 얻는다.
        PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM CommonStatus");
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            commonStatus = new CommonStatus();
            commonStatus.setStatus_id(resultSet.getString(1));
            commonStatus.setStatus_category(resultSet.getString(2));
        }

        System.out.println(commonStatus);

        System.out.println("resultSet = " + resultSet);

        System.out.println("conn = " + conn);
        assertTrue(conn != null);
    }

    public class CommonStatus {
        public String status_id;
        public String status_category;
        public String status_type_name;
        public String status_name;
        public Date status_created_at;
        public Date status_updated_at;
        public Integer status_order;
        public String status_is_used;

        public String getStatus_id() {
            return status_id;
        }

        public void setStatus_id(String status_id) {
            this.status_id = status_id;
        }

        public String getStatus_category() {
            return status_category;
        }

        public void setStatus_category(String status_category) {
            this.status_category = status_category;
        }

        public String getStatus_type_name() {
            return status_type_name;
        }

        public void setStatus_type_name(String status_type_name) {
            this.status_type_name = status_type_name;
        }

        public String getStatus_name() {
            return status_name;
        }

        public void setStatus_name(String status_name) {
            this.status_name = status_name;
        }

        public Date getStatus_created_at() {
            return status_created_at;
        }

        public void setStatus_created_at(Date status_created_at) {
            this.status_created_at = status_created_at;
        }

        public Date getStatus_updated_at() {
            return status_updated_at;
        }

        public void setStatus_updated_at(Date status_updated_at) {
            this.status_updated_at = status_updated_at;
        }

        public Integer getStatus_order() {
            return status_order;
        }

        public void setStatus_order(Integer status_order) {
            this.status_order = status_order;
        }

        public String getStatus_is_used() {
            return status_is_used;
        }

        public void setStatus_is_used(String status_is_used) {
            this.status_is_used = status_is_used;
        }

        @Override
        public String toString() {
            return "CommonStatus{" +
                    "status_id='" + status_id + '\'' +
                    ", status_category='" + status_category + '\'' +
                    ", status_type_name='" + status_type_name + '\'' +
                    ", status_name='" + status_name + '\'' +
                    ", status_created_at=" + status_created_at +
                    ", status_updated_at=" + status_updated_at +
                    ", status_order=" + status_order +
                    ", status_is_used='" + status_is_used + '\'' +
                    '}';
        }
    }
}
