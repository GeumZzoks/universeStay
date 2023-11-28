const dropdowns = document.querySelectorAll('.dropdown-div');

dropdowns.forEach(dropdown => {
    dropdown.addEventListener('click', function (event) {
        event.stopPropagation(); // 드롭다운 요소가 클릭되었을 때 이벤트 전파 중단
    });
});

const dropdownDiv = document.getElementsByClassName("dropdown-div");
console.log(dropdownDiv)

// '어디로'를 눌렀을때 발현하는 함수
const toggleDropdown1 = function () {
    console.log(dropdownDiv[0].classList);
    dropdownDiv[0].classList.toggle('show')
    console.log(dropdownDiv[0].classList);
}

// '여행자'를 눌렀을때 발현하는 함수
const toggleDropdown2 = function () {
    console.log(dropdownDiv[1].classList);
    dropdownDiv[1].classList.toggle('show')
    console.log(dropdownDiv[1].classList);
}
//  '1박당 예산을 눌렀을 때 발현하는 함수
const toggleDropdown3 = function () {
    dropdownDiv[2].classList.toggle('show');
}
// 마이프로필 버튼을 눌렀을때 발현하는 함수
const toggleDropdown4 = function () {
    dropdownDiv[3].classList.toggle('show')
}

//'어디로' 버튼 이벤트 추가
const headerSearchbarWhereBtn = document.querySelector(
        ".header__searchbar__where-btn");
headerSearchbarWhereBtn.addEventListener("click", toggleDropdown1);

// '여행자' 버튼 이벤트 추가
const headerSearchbarPeopleBtn = document.querySelector(
        ".header__searchbar__people-btn");
headerSearchbarPeopleBtn.addEventListener("click", toggleDropdown2);

// '1박당 예산' 버튼 이벤트 추가
const headerSearchbarMoneyBtn = document.querySelector(
        ".header__searchbar__money-btn")
headerSearchbarMoneyBtn.addEventListener("click", toggleDropdown3)

//마이프로필 버튼 이벤트 추가
const headerMyProfileBtn = document.querySelector(
        ".header__profile__my-profile__btn");
headerMyProfileBtn.addEventListener("click", toggleDropdown4);

//이벤트 전파로 인한 버그 방지 코드
const inputField = document.querySelector('.header__searchbar__where input');
inputField.addEventListener('click', function (event) {
    event.stopPropagation(); // 이벤트 전파 중단
});

//---------------------- '어디로' 버튼 관련 코드 --------------------------------------------
//'어디로'검색 인풋에 글자 입력하면 화면에 띄워주는 코드
inputField.addEventListener('input', function (event) {
    const text = event.target.value; // 입력된 텍스트 값
    const destinationDiv = document.querySelector(
            '.header__searchbar__where-btn div');
    destinationDiv.textContent = text; // 입력된 텍스트가 없을 경우 기본값으로 설정
});

// 스페이스바 입력 시 드롭다운이 자꾸 꺼져서, 기본 동작을 방지하는 코드 작성
inputField.addEventListener('keydown', function (event) {
    if (event.key === ' ') {
        event.preventDefault();
    }
});

const dropdownOptions = document.querySelectorAll('.dropdown__place-option');
const whereSubTextElement = document.querySelector('.where__default');

// 서울, 제주 등 키워드를 누르면 그 키워드가 입력되도록 하는 코드
dropdownOptions.forEach(option => {
    option.addEventListener('click', function () {
        const selectedText = this.querySelector('span').innerText;
        whereSubTextElement.textContent = selectedText;
    });
});

//---------------------- '여행자' 숫자 증감  관련 --------------------------------------------

//'여행자' 숫자를 조절하는 함수
const minusCount = document.getElementsByName("remove-circle-outline")[0];
const plusCount = document.getElementsByName("add-circle-outline")[0];
const peopleCount = document.getElementsByClassName("people-count")[0];
const peopleSubTextElement = document.querySelector('.people_default');

let count = 2; // 초기값 설정 (기본 2명)

//마이너스 버튼 클릭시
minusCount.addEventListener('click', function (event) {
    event.stopPropagation(); // 이벤트 전파 중단
    if (count > 1) {
        count--;
        updatePeopleCount();
    }
});

// 플러스 버튼 클릭 시
plusCount.addEventListener('click', function (event) {
    event.stopPropagation(); // 이벤트 전파 중단
    count++;
    updatePeopleCount();
});

// peopleCount 업데이트 함수
function updatePeopleCount() {
    peopleCount.textContent = count;
    peopleSubTextElement.textContent = count; // 텍스트로 반영
}

//---------------------- 캘린더 라이브러리 --------------------------------------------
$(function () {
    $('input[name="datefilter"]').daterangepicker({
        autoUpdateInput: true,
        locale: {
            cancelLabel: 'Clear'
        }
    });

    $('input[name="datefilter"]').on('apply.daterangepicker',
            function (ev, picker) {
                $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - '
                        + picker.endDate.format(
                                'MM/DD/YYYY'));
            });

    $('input[name="datefilter"]').on('cancel.daterangepicker',
            function (ev, picker) {
                $(this).val('');
            });
});

//---------------------- 각 메뉴 & 컨트롤러 맵핑 --------------------------------------------

const signUpBtn = document.querySelector(".dropdown__option-sign-up");
const signInBtn = document.querySelector(".dropdown__option-sign-in");
const logOutBtn = document.querySelector(".dropdown__option-log-out");

//회원가입 컨트롤러 이동
signUpBtn.addEventListener("click", () => {
    location.href = "/user/join";
})

signInBtn.addEventListener("click", () => {
    location.href = "/user/loginForm";
})

logOutBtn.addEventListener("click", () => {
    location.href = "/user/withdrawal";
});