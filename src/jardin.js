async function call(url) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error("Error in database response: ${response.status}");
  }

  return await response.json();
}

document.addEventListener("DOMContentLoaded", async () => {
  let query = await call("/mock_gar.json");

  const gardensHTML = await Promise.all(
    query.map(async (element) => {
      return createGarden(
        element["nombre"],
        element["location"],
        element["characteristics"],
        element["descripcion"],
        element["valoracion"],
        element["imagen"]// Pass the URL of the image blob
      );
    })
  );

  document.getElementById("test").innerHTML = gardensHTML.join("\n");
});

function createCharacteristic(name) {
  return `
  <div class="badge bg-success rounded-pill p-2">
    ${name}
  </div>
  `;
}

function createGarden(
  name,
  location,
  characteristics,
  description,
  valoration,
  image
) {
  return `
    <div class="garden card my-5 p-0">

        <article class="row card-header m-0 px-3">
          <div class="col-6 p-0">
            <h2 id="name" class="p-0 m-0 text-start">${name}</h2>
          </div>
          <div class="col-6 p-0">
            <h3 id="location" class="p-0 m-0 text-end text-secondary">${location}</h3>
          </div>
        </article>

        <div class="card-body row gx-4 gx-lg-5  p-0 m-3">

          <!-- Left side -->
          <div class="col-xl-6 p-1">
            <img class="card-img-top" src="${image}" alt="..." style="aspect-ratio: 1/1; object-fit: cover;"/>
          </div>

          <!-- Right side -->
          <div class="col-xl-6 p-1 top-0">
            <div>
              <h3>Characteristics</h3>

              <div>
                ${characteristics.map(createCharacteristic).join("\n")}
              </div>
            </div>

            <div>
              <h3 class="pt-3">Description</h3>
              <p id="description" class="lead p-0" style="text-align: justify; ">
                ${description}
              </p>
            </div>
          </div>
        </div>
      </div>
  `;
}
