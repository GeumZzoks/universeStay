package com.universestay.project.admin.service;

import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

// 예약 정보를 가져와서 자정에 예약자에게 이메일로 예약 정보를 보내주는 스케줄 등록
@Component
public class ReservationToEmailJob implements Job {

    @Autowired
    ReservationAlertService reservationAlertService;

    @Autowired
    JavaMailSenderImpl mailSender;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        try {
            // db 에서 예약 정보 가져오기
            List<Map<String, Object>> list = reservationAlertService.selectReservationAlert();
            alertEmail(list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //이메일 보낼 양식
    public void alertEmail(List<Map<String, Object>> list) {
        // list 에서 map 을 하나씩 꺼내서 예약자에게 보낼 이메일 내용 작성
        for (Map<String, Object> map : list) {
            String setFrom = "universestay23@gmail.com";
            String toMail = map.get("user_email").toString();
            String title = "[UNIVERSESTAY] 숙소 예약 안내 - 체크인 하루 전입니다!";
            String content = "안녕하세요 :)<br><br>"
                    + "이메일을 통해 알려드립니다. 내일은 숙소 체크인 날입니다. 아래는 예약에 대한 상세 정보입니다:<br>"
                    + " • 예약 번호: " + map.get("booking_id").toString() + "<br>"
                    + " • 숙소 이름: " + map.get("room_name").toString() + "<br>"
                    + " • 체크인 날짜: " + map.get("booking_checkin_time").toString() + "<br>"
                    + " • 체크아웃 날짜: " + map.get("booking_checkout_time").toString() + "<br>"
                    + " • 예약자 이름: " + map.get("user_name").toString() + "<br><br>"
                    + "숙소 체크인을 위해 아래 사항을 확인해 주세요:<br>"
                    + " • 체크인 시간: " + map.get("booking_checkin_time") + "<br>"
                    + " • 숙소 주소: " + map.get("room_address").toString() + "<br>";
            // 상세주소가 null 이 아니라면 해당 항목도 화면에 보이게 표시
            if (map.get("room_address_detail") != null) {
                content += " • 숙소 상세 주소: " + map.get("room_address_detail").toString() + "<br>";
            }

            content += "<br><br>감사합니다<br>"
                    + "UNIVERSESTAY 드림";

            alertMailSend(setFrom, toMail, title, content);
        }
    }

    //이메일 전송 메소드
    public void alertMailSend(String setFrom, String toMail, String title, String content) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
            helper.setText(content, true);
            mailSender.send(message);
            System.out.println("메일 전송 완료");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
