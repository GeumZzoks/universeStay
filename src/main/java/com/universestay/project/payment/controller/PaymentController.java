package com.universestay.project.payment.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.universestay.project.payment.dto.PaymentDto;
import com.universestay.project.payment.service.PaymentService;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/payment")
@CrossOrigin(origins = "https://api.iamport.kr")
public class PaymentController {

    private PaymentService paymentService;

    @Autowired
    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }


    /**
     * 포트원 API를 이용해서 AccessToken 발급 받기(추후 결제 정보 확인용)
     *
     * @return ResponseEntity(data, status)
     * @throws IOException
     */
    @PostMapping("/getAccessToken")
    @ResponseBody
//    public ResponseEntity getAccessToken(@RequestParam("imp_uid") String imp_uid,
//            @RequestParam("merchant_uid") String merchant_uid) throws IOException {
    public ResponseEntity getAccessToken() throws IOException {

        final String IMP_KEY = "5372858343674204"; // REST API 키
        final String IMP_SECRET = "jc6Sxc1cbULMvRP40c7cnkPkj73i2VSJWzor9RpxLTSzjkbhnASK4d4Uf5gobqPDl4UIrdCdSiZUbBBm";

//        String jsonData = "{ \"imp_key\": \"5372858343674204\", \"imp_secret\": \"jc6Sxc1cbULMvRP40c7cnkPkj73i2VSJWzor9RpxLTSzjkbhnASK4d4Uf5gobqPDl4UIrdCdSiZUbBBm\" }";
        String jsonData =
                "{ \"imp_key\": \"" + IMP_KEY + "\", \"imp_secret\": \"" + IMP_SECRET + "\" }";
        byte[] postData = jsonData.getBytes("UTF-8");

        // 요청 URL 설정
        URL url = new URL("https://api.iamport.kr/users/getToken");

        // HttpURLConnection 열기
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

        // POST 메서드 설정
        urlConnection.setRequestMethod("POST");

        // 요청 헤더 설정
        urlConnection.setRequestProperty("Content-Type", "application/json");
        urlConnection.setRequestProperty("Accept", "application/json");

        // 데이터 전송을 위한 설정
        urlConnection.setDoOutput(true);

        // 데이터 전송을 위한 DataOutputStream 생성
        DataOutputStream outputStream = new DataOutputStream(urlConnection.getOutputStream());
        outputStream.write(postData);
        outputStream.flush();
        outputStream.close();

        // 응답 코드 확인
        int responseCode = urlConnection.getResponseCode();
        System.out.println("getAccessToken HTTP 응답 코드: " + responseCode);

        // 응답 데이터 읽기
        BufferedReader bufferedReader = new BufferedReader(
                new InputStreamReader(urlConnection.getInputStream()));
        StringBuffer stringBuffer = new StringBuffer();

        String inputLine = "";
        while ((inputLine = bufferedReader.readLine()) != null) {
            stringBuffer.append(inputLine);
        }
        bufferedReader.close();

        String response = stringBuffer.toString();
        System.out.println("response = " + response);

        // 연결 닫기
        urlConnection.disconnect();
        return new ResponseEntity(response, HttpStatus.OK);
    }


    /**
     * rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단
     *
     * @param imp_uid
     * @param Authorization
     * @return ResponseEntity(data, status)
     * @throws IOException
     */
    @PostMapping("/lookUpImpUid")
    @ResponseBody
    public ResponseEntity lookUpImpUid(
            @RequestParam("imp_uid") String imp_uid,
            @RequestParam("Authorization") String Authorization,
            @RequestParam("booking_id") String booking_id) throws IOException {

        // 요청 URL 설정
        // imp_uid 전달
        URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);

        // HttpURLConnection 열기
        HttpURLConnection Connection = (HttpURLConnection) url.openConnection();

        // POST 메서드 설정
        Connection.setRequestMethod("GET");

        // 요청 헤더 설정
        // 인증 토큰 Authorization header에 추가
        Connection.setRequestProperty("Authorization", Authorization);
        Connection.setRequestProperty("Content-Type", "application/json");

        // 응답 코드 확인
        int responseCode = Connection.getResponseCode();
        System.out.println("lookUpImpUid HTTP 응답 코드: " + responseCode);

        // 응답 데이터 읽기
        BufferedReader bufferedReader = new BufferedReader(
                new InputStreamReader(Connection.getInputStream()));
        StringBuffer stringBuffer = new StringBuffer();

        String inputLine = "";
        while ((inputLine = bufferedReader.readLine()) != null) {
            stringBuffer.append(inputLine);
        }
        bufferedReader.close();

        String response = stringBuffer.toString();

        // 연결 닫기
        Connection.disconnect();

        // Jackson - JSON을 java 객체로 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(response);
        System.out.println("jsonNode.get(\"response\") = " + jsonNode.get("response"));

        String status = String.valueOf(jsonNode.get("response").get("status"));
        Integer amount = Integer.valueOf(String.valueOf(jsonNode.get("response").get("amount")));

        System.out.println("status = " + status);
        System.out.println("amount = " + amount);

        // DB에서 결제되어야 하는 금액 조회
        Map<String, Object> orderInfo = paymentService.findOrderById(booking_id);
        // 결제 되어야 하는 금액
        Integer amountToBePaid = (Integer) orderInfo.get("room_weekend_price");

        if (amountToBePaid == null) {
            return new ResponseEntity("DB값이 조회되지 않음", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // 결제 검증하기, 결제 된 금액 === 결제 되어야 하는 금액

        if (amount == amountToBePaid) {
            
        }


        /*
         * 1. bookingID를 조회해서 실제 숙소 결제금액과 포트원 API의 결제 금액을 비교하기
         * 2. 검증이 성공하면 결제 정보를 데이터베이스에 저장(UPDATE)
         * 3. 결제 상태(status)에 따라 알맞은 응답을 반환하고, 실패 시 에러 메세지를 출력
         * */
        //        return new ResponseEntity(response, HttpStatus.OK);

        return null;

    }

    @PostMapping("/getPaymentInfo")
    @ResponseBody
    public ResponseEntity getPaymentInfo(@RequestParam("bookingId") String bookingId) {
        return new ResponseEntity<>(paymentService.findPaymentUser(bookingId), HttpStatus.OK);
    }

    @PostMapping("/saveResponse")
    public ResponseEntity getPaymentResponse(@RequestBody PaymentDto paymentDto) {
        try {
            String uuid = UUID.randomUUID().toString();
            //payment_id에 랜덤 Uuid 부여
            paymentDto.setPayment_id(uuid);
            int isInserted = paymentService.insertPaymentInfo(paymentDto);
            System.out.println("isInserted = " + isInserted);
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch (Exception e) {
            // 예외가 발생했을 때 실행할 코드
            e.printStackTrace(); // 에러 메시지를 콘솔에 출력하거나 원하는 작업을 수행할 수 있어요.
            return new ResponseEntity<>("Error occurred", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

//    @GetMapping
//    @ResponseBody
//    public ResponseEntity
}
