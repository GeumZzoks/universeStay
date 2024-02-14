(() => {
  /**
   * 호스팅 숙소 승인 버튼
   * 승인 시 상태코드 변경
   *   - RA01(승인 전) -> RA02(승인 완료)
   * @type {NodeListOf<Element>}
   */
  const approveRoomButtons = document.querySelectorAll(
      ".screens-admin-dashboard__btn-span-confirm");

  for (let i = 0; i < approveRoomButtons.length; i++) {
    approveRoomButtons[i].addEventListener("click", function () {
      const roomId = approveRoomButtons[i].dataset.value;

      $.ajax({
        type: 'POST',
        url: "/admin/main/approveRoom",
        data: {"roomId": roomId},
        success: function (res) {
          window.location = "/admin/main/dashboard";

        },
        error: function (res) {
          console.log(res);
          window.location = "/admin/main/dashboard";
        },
      });
    });
  }

  /**
   * 호스팅 숙소 반려 버튼
   * 승인 시 상태코드 변경
   *   - RA01(승인 전) -> RA03(승인 반려)
   * @type {NodeListOf<Element>}
   */
  const rejectRoomButtons = document.querySelectorAll(
      ".screens-admin-dashboard__btn-span-reject");

  for (let i = 0; i < rejectRoomButtons.length; i++) {
    rejectRoomButtons[i].addEventListener("click", function () {
      const roomId = rejectRoomButtons[i].dataset.value;

      $.ajax({
        type: 'POST',
        url: "/admin/main/rejectRoom",
        data: {"roomId": roomId},
        success: function (res) {
          window.location = "/admin/main/dashboard";

        },
        error: function (res) {
          console.log(res);
          window.location = "/admin/main/dashboard";
        },
      });
    });
  }

  /**
   *
   * @type {NodeListOf<Element>}
   */
  const inquiryButtons = document.querySelectorAll(
      ".screens-admin-dashboard__btn-span-content");

  for (let i = 0; i < inquiryButtons.length; i++) {
    inquiryButtons[i].addEventListener("click", function () {
      const chatting_room_id = inquiryButtons[i].dataset.value;

      // TODO: 문의사항(경민) 완료되면 해당 URL 바꾸기
      // window.location.assign(`/admin/event/${inquiryId}`);
      $.ajax({
        type: 'POST',
        url: "/admin/main/assignInquiry",
        data: {"chatting_room_id": chatting_room_id},
        success: function () {
          console.log("성공")
          window.location = "/admin/main/dashboard";
        },
        error: function () {
          console.log("실패");
          window.location = "/admin/main/dashboard";
        },
      });
    });
  }

})()
