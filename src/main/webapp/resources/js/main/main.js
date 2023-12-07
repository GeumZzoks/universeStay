//-- 메인 화면에서 숙소 클릭하면 숙소 상세로 이동 --//
const roomList = document.querySelectorAll(".screens-user-main__room__wrapper")
for (const room of roomList) {
    const roomId = room.getAttribute("value")
    room.addEventListener("click", () => {
        location.href = "/room/" + roomId;
    })
}