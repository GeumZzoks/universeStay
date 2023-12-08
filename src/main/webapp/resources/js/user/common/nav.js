/**
 * @param selector
 * @param path
 * @feat : nav바 이미지 버튼을 누르면 누른 버튼 (category, view)에 따라 다른 경로의 컨트롤러를 호출하는 메소드
 */
function handleRoomNavigation(selector, path) {
    const icons = document.querySelectorAll(selector);

    for (const icon of icons) {
        const statusId = icon.getAttribute("value");
        icon.addEventListener("click", () => {
            location.href = path + statusId;
        });
    }
}

// 카테고리 버튼 이벤트 처리
handleRoomNavigation(".components-user-nav__category", "/room/category/");
// 뷰 버튼 이벤트 처리
handleRoomNavigation(".components-user-nav__view", "/room/view/");
