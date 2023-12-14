// 카카오 맵 API
const mapContainer = document.querySelector(".screens-room-roomDetail__map"), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

// 지도를 생성합니다
const map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
const geocoder = new kakao.maps.services.Geocoder();

console.dir(geocoder);

// 주소로 좌표를 검색합니다
geocoder.addressSearch(roomAddress, function (result, status) {

    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {

        const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        const marker = new kakao.maps.Marker({
            map: map, position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        const infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px; text-align:center; padding:6px 3px; background: #FF365A; color: #FFFFFF; font-family: NotoSansKR-Medium">숙소위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }
});

// 예약하기 버튼 누르고 예약 창으로 넘어가기
const submitButton = document.getElementById("submit-button");
submitButton.addEventListener("click", function (ev) {
    const roomId = document.getElementById("submit-button").getAttribute(
            "value");

    const bookingDto = {
        booking_checkin_date: document.getElementById(
                "check-in-button").innerText,
        booking_checkout_date: document.getElementById(
                "check-out-button").innerText,
        booking_num_of_guest: document.getElementById(
                "totalGuest-button").innerText,
    }

    console.log(bookingDto);
    console.log(encodeURIComponent(bookingDto.booking_checkin_date))

    location.href = `/room/book/${roomId}`
            + `?booking_checkin_date=${bookingDto.booking_checkin_date}&booking_checkout_date=${bookingDto.booking_checkout_date}&booking_num_of_guest=${bookingDto.booking_num_of_guest}`;
});
