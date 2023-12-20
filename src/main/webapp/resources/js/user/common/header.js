// ------------------------ 메인 검색 ajax 코드  ----------------------------------------//

$(".components-user-header__header__searchbar__search-btn").click(function () {
  // 사용자가 입력한 정보
  const searchInfo = {
    address: $(
        '.components-user-header__where__default').text().trim().replace(
        /\n/g, ''),
    search_capa: $(
        '.components-user-header__people_default').text().trim().replace(
        /\n/g, ''),
    search_start_date: $('input[name="datefilter"]').data(
        'daterangepicker').startDate.format('YYYY-MM-DD'),
    search_end_date: $('input[name="datefilter"]').data(
        'daterangepicker').endDate.format('YYYY-MM-DD'),
    search_min_price: $('.components-user-header__min-input').val(),
    search_max_price: $('.components-user-header__max-input').val(),
  };

  console.log(searchInfo);

  $.ajax({
    type: "POST",
    url: "/room/search", // 메인 검색 컨트롤러
    contentType: "application/json",
    data: JSON.stringify(searchInfo),
    success: function (response) {
      $('.screens-user-main__room__wrapper:last').after(response);
    },
    error: function (error) {
      console.error("검색 실패:", error);
    }
  });
});

document.querySelector(
    ".components-user-header__header__searchbar__search-btn").addEventListener(
    "click", function () {
      const searchInfo = {
        address: $(
            '.components-user-header__where__default').text().trim().replace(
            /\n/g, ''),
        search_capa: $(
            '.components-user-header__people_default').text().trim().replace(
            /\n/g, ''),
        search_start_date: $('input[name="datefilter"]').data(
            'daterangepicker').startDate.format('YYYY-MM-DD'),
        search_end_date: $('input[name="datefilter"]').data(
            'daterangepicker').endDate.format('YYYY-MM-DD'),
        search_min_price: $('.components-user-header__min-input').val(),
        search_max_price: $('.components-user-header__max-input').val(),
    };

    $.ajax({
        type: "POST",
        url: "/room/search", // 메인 검색 컨트롤러
        contentType: "application/json",
        data: JSON.stringify(searchInfo),
        success: function (response) {
            $('.screens-user-main__room__wrapper:last').after(response);
        },
        error: function (error) {
            console.error("검색 실패:", error);
        }
    });
});

document.querySelector(
        ".components-user-header__header__searchbar__search-btn").addEventListener(
        "click", function () {
            const searchInfo = {
                address: $(
                        '.components-user-header__where__default').text().trim().replace(
                        /\n/g, ''),
                search_capa: $(
                        '.components-user-header__people_default').text().trim().replace(
                        /\n/g, ''),
                search_start_date: $('input[name="datefilter"]').data(
                        'daterangepicker').startDate.format('YYYY-MM-DD'),
                search_end_date: $('input[name="datefilter"]').data(
                        'daterangepicker').endDate.format('YYYY-MM-DD'),
                search_min_price: $('.components-user-header__min-input').val(),
                search_max_price: $('.components-user-header__max-input').val(),
            };

            // URL 생성
            const url = "/?" +
                    "address=" + searchInfo.address +
                    "&search_capa=" + searchInfo.search_capa +
                    "&search_start_date=" + searchInfo.search_start_date +
                    "&search_end_date=" + searchInfo.search_end_date +
                    "&search_min_price=" + searchInfo.search_min_price +
                    "&search_max_price=" + searchInfo.search_max_price;

            // 페이지 새로고침을 통한 GET 요청
            window.location.href = url;
        });

//달력 인풋이 아닌 체크인/체크아웃 버튼 영역을 눌러도 달력이 열리고 닫히도록 설정
document.addEventListener('DOMContentLoaded', function () {
  const checkinBtn = document.querySelector(
      '.components-user-header__header__searchbar__checkin-btn');

  checkinBtn.addEventListener('click', function () {
    document.querySelectorAll(
        '.components-user-header__dropdown-div').forEach(
        function (dropdown) {
          dropdown.classList.remove('show');
        });

    // input[name="datefilter"] 요소를 클릭하는 것과 같은 효과
    document.querySelector('input[name="datefilter"]').click();
  });
});

