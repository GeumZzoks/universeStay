// 숙소 대표 사진 등록
const btnPhotoMain = document.querySelector(
    ".screens-room-roomEnroll__btn-photo-main");
const inputPhotoMain = document.querySelector(
    ".screens-room-roomEnroll__input-photo-main");
const imgPhotoMain = document.querySelector(
    '.screens-room-roomEnroll__photo-main-img');
const prevUpload = document.querySelector(
    '.screens-room-roomEnroll__photo-main__prev-upload-photo');
const btnMorePhotoMain = document.querySelector(
    '.screens-room-roomEnroll__btn-more-photo-main');
const toggleUpdateOrDelete = document.querySelector(
    '.screens-room-roomEnroll__photo-main-toggle-update-delete');
const btnUpdate = document.querySelector(
    '.screens-room-roomEnroll__photo-main-btn-update');
const btnDelete = document.querySelector(
    '.screens-room-roomEnroll__photo-main-btn-delete');
btnPhotoMain.addEventListener("click", function () {
  inputPhotoMain.click();
});

btnMorePhotoMain.addEventListener("click", function () {
  toggleUpdateOrDelete.classList.toggle("active");
});

btnUpdate.addEventListener("click", function () {
  inputPhotoMain.click();
  toggleUpdateOrDelete.classList.toggle("active");
});

btnDelete.addEventListener("click", function () {
  imgPhotoMain.classList.remove("active");
  prevUpload.classList.remove("active");
  btnMorePhotoMain.classList.remove("active");
  imgPhotoMain.src = "";
  toggleUpdateOrDelete.classList.toggle("active");
  inputPhotoMain.files = null;
});

//프로필 이미지 미리 보여주기
function readURL(input) {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function (e) {
      imgPhotoMain.src = e.target.result;
      imgPhotoMain.classList.add("active");
      prevUpload.classList.add("active");
      btnMorePhotoMain.classList.add("active");
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    imgPhotoMain.src = "";
  }
}

// 서브 이미지 등록
const btnsPhotoSub = document.querySelectorAll(
    ".screens-room-roomEnroll__photo-sub");
const btnsPhotoSubMore = document.querySelectorAll(
    ".screens-room-roomEnroll__btn-more-photo-sub");
const btnsPhotoSubUpdate = document.querySelectorAll(
    ".screens-room-roomEnroll__photo-sub-btn-update");
const btnsPhotoSubDelete = document.querySelectorAll(
    ".screens-room-roomEnroll__photo-sub-btn-delete");

btnsPhotoSub.forEach(btnPhotoSub => {
  btnPhotoSub.addEventListener("click", handleBtnPhotoSub);
});

function handleBtnPhotoSub(e) {
  const fileInput = this.children[4];
  fileInput.click();
}

btnsPhotoSubMore.forEach(btnPhotoSubMore => {
  btnPhotoSubMore.addEventListener("click", (e) => {
    btnPhotoSubMore.nextElementSibling.classList.toggle("active");
  });
});

btnsPhotoSubUpdate.forEach(btnPhotoSubUpdate => {
  btnPhotoSubUpdate.addEventListener("click", (e) => {
    btnPhotoSubUpdate.parentElement.nextElementSibling.nextElementSibling.click();
    btnPhotoSubUpdate.parentElement.classList.toggle("active");
  });
});

btnsPhotoSubDelete.forEach(btnPhotoSubDelete => {
  btnPhotoSubDelete.addEventListener("click", (e) => {
    const toggle = btnPhotoSubDelete.parentElement;
    const img = btnPhotoSubDelete.parentElement.previousElementSibling.previousElementSibling;
    const btnMore = btnPhotoSubDelete.parentElement.previousElementSibling;
    const photoSub = btnPhotoSubDelete.parentElement.parentElement;

    img.src = "";
    toggle.classList.toggle("active");
    img.classList.remove("active");
    btnMore.classList.remove("active");
    setTimeout(() => {
      photoSub.addEventListener("click", handleBtnPhotoSub)
    }, 0);
  });
});

function readURLSub(input) {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function (e) {
      const btnMore = input.previousElementSibling.previousElementSibling.previousElementSibling;
      const img = input.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling;

      img.src = e.target.result;
      img.classList.add("active");
      btnMore.classList.add("active");
      input.parentElement.removeEventListener("click", handleBtnPhotoSub);
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    imgPhotoMain.src = "";
  }
}
