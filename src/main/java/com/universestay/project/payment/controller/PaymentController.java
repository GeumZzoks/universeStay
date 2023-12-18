package com.universestay.project.payment.controller;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @GetMapping
    public String payment() {
        return "payment/payment";
    }

    @PostMapping
    @ResponseBody
    public ResponseEntity payment1(@RequestParam("imp_uid") String imp_uid,
            @RequestParam("merchant_uid") String merchant_uid) throws IOException {

        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
        urlConnection.setRequestMethod("POST");
        urlConnection.setRequestProperty("Accept", "application/json");

        return null;
    }

//    @GetMapping
//    @ResponseBody
//    public ResponseEntity
}