//버튼들을 누르면 드롭다운이 내려오면서 클래스 이름에 'show'가 토글됨, 그런데 드롭다운 하위 요소들에게도 이벤트가 전파되어서 드롭다운 요소를 누르면 드롭다운이 자꾸 꺼짐.
//그것을 막기 위한 이벤트 전파 중단 코드
let dropdowns = document.querySelectorAll(
    '.components-user-header__dropdown-div');

document.addEventListener("click", function (e) {
  if (e.target.classList.contains(
          "components-user-header__header__searchbar__main_txt") ||
      e.target.classList.contains(
          "components-user-header__header__searchbar__sub_txt") ||
      e.target.classList.contains(
          "components-user-header__header__profile__my-profile") ||
      e.target.classList.contains(
          "components-user-header__header__profile__my-profile__btn")
      ||
      e.target.classList.contains(
          "components-user-header__header__profile__hamburger") ||
      e.target.classList.contains(
          "components-user-header__header__profile__img") ||
      e.target.classList.contains(
          "components-user-header__header__searchbar__checkin-btn")
  ) {
    return;
  }

  dropdowns.forEach(dropdown => {
    if (dropdown.classList.contains("show")) {
      dropdown.classList.remove("show");
    }
  });
});

dropdowns.forEach(dropdown => {
  dropdown.addEventListener('click', function (event) {
    event.stopPropagation(); // 드롭다운 요소가 클릭되었을 때 이벤트 전파 중단
  });
});

//-----------------------------------------------------------------

//코드에 중복이 많아서 해결하고 싶음.
const dropdownDiv = document.getElementsByClassName(
    "components-user-header__dropdown-div");

// '어디로'를 눌렀을때 발현하는 함수
const toggleDropdown1 = function () {

  if (dropdownDiv[0].classList.contains("show")) {
    dropdownDiv[0].classList.remove("show");
    return;
  }
    dropdowns.forEach(dropdown => {
        if (dropdown.classList.contains("show")) {
            dropdown.classList.remove("show");
        }
    });
    dropdownDiv[0].classList.toggle('show')
}
// '여행자'를 눌렀을때 발현하는 함수
const toggleDropdown2 = function () {

  if (dropdownDiv[1].classList.contains("show")) {
    dropdownDiv[1].classList.remove("show");
    return;
  }

    dropdowns.forEach(dropdown => {
        if (dropdown.classList.contains("show")) {
            dropdown.classList.remove("show");
        }
    });
    dropdownDiv[1].classList.toggle('show')
}
//  '1박당 예산을 눌렀을 때 발현하는 함수
const toggleDropdown3 = function () {

  if (dropdownDiv[2].classList.contains("show")) {
    dropdownDiv[2].classList.remove("show");
    return;
  }

  dropdowns.forEach(dropdown => {
    if (dropdown.classList.contains("show")) {
      dropdown.classList.remove("show");
    }
  });
  dropdownDiv[2].classList.toggle('show');
}
// 마이프로필 버튼을 눌렀을때 발현하는 함수
const toggleDropdown4 = function () {
  dropdownDiv[3].classList.toggle('show')
}

//'어디로' 버튼 이벤트 추가
const headerSearchbarWhereBtn = document.querySelector(
    ".components-user-header__header__searchbar__where-btn");

headerSearchbarWhereBtn.addEventListener("click", toggleDropdown1);

// '여행자' 버튼 이벤트 추가
const headerSearchbarPeopleBtn = document.querySelector(
    ".components-user-header__header__searchbar__people-btn");

headerSearchbarPeopleBtn.addEventListener("click", toggleDropdown2);

// '1박당 예산' 버튼 이벤트 추가
const headerSearchbarMoneyBtn = document.querySelector(
    ".components-user-header__header__searchbar__money-btn")

headerSearchbarMoneyBtn.addEventListener("click", toggleDropdown3)

