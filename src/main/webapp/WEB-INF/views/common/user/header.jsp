<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/common/global.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <title>header</title>
</head>
<body>
<header class="header">
    <div class="header__inner">

        <!-- 헤더 로고 영역-->
        <div class="header__logo">
            <a href="#" class="logo__link">
                <img class="logo" src="/resources/img/logo/small_logo_no_bgd2.png"/>
            </a>
        </div>
    </div>

    <!--헤더 검색바 영역-->
    <div class="header__searchbar">
        <div class="header__searchbar__inner">

            <button class="dropdown header__searchbar__where-btn">
                <span class="header__searchbar__main_txt">어디로</span>
                <div class="header__searchbar__sub_txt">___</div>
                <div class="dropdown-div header__searchbar__where">
                    <input class="dropdown__input" placeholder="가고싶은 지역을 입력하세요."/>
                    <div class="dropdown__option"><span>국내 전체</span></div>
                    <div class="dropdown__option"><span>서울</span></div>
                    <div class="dropdown__option"><span>강원</span></div>
                    <div class="dropdown__option"><span>부산</span></div>
                    <div class="dropdown__option"><span>경기</span></div>
                    <div class="dropdown__option"><span>충청</span></div>
                    <div class="dropdown__option"><span>경상</span></div>
                    <div class="dropdown__option"><span>전라</span></div>
                    <div class="dropdown__option"><span>인천</span></div>
                    <div class="dropdown__option"><span>광주</span></div>
                    <div class="dropdown__option"><span>대전</span></div>
                    <div class="dropdown__option"><span>대구</span></div>
                    <div class="dropdown__option"><span>울산</span></div>
                </div>
            </button>

            <span class="header__searchbar__divide-line"></span>
            <div>
                <button>
                    <span class="header__searchbar__main_txt">체크인</span>
                    <div class="header__searchbar__sub_txt">____</div>
                </button>

            </div>
            <span class="header__searchbar__divide-line"></span>
            <div>
                <button>
                    <span class="header__searchbar__main_txt">체크아웃</span>
                    <div class="header__searchbar__sub_txt">____</div>
                </button>


            </div>
            <span class="header__searchbar__divide-line"></span>
            <div>
                <button>
                    <span class="header__searchbar__main_txt">여행자</span>
                    <div class="header__searchbar__sub_txt">____명</div>
                </button>
            </div>
            <span class="header__searchbar__divide-line"></span>
            <div>
                <button>
                    <span class="header__searchbar__main_txt">예산은</span>
                    <div class="header__searchbar__sub_txt">____원~____원</div>
                </button>
            </div>
            <button class="header__searchbar__search-btn">
                <img src="/resources/img/icon/search-icon-white.png">
            </button>
        </div>
    </div>

    <!--헤더 프로필 영역-->
    <div class="header__profile">
        <div class="header__profile__to-host">
            <a href="#">
                <div>호스트 모드로 전환</div>
            </a>
        </div>
        <div class="header__profile__my-profile dropdown">
            <button class="header__profile__my-profile__btn">
                <div header__profile__my-profile__wrapper>
                    <img src="/resources/img/icon/bars-3.png"/>
                    <img class="header__profile__img"
                         src="/resources/img/icon/default_profile_icon.png"/>
                </div>
                <div class="header__profile__option dropdown-div">
                    <div class="dropdown__option dropdown__option-msg"><span>메시지</span>
                    </div>
                    <div class="dropdown__option dropdown__option-reservation" onclick="">
                        <span>여행</span></div>
                    <div class="dropdown__option dropdown__option-wishlist" onclick="">
                        <span>위시리스트</span></div>
                    <div class="dropdown__option dropdown__option-reviews" onclick="">
                        <span>나의 리뷰</span></div>
                    <div class="dropdown__option dropdown__option-account" onclick="">
                        <span>계정</span></div>
                    <div class="dropdown__option dropdown__option-log-out" onclick="">
                        <span>로그아웃</span></div>
                </div>
            </button>
        </div>

    </div>

    </div>

</header>
<div class="line"></div>

</body>

<script>
    const dropdownDiv = document.getElementsByClassName("dropdown-div");

    // '어디로'를 눌렀을때 발현하는 함수
    const toggleDropdown1 = function () {
        dropdownDiv[0].classList.toggle('show')
    }

    // 마이프로필 버튼을 눌렀을때 발현하는 함수
    const toggleDropdown4 = function () {
        dropdownDiv[1].classList.toggle('show')
    }

    const headerSearchbarWhereBtn = document.querySelector(".header__searchbar__where-btn");
    headerSearchbarWhereBtn.addEventListener("click", toggleDropdown1);

    //마이프로필 버튼 이벤트 추가
    const headerMyProfileBtn = document.querySelector(".header__profile__my-profile__btn");
    headerMyProfileBtn.addEventListener("click", toggleDropdown4);

    //이벤트 전파로 인한 버그 방지 코드
    const inputField = document.querySelector('.header__searchbar__where input');
    inputField.addEventListener('click', function (event) {
        event.stopPropagation(); // 이벤트 전파 중단
    });

    //'어디로'검색 인풋에 글자 입력하면 화면에 띄워주는 코드
    inputField.addEventListener('input', function (event) {
        const text = event.target.value; // 입력된 텍스트 값
        const destinationDiv = document.querySelector('.header__searchbar__where-btn div');
        destinationDiv.textContent = text; // 입력된 텍스트가 없을 경우 기본값으로 설정
    });
    // 스페이스바 입력 시 기본 동작 방지
    inputField.addEventListener('keydown', function (event) {
        if (event.key === ' ') {
            event.preventDefault();
        }
    });

    const dropdownOptions = document.querySelectorAll('.dropdown__option');
    const subTextElement = document.querySelector('.header__searchbar__sub_txt');

    // 서울, 제주 등 키워드를 누르면 그 키워드가 입력되도록 하는 코드
    dropdownOptions.forEach(option => {
        option.addEventListener('click', function () {
            const selectedText = this.querySelector('span').innerText;
            subTextElement.textContent = selectedText;
        });
    });

    // 문서 전체에서 드롭다운 메뉴가 아닌 다른 곳을 클릭했을 때는 'show'라는 클래스 이름을 제거한다.
    document.addEventListener('click', function (event) {
        const dropdowns = document.querySelectorAll('.dropdown-div');
        const buttons = document.querySelectorAll('.dropdown');

        dropdowns.forEach((dropdown, index) => {
            if (!dropdown.contains(event.target) && !buttons[index].contains(event.target)) {
                dropdown.classList.remove('show');
            }
        });
    });

</script>
</html>