const dropArea = document.querySelector("#drop-area");
const imgView = document.querySelector("#img-view");
const inputFile = document.querySelector("#input-file");

inputFile.addEventListener("input", (e) => {
    e.preventDefault();
    const imgLink = URL.createObjectURL(inputFile.files[0]);
    uploadImage(imgLink);
});

const uploadImage = (imgLink) => {
  imgView.style.backgroundImage = `url(${imgLink})`;
  imgView.textContent = "";
  imgView.style.border = 0;
};

dropArea.addEventListener("dragover", (e) => {
  e.preventDefault();
});

dropArea.addEventListener("drop", (e) => {
  e.preventDefault();
  inputFile.files = e.dataTransfer.files;
  const imgLink = URL.createObjectURL(inputFile.files[0]);
  uploadImage(imgLink);
});