//마이프로필 버튼 이벤트 추가
const headerMyProfileBtn = document.querySelector(
    ".components-user-header__header__profile__my-profile__btn");

headerMyProfileBtn.addEventListener("click", toggleDropdown4);

//이벤트 전파로 인한 버그 방지 코드
const inputField = document.querySelector(
    '.components-user-header__header__searchbar__where input');
inputField.addEventListener('click', function (event) {
  event.stopPropagation(); // 이벤트 전파 중단
});

//---------------------- '어디로' 버튼 관련 코드 --------------------------------------------
//'어디로'검색 인풋에 글자 입력하면 화면에 띄워주는 코드
inputField.addEventListener('input', function (event) {
  const text = event.target.value; // 입력된 텍스트 값
  const destinationDiv = document.querySelector(
      '.components-user-header__header__searchbar__where-btn div');
  // 입력된 텍스트 값을 상단 버튼쪽에 보여준다.
  destinationDiv.textContent = text;
});

// 직접 검색하는 인풋창에 스페이스바 입력 시 드롭다운이 자꾸 꺼져서, 기본 동작을 방지하는 코드 작성
inputField.addEventListener('keydown', function (event) {
  if (event.key === ' ') {
    event.preventDefault();
  }
});

const dropdownOptions = document.querySelectorAll(
    '.components-user-header__dropdown__place-option');
const whereSubTextElement = document.querySelector(
    '.components-user-header__where__default');

// 서울, 제주 등 키워드를 누르면 그 키워드가 입력되도록 하는 코드
dropdownOptions.forEach(option => {
  //지역 요소들을 돌면서 클릭된 요소의 이름을 가져와서 보여준다.
  option.addEventListener('click', function () {
    const selectedText = this.querySelector('span').innerText;
    whereSubTextElement.textContent = selectedText;
  });
});

//---------------------- '여행자' 숫자 증감  관련 --------------------------------------------

//'여행자' 숫자를 조절하는 함수
const minusCount = document.getElementsByName("remove-circle-outline")[0];
const plusCount = document.getElementsByName("add-circle-outline")[0];
const peopleCount = document.getElementsByClassName(
    "components-user-header__people-count")[0];
const peopleSubTextElement = document.querySelector(
    '.components-user-header__people_default');

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

//---------------- 1박당 예산 관련 코드 -------------
const minInput = document.querySelector('.components-user-header__min-input');
const maxInput = document.querySelector('.components-user-header__max-input');

// 입력된 숫자를 만원 단위로 변환하는 함수
function convertToTenThousand(value) {
  if (!value || isNaN(value)) {
    return '';
  } // 값이 없거나 숫자가 아니면 빈 문자열 반환
  const number = parseFloat(value);
  const tenThousandValue = number / 10000; // 만원 단위로 변환
  return tenThousandValue.toFixed(1); // 소수점 첫째 자리까지 반환
}

// 입력 필드에서 값이 변경될 때 마다 호출될 함수
function syncValues() {
  const minTxtElement = document.querySelector(
      '.components-user-header__header__searchbar__sub_txt__min');
  const maxTxtElement = document.querySelector(
      '.components-user-header__header__searchbar__sub_txt__max');

    minTxtElement.textContent = priceToString(minInput.value); // minInput 값 변환하여 적용
    maxTxtElement.textContent = priceToString(maxInput.value); // maxInput 값 변환하여 적용
}

// 입력 필드에서 값이 변경될 때마다 syncValues 함수 호출
minInput.addEventListener('input', syncValues);
maxInput.addEventListener('input', syncValues);

//화면이 로드될때마다 실행
document.addEventListener('DOMContentLoaded', function () {
    syncValues(); // 페이지가 로드되면 syncValues 함수를 실행합니다.
});

//---------------------- 각 메뉴 & 컨트롤러 맵핑 --------------------------------------------
const signUpBtn = document.querySelector(
    ".components-user-header__dropdown__option-sign-up");
const signInBtn = document.querySelector(
    ".components-user-header__dropdown__option-sign-in");
const logOutBtn = document.querySelector(
    ".components-user-header__dropdown__option-log-out");

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
