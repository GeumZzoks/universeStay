//-- category 버튼을 누르면 그에 해당하는 상태 코드를 가진 숙소들을 뿌려주는 코드 --//
const categoryIcons = document.querySelectorAll(
        ".components-user-nav__category");

for (const categoryIcon of categoryIcons) {
    const categoryStatusId = categoryIcon.getAttribute("value");
    categoryIcon.addEventListener("click", () => {
        location.href = "/room/search/" + categoryStatusId;
    })
}

