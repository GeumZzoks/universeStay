package com.universestay.project.docs;



import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/test")
public class SwaggerTestController {

    // GET 요청에 대한 예시
    @ApiOperation(value = "사용자 정보 조회", notes = "사용자의 ID를 이용해 정보를 조회합니다.")
    @GetMapping("/user/{id}")
    public ResponseEntity<String> getUserById(
            @ApiParam(value = "사용자 ID", required = true) @PathVariable("id") Long id
    ) {
        return ResponseEntity.ok("User information for ID: " + id);
    }

    // POST 요청에 대한 예시
    @ApiOperation(value = "사용자 정보 등록", notes = "새로운 사용자 정보를 등록합니다.")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "성공적으로 등록됨"),
            @ApiResponse(code = 400, message = "잘못된 요청"),
            @ApiResponse(code = 500, message = "서버 오류")
    })
    @PostMapping("/user")
    public ResponseEntity<String> addUser(
            @ApiParam(value = "신규 사용자 정보", required = true) @RequestBody SwaggerTestModel swaggerTestModel
    ) {
        // 여기서는 UserRequest 객체를 받아 처리
        // 실제로는 받은 정보를 데이터베이스에 저장하는 등의 로직을 수행
        return ResponseEntity.ok("User added: " + swaggerTestModel.getUsername());
    }
}