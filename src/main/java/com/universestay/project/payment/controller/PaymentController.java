package com.universestay.project.payment.controller;

import com.universestay.project.payment.dto.PaymentDto;
import com.universestay.project.payment.service.PaymentService;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping
    public String payment() {
        return "payment/payment";
    }

    @PostMapping("/getAccessToken")
    @ResponseBody
    public ResponseEntity getAccessToken(@RequestParam("imp_uid") String imp_uid,
            @RequestParam("merchant_uid") String merchant_uid) throws IOException {

        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();

        urlConnection.setRequestMethod("POST");
        urlConnection.setRequestProperty("Accept", "application/json");
        urlConnection.setDoOutput(true);

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
