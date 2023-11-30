const checkAllBox = document.querySelector(
    ".screens-admin-hostingManagement__content-table__check-all");
const checkBoxs = document.querySelectorAll(
    ".screens-admin-hostingManagement__content-table__check");

checkAllBox.addEventListener("click", function (e) {
  if (e.target.checked) {
    checkBoxs.forEach(checkBox => {
      checkBox.checked = true;
    });
  } else {
    checkBoxs.forEach(checkBox => {
      checkBox.checked = false;
    });
  }
});
