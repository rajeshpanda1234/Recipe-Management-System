const searchInput = document.getElementById("search-input");

const searchContent = document.getElementById("search-content");

searchInput.addEventListener("input", async (e) => {
  const baseURL = "http://127.0.0.1:8000/";

  const inputText = searchInput.value;

  try {
    const response = await fetch(baseURL + "test?" + `inputText=${inputText}`);

    if (!response.ok) {
      throw new Error("Error: " + response.status);
    }

    const data = await response.json();

    console.log(data.data);

    if (data.data.length) {
      // Handle the data
      const html = data.data
        .map((ele) => {
          return `<a href="${baseURL}recipe/${
            ele.category}/${ele.id}">${ele.title}</a>`;
        })
        .join("\n");

      searchContent.innerHTML = html;
      searchContent.style.display = "flex";
    } else {
      searchContent.style.display = "none";
    }
  } catch (error) {
    // Handle any errors
    console.error("Error:", error.message);
  }
});

// Event listener to detect clicks outside of the search input field
document.body.addEventListener("click", (event) => {
  // Check if the click target is not the search input or search content
  if (
    !searchInput.contains(event.target) &&
    !searchContent.contains(event.target)
  ) {
    // Hide the search content
    searchContent.style.display = "none";
  }
});