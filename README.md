# UNIVERSE STAY
<img src="https://github.com/GeumZzoks/universeStay/assets/105831341/91b1c18c-3dec-4138-8ad2-d7c5a1403db4">

## 목차 📜
 * [프로젝트 기간](#프로젝트-기간) 🗓️
 * [주제](#주제) 📍
 * [기술 스택](#기술-스택) 🛠️ 
 * [파일 구조](#파일-구조) 💾
 * [설계 문서](#설계-문서) 📑
   * [ERD](#ERD)
   * [FIGMA](#FIGMA)
 * [아키텍처](#아키텍처) 🌐
 * [서비스 화면](#서비스-화면) 🖥️
    * [회원가입/로그인](#회원가입/로그인)
    * [메인페이지(스크롤)](#메인페이지(스크롤))
    * [숙소 등록](#숙소-등록)
    * [관리자 숙소 승인](#관리자-숙소-승인)
    * [숙소 예약](#숙소-예약)
    * [호스트 예약 승인](#호스트-예약-승인)
    * [숙소 결제](#숙소-결제)
    * [위시리스트 추가](#위시리스트-추가)
    * [호스트 게스트 채팅](#호스트-게스트-채팅)
    * [관리자 쿠폰 발급](#관리자-쿠폰-발급)
    * [공지사항](#공지사항)
    * [리뷰](#리뷰)
    * [숙소 상태 관리](#숙소-상태-관리)
    * [유저 관리](#유저-관리)
 * [회의 문서](#회의-문서) 📝
 * [팀 소개](#팀-소개) 🩷
   * [팀 규칙](#팀-규칙) 👮

---
## 프로젝트 기간 🗓️
`2023.11.18 - 2023.12.27 (약 6주)`

---
## 주제 📍
<img src="https://github.com/GeumZzoks/universeStay/assets/105831341/76e593a7-40a6-4c19-9b14-78f569d226e4">

---
## 기술 스택 🛠️
<div align=center>

  <img src="https://img.shields.io/badge/-Java-007396?style=flat-square&logo=java&logoColor=white">
  <img src="https://img.shields.io/badge/spring-6DB33F?style=flat-square&logo=spring&logoColor=white">
  <img src="https://img.shields.io/badge/-Notion-000000?style=flat-square&logo=notion&logoColor=white">
  <img src="https://img.shields.io/badge/-Figma-F24E1E?style=flat-square&logo=figma&logoColor=white">
  <img src="https://img.shields.io/badge/-IntelliJ_IDEA-000000?style=flat-square&logo=intellij-idea&logoColor=white">
  <img src="https://img.shields.io/badge/-VSCode-007ACC?style=flat-square&logo=visual-studio-code&logoColor=white">
  <img src="https://img.shields.io/badge/-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white">
  <img src="https://img.shields.io/badge/-WebSocket-00BFFF?style=flat-square">
  <img src="https://img.shields.io/badge/-Stomp-008000?style=flat-square">
  <img src="https://img.shields.io/badge/-AWS_EC2-232F3E?style=flat-square&logo=amazon-aws&logoColor=white">
  <img src="https://img.shields.io/badge/-AWS_S3-569A31?style=flat-square&logo=amazon-s3&logoColor=white">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=white">
  <img src="https://img.shields.io/badge/html5-E34F26?style=flat-square&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=flat-square&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat-square&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=flat-square&logo=jquery&logoColor=white">
  <img src="https://img.shields.io/badge/github-181717?style=flat-square&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=flat-square&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/apachemaven-C71A36?style=flat-square&logo=apachemaven&logoColor=white">
  <img src="https://img.shields.io/badge/mybatis-000000?style=flat-square&logo=mybatis&logoColor=white">
  <img src="https://img.shields.io/badge/JSP-008FC7?style=flat-square&logo=JSP&logoColor=white">
  <img src="https://img.shields.io/badge/KakaoApi-FFCD00?style=flat-square&logo=Kakao&logoColor=white">
  <img src="https://img.shields.io/badge/GoogleApi-4285F4?style=flat-square&logo=Google&logoColor=white">
  <img src="https://img.shields.io/badge/Spring Quartz-6DB33F?style=flat-square&logo=springquartz&logoColor=white">
  <img src="https://img.shields.io/badge/amazonaws-232F3E?style=flat-square&logo=amazonaws&logoColor=white">
  <img src="https://img.shields.io/badge/discord-5865F2?style=flat-square&logo=Discord&logoColor=white">
</div>


---
## 파일 구조 💾
<details>
<summary>파일 전체 구조</summary>
<div markdown="1">

```
📦src
 ┣ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┗ 📂universestay
 ┃ ┃ ┃ ┃ ┗ 📂project
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CouponController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DashBoardController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoginController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegisterController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserManagementController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CouponDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CouponDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DashBoardDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DashBoardDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoginAdminDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoginAdminDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegisterDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegisterDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationToEmailJobDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationToEmailJobDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserManagementDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserManagementDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CouponDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventImgDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticePageHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReplyDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChangeBookingStatusJob.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CouponService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CouponServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DashBoardService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜DashBoardServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoginAdminService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜LoginAdminServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜NoticeServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegisterService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegisterServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationAlertService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationAlertServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ReservationToEmailJob.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserManagementService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserManagementServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WebSocketConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChattingController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChattingRoomController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatRoomDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatMessageServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChatRoomService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ChatRoomServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂S3
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AwsS3ImgUploaderService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜S3Config.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜QuartzConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜QuartzJobFactory.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CommonException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜StatusCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainSearchCondition.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PageHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SearchCondition.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜Uuid.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂docs
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SwaggerConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜SwaggerTestController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SwaggerTestModel.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AddressDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AlertDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AlertRuleDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChattingMessageDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ChattingRoomDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CommonStatusDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RefundDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ViewDto.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂filter
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminFilter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserFilter.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂inquiry
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminInquiryController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InquiryChattingController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserInquiryController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminInquiryDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminInquiryDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInquiryDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserInquiryDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜InquiryChattingMessageDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜InquiryChattingRoomDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminInquiryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminInquiryServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInquiryService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserInquiryServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MainEventController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MainNoticeController.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂oauth
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜MsgEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜OauthLoginController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂google
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GoogleInfResponseDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GoogleRequestDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜GoogleResponseDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂kakao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜KakaoDTO.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜GoogleLoginService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜KakaoLoginService.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂payment
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PaymentController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PaymentDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PaymentDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PaymentService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜PaymentServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂review
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomReviewController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomReviewDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomReviewDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomReviewDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomReviewService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomReviewServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookingRoomController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomAmenityDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomAmenityDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomViewDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomViewDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomAmenityDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomImgDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomManagementDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomPhotoDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomViewDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜SendEmailBookInfoDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookShareMailSendService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomAmenityService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomAmenityServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RoomViewService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomViewServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostBookingManagementController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜JoinController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBookingController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCouponController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInquiryController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLogoutController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserWithdrawalController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostBookingManagementDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostBookingManagementDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBookingDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBookingDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProfileImgDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProfileImgDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCouponDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCouponDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserJoinDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserJoinDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserWithdrawalDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserWithdrawalDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜WishListDao.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListDaoImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜BookingDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CardDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜OAuthDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProfileImgDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCouponDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListDto.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostBookingManagementService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostBookingManagementServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜JoinService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜JoinServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MailSendService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBookingService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜MyBookingServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜PasswordEncryption.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProfileImgService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ProfileImgServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RedisUtil.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCouponService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserCouponServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserWithdrawalService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserWithdrawalServiceImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜WishListService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜WishListServiceImpl.java
 ┃ ┣ 📂resources
 ┃ ┃ ┣ 📂config
 ┃ ┃ ┃ ┣ 📜env.properties
 ┃ ┃ ┃ ┗ 📜oauth.properties
 ┃ ┃ ┣ 📂mybatis
 ┃ ┃ ┃ ┣ 📂mapper
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📜EventMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜HostingManagementMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜couponMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜dashBoardMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜loginMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜noticeMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜registerMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reservationToEmailJobMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userManagementMapper.xml
 ┃ ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chatMessageMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜chatRoomMapper.xml
 ┃ ┃ ┃ ┃ ┣ 📂inquiry
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AdminInquiryMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserInquiryMapper.xml
 ┃ ┃ ┃ ┃ ┣ 📂payment
 ┃ ┃ ┃ ┃ ┃ ┗ 📜paymentMapper.xml
 ┃ ┃ ┃ ┃ ┣ 📂review
 ┃ ┃ ┃ ┃ ┃ ┗ 📜roomReviewMapper.xml
 ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bookRoomMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomAmenityMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜roomViewMapper.xml
 ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserJoinMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hostBookingManagementMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜myBookingMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜profileImgUploadMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userCouponMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userInfoMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userLoginMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userWithdrawalMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜wishListMapper.xml
 ┃ ┃ ┃ ┗ 📜mybatis-config.xml
 ┃ ┃ ┣ 📜console-appender.xml
 ┃ ┃ ┣ 📜file-error-appender.xml
 ┃ ┃ ┣ 📜file-info-appender.xml
 ┃ ┃ ┣ 📜file-warn-appender.xml
 ┃ ┃ ┣ 📜log4jdbc.log4j2.properties
 ┃ ┃ ┣ 📜logback-dev.xml
 ┃ ┃ ┣ 📜logback-prod.xml
 ┃ ┃ ┗ 📜logback.xml
 ┃ ┣ 📂webapp
 ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┣ 📂spring
 ┃ ┃ ┃ ┃ ┣ 📂appServlet
 ┃ ┃ ┃ ┃ ┃ ┗ 📜servlet-context.xml
 ┃ ┃ ┃ ┃ ┗ 📜root-context.xml
 ┃ ┃ ┃ ┣ 📂views
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📜coupon.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜dashboard.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜event.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜eventInput.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜eventList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜eventUpdate.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hostingManagement.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜join.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜loginForm.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜notice.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜noticeInput.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜noticeList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜noticeUpdate.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜userInfo.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userList.jsp
 ┃ ┃ ┃ ┃ ┣ 📂chatting
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chattingMessageList.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chattingRoomList.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜contact_host.jsp
 ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜header.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜navigation.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜footerNotFix.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜header.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hostHeader.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜nav.jsp
 ┃ ┃ ┃ ┃ ┣ 📂inquiry
 ┃ ┃ ┃ ┃ ┃ ┣ 📜adminInquiry.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜oldInquiry.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜oldInquiryList.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userInquiry.jsp
 ┃ ┃ ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┃ ┃ ┣ 📜eventDetail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜eventPage.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜main.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜noticeDetail.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜noticeList.jsp
 ┃ ┃ ┃ ┃ ┣ 📂review
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userReviews.jsp
 ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┣ 📜book.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bookShare.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜management.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜modify.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomDetail.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomEnroll.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomPhotoEnroll.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomPhotoModify.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜roomReEnroll.jsp
 ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┣ 📂myPage
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜coupon.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hostBookingManagement.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜userInfo.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜wishList.jsp
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜withdrawal.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜join.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜joinOauth.jsp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜loginForm.jsp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜myBookings.jsp
 ┃ ┃ ┃ ┗ 📜web.xml
 ┃ ┃ ┣ 📂resources
 ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┃ ┗ 📜.DS_Store
 ┃ ┃ ┃ ┣ 📂css2
 ┃ ┃ ┃ ┃ ┣ 📂components
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜footer.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜header.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜navigation.css
 ┃ ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜footer.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜footerNotFix.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜header.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜nav.css
 ┃ ┃ ┃ ┃ ┣ 📂screens
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜coupon.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜dashboard.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜event.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hostingManagement.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜loginForm.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜notice_media.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜notice_style.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜register.css
 ┃ ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜book.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜bookShare.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜roomDetail.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜roomEnroll.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜roomManagement.css
 ┃ ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜eventDetail.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜eventPage.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜join.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜login.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜main.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜myBookings.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜myCoupon.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜userInfo.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜wishlist.css
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜withdrawal.css
 ┃ ┃ ┃ ┃ ┣ 📜reset.css
 ┃ ┃ ┃ ┃ ┣ 📜style.css
 ┃ ┃ ┃ ┃ ┗ 📜variable.css
 ┃ ┃ ┃ ┣ 📂dist
 ┃ ┃ ┃ ┃ ┣ 📜sockjs.js
 ┃ ┃ ┃ ┃ ┣ 📜sockjs.js.map
 ┃ ┃ ┃ ┃ ┣ 📜sockjs.min.js
 ┃ ┃ ┃ ┃ ┗ 📜sockjs.min.js.map
 ┃ ┃ ┃ ┣ 📂font
 ┃ ┃ ┃ ┃ ┣ 📜AirbnbCereal_W_Bd.otf
 ┃ ┃ ┃ ┃ ┣ 📜AirbnbCereal_W_Bk.otf
 ┃ ┃ ┃ ┃ ┣ 📜AirbnbCereal_W_Lt.otf
 ┃ ┃ ┃ ┃ ┣ 📜AirbnbCereal_W_Md.otf
 ┃ ┃ ┃ ┃ ┣ 📜AirbnbCereal_W_XBd.otf
 ┃ ┃ ┃ ┃ ┣ 📜NotoSansKR-Bold.ttf
 ┃ ┃ ┃ ┃ ┣ 📜NotoSansKR-ExtraBold.ttf
 ┃ ┃ ┃ ┃ ┣ 📜NotoSansKR-ExtraLight.ttf
 ┃ ┃ ┃ ┃ ┣ 📜NotoSansKR-Light.ttf
 ┃ ┃ ┃ ┃ ┣ 📜NotoSansKR-Medium.ttf
 ┃ ┃ ┃ ┃ ┗ 📜NotoSansKR-Regular.ttf
 ┃ ┃ ┃ ┣ 📂img
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📂body
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜home.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜home72.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📂header
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜notifications.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜search.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜user.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📂navigation
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UNSTLogo.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜admin2.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜coupon.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜dashboard.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜event.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜host.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜inquiry.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜notice.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜unLogo.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜user.png
 ┃ ┃ ┃ ┃ ┣ 📂favi.ico
 ┃ ┃ ┃ ┃ ┃ ┣ 📜android-icon-144x144.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜android-icon-192x192.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜android-icon-36x36.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜android-icon-48x48.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜android-icon-72x72.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜android-icon-96x96.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-114x114.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-120x120.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-144x144.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-152x152.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-180x180.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-57x57.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-60x60.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-72x72.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-76x76.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon-precomposed.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜apple-icon.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜browserconfig.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜favicon-16x16.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜favicon-32x32.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜favicon-96x96.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜favicon.ico
 ┃ ┃ ┃ ┃ ┃ ┣ 📜manifest.json
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ms-icon-144x144.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ms-icon-150x150.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ms-icon-310x310.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜ms-icon-70x70.png
 ┃ ┃ ┃ ┃ ┣ 📂logo
 ┃ ┃ ┃ ┃ ┃ ┣ 📜big_logo_color_bgd.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜big_logo_no_bgd.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜big_logo_white_bgd.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜btn-logo-google.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜btn-logo-kakao.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo-google.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo-kakao.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜logo.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜small_logo_color_bgd.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜small_logo_no_bgd2.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜small_logo_white_bgd.png
 ┃ ┃ ┃ ┃ ┣ 📂mock
 ┃ ┃ ┃ ┃ ┃ ┣ 📜profile-img.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reviewer1.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reviewer2.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reviewer3.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reviewer4.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reviewer5.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜reviewer6.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room-mock-img.webp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room-mock-img2.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room1.webp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room2.webp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room3.webp
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room4.webp
 ┃ ┃ ┃ ┃ ┃ ┗ 📜room5.webp
 ┃ ┃ ┃ ┃ ┣ 📂nav-search-img
 ┃ ┃ ┃ ┃ ┃ ┣ 📂category
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜apartment.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜camping.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜condominium.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜family-house.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hanok.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hostel.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜hotel.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜motel.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜officetels.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜outbuilding.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜pension.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜residence.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜resort.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📂view
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜beach.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜city.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜garden.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜golf.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜harbor.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜lake.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜mountain.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜park.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜resort.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜river.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sea.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜swimming-pool.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜valley.png
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜yard.png
 ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icons8-circle-16-green.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icons8-circle-16-red.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜icons8-circle-16-yellow.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜prepaer_img.jpeg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜room1.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜top-icn1.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜top-icn2.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜top-icn3.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜unwished.png
 ┃ ┃ ┃ ┃ ┃ ┗ 📜wished.png
 ┃ ┃ ┃ ┃ ┣ 📂spinner
 ┃ ┃ ┃ ┃ ┃ ┗ 📜spinner.gif
 ┃ ┃ ┃ ┃ ┣ 📂symbol
 ┃ ┃ ┃ ┃ ┃ ┣ 📜caution.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜check-square-svgrepo-com.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜cross-svgrepo-com.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜filter_km.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plus-svgrepo-com.svg
 ┃ ┃ ┃ ┃ ┃ ┣ 📜x-square-svgrepo-com.svg
 ┃ ┃ ┃ ┃ ┃ ┗ 📜x_mark_km.svg
 ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bars-3.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜default_profile_icon.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜issue.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜search-icon-white.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜search-icon.png
 ┃ ┃ ┃ ┃ ┃ ┣ 📜star-pink.svg
 ┃ ┃ ┃ ┃ ┃ ┗ 📜star-white.svg
 ┃ ┃ ┃ ┣ 📂js
 ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┣ 📜dashBoard.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hostingManagement.js
 ┃ ┃ ┃ ┃ ┃ ┗ 📜register.js
 ┃ ┃ ┃ ┃ ┣ 📂chat
 ┃ ┃ ┃ ┃ ┃ ┣ 📜chat.js
 ┃ ┃ ┃ ┃ ┃ ┗ 📜contact_host.js
 ┃ ┃ ┃ ┃ ┣ 📂main
 ┃ ┃ ┃ ┃ ┃ ┗ 📜main.js
 ┃ ┃ ┃ ┃ ┣ 📂payment
 ┃ ┃ ┃ ┃ ┃ ┗ 📜payment.js
 ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┣ 📜book.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜bookingShare.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomDetail.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomEnroll.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomManagement.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomModify.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜roomPhotoEnroll.js
 ┃ ┃ ┃ ┃ ┃ ┗ 📜roomReEnroll.js
 ┃ ┃ ┃ ┃ ┗ 📂user
 ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜header.js
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜nav.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜join.js
 ┃ ┃ ┃ ┃ ┃ ┣ 📜joinOauth.js
 ┃ ┃ ┃ ┃ ┃ ┗ 📜userInfo.js
 ┃ ┃ ┃ ┣ 📂user_profile_img
 ┃ ┃ ┃ ┗ 📜.DS_Store
 ┃ ┃ ┗ 📜.DS_Store
 ┃ ┗ 📜.DS_Store
 ┣ 📂test
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂com
 ┃ ┃ ┃ ┗ 📂universestay
 ┃ ┃ ┃ ┃ ┗ 📂project
 ┃ ┃ ┃ ┃ ┃ ┣ 📂admin
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜EventDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜RegisterDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserManagementDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┣ 📂common
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂S3
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜S3ConfigTest.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂notice
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NoticeControllerTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NoticeDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NoticePageHandlerTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜NoticeServiceImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂review
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomReviewControllerTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜ReviewDaoTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomReviewServiceTest.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂room
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜RoomDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📂user
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜HostBookingManagementDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserWithdrawalDaoImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜UserWithdrawalServiceImplTest.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜DBConnectionTest.java
 ┃ ┗ 📂resources
 ┃ ┃ ┗ 📜empty.txt
 ┗ 📜.DS_Store
```

</div>
</details>

---
## 설계 문서 📑
  ### ERD
  <details>
    <summary>ERD</summary>
    <div markdown="1">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/52e09512-995e-46db-9946-37b87c666356">
    </div>
  </details>

  ### FIGMA
  <details>
    <summary>FIGMA</summary>
    <div markdown="2">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/80ce260c-4b37-49b6-9b8c-c913129dabfb" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/66389a31-f6c7-4620-9785-3b9c7f6983f3" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/3405e43a-56fa-406c-870a-b95e275695db" width="400px" height="300px">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/3bc1474e-51d0-4c21-9fad-137e028cdcb6b" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/a192d7dc-90c9-4f4d-8ff1-9bd0391e4a99" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/bb481f57-9fc1-47c2-bfb0-e8383d420f5b" width="400px" height="300px">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/cdc8357b-df98-423a-a798-31ee6fd663ae" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/77f3a9d4-a159-426c-b43c-5c9293ae59d7" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/33a2acca-004d-43f3-b56d-c1515307811e" width="400px" height="300px">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/6244250c-3988-4f33-bf7f-685f74763a72" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/d31805b8-4d44-4a75-b01c-6feca1e481e4" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/2dc2283b-c49f-4fb0-8ae1-2efb5a496c94" width="400px" height="300px">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/90e0a2bd-f474-4788-9687-b4cd540cbaa0" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/78af6275-d5f6-4cf1-8804-75ac50aa4673" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/c60063c6-6445-4872-871f-a1faaf4e35b3" width="400px" height="300px">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/7158db11-c79b-490d-b0e0-9582fe6f23be" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/d8abf8f4-43f7-4457-b707-87f8977a2fff" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/5c57e113-2d46-423b-b4ce-b32d2c74ab60" width="400px" height="300px">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/5f4f019a-3e8b-4ade-b527-517e9e3aaf42" width="400px" height="300px"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/c14ec967-2795-4694-8ca8-400a41170632" width="400px" height="300px"> 
    </div>
  </details>

  ---
  ## 아키텍처 🌐
   <details>
    <summary>ARCHITECTURE</summary>
    <div markdown="3">
      <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/03d9997d-1e8b-4275-a319-2bca40e08a16">
    </div>
  </details>

  ---
  ## 서비스 화면 🖥️
  

  ---
  ## 회의 문서 📝
  <a href="https://verbena-scallop-776.notion.site/ecc1a1b152bd424393620b1c54c3be88?v=88cee01f5126410ca97078bf71695319&pvs=4">    데일리 스크럼</a>
   

  --- 
  ## 팀 소개 🩷

  <table align="center">
  <tr>
    <td align="center"><a href="https://github.com/jinkwon9301"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/2a7d5391-10af-4dbf-8f1b-cd1dd57d25d8" width="100px;" height="120px;" alt=""/><br /><sub><b>김진권</b></sub></a></td>
    <td align="center"><a href="https://github.com/hanna-ryu"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/dad1cdf8-8c78-46f0-bfa4-c43c774e3c46" width="100px;" height="120px;" alt=""/><br /><sub><b>류한나</b></sub></a></td>
    <td align="center"><a href="https://github.com/m11ng"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/9d5597a4-2dc1-40d8-b1c6-36b7bcc0e094" width="100px;" height="120px;" alt=""/><br /><sub><b>방예림</b></sub></a></td>
    <td align="center"><a href="https://github.com/beautiflow"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/4df68396-8d19-4629-819a-a7241551e1ba" width="100px;" height="120px;" alt=""/><br /><sub><b>오나연</b></sub></a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/ssunghoon"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/01ca5da2-3cb0-4d2f-b2f7-0a8129258f9e" width="100px;" height="120px;" alt=""/><br /><sub><b>이성훈</b></sub></a></td>
    <td align="center"><a href="https://github.com/Hojin37"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/a3702372-e0d1-451d-928e-abe9c86312dd" width="100px;" height="120px;" alt=""/><br /><sub><b>장호진</b></sub></a></td>
    <td align="center"><a href="https://github.com/simplist119"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/a32ae475-6a4e-4112-9958-5ead8c06861b" width="100px;" height="120px;" alt=""/><br /><sub><b>정경민</b></sub></a></td>
    <td align="center"><a href="https://github.com/nickhealthy"><img src="https://github.com/GeumZzoks/universeStay/assets/105831341/e3acdc64-99e7-4e95-8b70-bbebc1b79017" width="100px;" height="120px;" alt=""/><br /><sub><b>주성우</b></sub></a></td>
  </tr>
   </table>

---
### 팀 규칙 👮
<details>
  <summary>팀 규칙</summary>
    <div markdown="2">
        <img src="https://github.com/GeumZzoks/universeStay/assets/105831341/157bf482-6528-4ccd-9239-46b57750a2d5" width="800px;" height="750px;" >
    </div>
  </details>
