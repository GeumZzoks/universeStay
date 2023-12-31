package com.universestay.project.room.service;

import com.universestay.project.room.dto.SendEmailBookInfoDto;
import java.time.DayOfWeek;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class BookShareMailSendService {

    @Autowired
    private JavaMailSenderImpl mailSender;


    /**
     * 여행 예약 내역 공유 - 메일 전송
     *
     * @param sendEmailBookInfoDto
     * @return ResponseEntity
     * @throws RuntimeException
     */

    //이메일 보낼 양식
    public String sendEmailForRoomInfo(SendEmailBookInfoDto sendEmailBookInfoDto,
            DayOfWeek checkInDateDayOfWeek, DayOfWeek checkOutDateDayOfWeek) {
        String setFrom = "universestay23@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
        String[] toMails = sendEmailBookInfoDto.getEmails();
        String title = sendEmailBookInfoDto.getRoom_name() + " 예약 요청 전송 완료"; // 이메일 제목

        String content = ""
                + "<html>\n"
                + "<head>\n"
                + "    <title>확인 및 결제</title>\n"
                + "\n"
                + "    <style>\n"
                + "      html, body, div, span, applet, object, iframe,\n"
                + "      h1, h2, h3, h4, h5, h6, p, blockquote, pre,\n"
                + "      a, abbr, acronym, address, big, cite, code,\n"
                + "      del, dfn, em, img, ins, kbd, q, s, samp,\n"
                + "      small, strike, strong, sub, sup, tt, var,\n"
                + "      b, u, i, center,\n"
                + "      dl, dt, dd, ol, ul, li,\n"
                + "      fieldset, form, label, legend,\n"
                + "      table, caption, tbody, tfoot, thead, tr, th, td,\n"
                + "      article, aside, canvas, details, embed,\n"
                + "      figure, figcaption, footer, header, hgroup,\n"
                + "      menu, nav, output, ruby, section, summary,\n"
                + "      time, mark, audio, video {\n"
                + "        margin: 0;\n"
                + "        padding: 0;\n"
                + "        border: 0;\n"
                + "        font-size: 100%;\n"
                + "        font: inherit;\n"
                + "        vertical-align: baseline;\n"
                + "      }\n"
                + "\n"
                + "\n"
                + "      /* Component */\n"
                + "      .screens-room-mailSend__table__common-component-padding-box {\n"
                + "        padding: 24px 48px;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-table {\n"
                + "        border-collapse: collapse;\n"
                + "        border-spacing: 0;\n"
                + "        width: 100%;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-table--p {\n"
                + "        font-size: 17px;\n"
                + "        line-height: 28px;\n"
                + "        font-family: NotoSansKR-Regular;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-table a {\n"
                + "        text-decoration: none;\n"
                + "\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-table a:visited {\n"
                + "        color: #222222;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-table img {\n"
                + "        background-position: center;\n"
                + "        background-repeat: no-repeat;\n"
                + "        background-size: cover;\n"
                + "        width: 100%;\n"
                + "        height: 100%;\n"
                + "        object-fit: cover;\n"
                + "        border-radius: 8px;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-table--h2 {\n"
                + "        font-size: 1.5rem;\n"
                + "        font-family: NotoSansKR-Medium;\n"
                + "        padding: 12px 0px;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__common-component-line {\n"
                + "        width: 90%;\n"
                + "\n"
                + "        border-top-width: 1px;\n"
                + "        border-top-style: solid;\n"
                + "        border-top-color: rgb(221, 221, 221);\n"
                + "        /*margin-top: 8px;*/\n"
                + "        margin: auto;\n"
                + "      }\n"
                + "\n"
                + "\n"
                + "      /* CLASS */\n"
                + "\n"
                + "      .screens-room-mailSend__table {\n"
                + "        max-width: 640px;\n"
                + "        border-collapse: collapse;\n"
                + "        border-spacing: 0;\n"
                + "        color: #222222;\n"
                + "        display: table;\n"
                + "        margin: auto;\n"
                + "\n"
                + "\n"
                + "        padding: 0;\n"
                + "        vertical-align: top;\n"
                + "        width: 100%;\n"
                + "\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__container {\n"
                + "        border: 1px solid #dddddd;\n"
                + "        border-radius: 12px;\n"
                + "        overflow: hidden;\n"
                + "\n"
                + "        line-height: 28px;\n"
                + "\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__container--h1 {\n"
                + "        font-size: 2rem;\n"
                + "        font-family: NotoSansKR-Bold;\n"
                + "        margin: 0;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__container button {\n"
                + "        width: 45%;\n"
                + "        padding: 16px 24px;\n"
                + "        cursor: pointer;\n"
                + "        border: 1px solid black;\n"
                + "        border-radius: 8px;\n"
                + "        font-size: 1.25rem;\n"
                + "        margin: auto;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__container-button--first-child {\n"
                + "        background: linear-gradient(90deg, #e61e4d 1.83%, #e31c5f 50.07%, #d70466 96.34%);\n"
                + "        color: #FFFFFF;\n"
                + "      }\n"
                + "\n"
                + "      .screens-room-mailSend__table__container-button--second-child {\n"
                + "        background: linear-gradient(to right, #ffffff 0%, #ffffff 50%, #ffffff 100%);\n"
                + "        color: #222222;\n"
                + "      }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "\n"
                + "<table class=\"screens-room-mailSend__table\">\n"
                + "    <tbody>\n"
                + "    <tr style=\"margin: 0\">\n"
                + "        <td style=\"display: table-cell; vertical-align: inherit;\">\n"
                + "            <div class=\"screens-room-mailSend__table__container\">\n"
                + "                <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                    <tbody>\n"
                + "                    <tr>\n"
                + "                        <td class=\"screens-room-mailSend__table__common-component-padding-box\">\n"
                + "                            <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                                <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td style=\"padding-top: 48px\">\n"
                + "                                        <a href=\"http://localhost:8080\"\n"
                + "                                           style=\"width: 32px; height: 32px; overflow: hidden\">\n"
                + "                                            <img src=\"https://universestay-img-server.s3.ap-northeast-2.amazonaws.com/big_logo_no_bgd.png\"\n"
                + "                                                 alt=\"\"\n"
                + "                                                 style=\"width: 32px; height: 32px; object-fit: cover\">\n"
                + "                                        </a>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                                </tbody>\n"
                + "                            </table>\n"
                + "\n"
                + "                            <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                                <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td style=\"padding-top: 24px; padding-bottom: 24px\">\n"
                + "                                        <h1 class=\"screens-room-mailSend__table__container--h1\">예약\n"
                + "                                            요청이 전송되었습니다</h1>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                                </tbody>\n"
                + "                            </table>\n"
                + "\n"
                + "                            <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                                <tbody>\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                                            아직 예약이 확정된 것은 아닙니다. 24시간 이내에 호스트가 응답할 겁니다.\n"
                + "                                        </p>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                                </tbody>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "                    </tbody>\n"
                + "\n"
                + "                    <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                        <tbody>\n"
                + "                        <tr>\n"
                + "                            <td style=\"padding-left: 48px; padding-right: 48px; padding-top: 24px;\">\n"
                + "                                <a href=\""
                + sendEmailBookInfoDto.getRoom_detail_link() + "\"\n"
                + "                                   target=\"_blank\"\n"
                + "                                   data-saferedirecturl=\""
                + sendEmailBookInfoDto.getRoom_detail_link() + "\">\n"
                + "                                    <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                                        <tbody>\n"
                + "                                        <tr>\n"
                + "                                            <td style=\"width: 500px; height: 300px; overflow: hidden;\">\n"
                + "                                                <img src=\""
                + sendEmailBookInfoDto.getRoom_main_photo() + "\"\n"
                + "                                                     alt=\""
                + sendEmailBookInfoDto.getRoom_name() + "\">\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                        </tbody>\n"
                + "                                    </table>\n"
                + "                                </a>\n"
                + "                            </td>\n"
                + "                        </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "\n"
                + "                    <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                        <tbody>\n"
                + "                        <tr>\n"
                + "                            <div style=\"padding: 8px 0;\">\n"
                + "                                <div class=\"screens-room-mailSend__table__common-component-padding-box\"\n"
                + "                                     style=\"display: flex; justify-content: space-around; align-items: center\">\n"
                + "                                    <a href=\""
                + sendEmailBookInfoDto.getRoom_detail_link() + "\"\n"
                + "                                       target=\"_blank\"\n"
                + "                                       style=\"color: black; text-decoration: none;\">\n"
                + "                                        <h2 class=\"screens-room-mailSend__table__common-component-table--h2\">\n"
                + "                                            "
                + sendEmailBookInfoDto.getRoom_name() + "</h2>\n"
                + "                                        <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                                            유빈 님이 호스팅하는 집 전체\n"
                + "                                        </p>\n"
                + "                                    </a>\n"
                + "\n"
                + "                                    <div style=\"padding: 0 8px; margin-left: 32px\">\n"
                + "                                        <a href=\""
                + sendEmailBookInfoDto.getRoom_detail_link() + "\"\n"
                + "                                           target=\"_blank\"\n"
                + "                                           data-saferedirecturl=\""
                + sendEmailBookInfoDto.getRoom_detail_link() + "\">\n"
                + "                                            <img src=\""
                + sendEmailBookInfoDto.getProfile_img_url() + "\"\n"
                + "                                                 alt=\"프로필 보기\"\n"
                + "                                                 class=\"screens-room-mailSend__table__common-component-table__profile-img\"\n"
                + "                                                 style=\"width: 54px; height: 54px; border-radius: 50%\">\n"
                + "                                        </a>\n"
                + "                                    </div>\n"
                + "                                </div>\n"
                + "                            </div>\n"
                + "                        </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "\n"
                + "                    <div class=\"screens-room-mailSend__table__common-component-line\"></div>\n"
                + "                    <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                        <tbody>\n"
                + "                        <tr>\n"
                + "                            <td class=\"screens-room-mailSend__table__common-component-padding-box\">\n"
                + "                                <table>\n"
                + "                                    <tbody>\n"
                + "                                    <tr>\n"
                + "                                        <td>\n"
                + "                                            <h2 class=\"screens-room-mailSend__table__common-component-table--h2\">\n"
                + "                                                날짜</h2>\n"
                + "                                        </td>\n"
                + "                                    </tr>\n"
                + "                                    </tbody>\n"
                + "                                </table>\n"
                + "\n"
                + "                                <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                                    <tbody>\n"
                + "                                    <tr>\n"
                + "                                        <td style=\"width: 50%\">\n"
                + "                                            <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                                                " + checkInDateDayOfWeek
                + "</p>\n"
                + "                                            <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                                                "
                + sendEmailBookInfoDto.getBooking_checkin_date() + "\n"
                + "                                            </p>\n"
                + "                                        </td>\n"
                + "\n"
                + "                                        <td>\n"
                + "                                            <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                                                " + checkOutDateDayOfWeek
                + "</p>\n"
                + "                                            <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                                                "
                + sendEmailBookInfoDto.getBooking_checkout_date() + "\n"
                + "                                            </p>\n"
                + "                                        </td>\n"
                + "                                    </tr>\n"
                + "                                    </tbody>\n"
                + "                                </table>\n"
                + "                            </td>\n"
                + "                        </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "\n"
                + "                    <div class=\"screens-room-mailSend__table__common-component-line\"></div>\n"
                + "                    <div class=\"screens-room-mailSend__table__common-component-padding-box\">\n"
                + "                        <p class=\"screens-room-mailSend__table__common-component-table--p\">\n"
                + "                            예약이 확정되기 전까지는 비용이 청구되지 않습니다.\n"
                + "                        </p>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"screens-room-mailSend__table__common-component-line\"></div>\n"
                + "                    <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                        <tbody>\n"
                + "                        <tr>\n"
                + "                            <td class=\"screens-room-mailSend__table__common-component-padding-box\">\n"
                + "                                <table class=\"screens-room-mailSend__table__common-component-table\">\n"
                + "                                    <tbody>\n"
                + "                                    <tr>\n"
                + "                                        <td style=\"display: flex; justify-content: space-around\">\n"
                + "                                            <button class=\"screens-room-mailSend__table__container-button--first-child\">\n"
                + "                                                여행 목록 보기\n"
                + "                                            </button>\n"
                + "\n"
                + "                                            <button class=\"screens-room-mailSend__table__container-button--second-child\">\n"
                + "                                                요청 취소\n"
                + "                                            </button>\n"
                + "                                        </td>\n"
                + "\n"
                + "                                    </tr>\n"
                + "                                    </tbody>\n"
                + "                                </table>\n"
                + "                            </td>\n"
                + "                        </tr>\n"
                + "                        </tbody>\n"
                + "                    </table>\n"
                + "\n"
                + "                </table>\n"
                + "            </div>\n"
                + "        </td>\n"
                + "    </tr>\n"
                + "    </tbody>\n"
                + "</table>\n"
                + "\n"
                + "\n"
                + "<script\n"
                + "        src=\" https://kit.fontawesome.com/d1e61c2fb7.js\"\n"
                + "        crossorigin=\"anonymous\"\n"
                + "></script>\n"
                + "</body>\n"
                + "</html>\n";

        mailSend(setFrom, toMails, title, content);
        return Integer.toString(1);
    }

    //이메일 전송 메소드
    public void mailSend(String setFrom, String[] toMails, String title, String content) {
        for (int i = 0; i < toMails.length; i++) {
            MimeMessage message = mailSender.createMimeMessage();
            // true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
            try {
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                helper.setFrom(setFrom);
                helper.setTo(toMails[i]);
                helper.setSubject(title);
                // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
                helper.setText(content, true);
                mailSender.send(message);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
    }
}
