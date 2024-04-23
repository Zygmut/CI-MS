async function call(url) {
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error("Error in database response: ${response.status}");
    }

    return await response.json();
}

document.addEventListener("DOMContentLoaded", async () => {
    const username = getUsername();
    console.log(username);
    if (username !== null) {
        document.getElementById("username").innerText = username;
    }

    const query = await call("/api/catalogo.php");
    const articles = document.getElementById("articles");

    for (const plant of query.plantas) {
        articles.insertAdjacentHTML("beforeend", `
            <article class="w-min-10 flex max-w-md grow flex-col gap-3">
                <img src="${plant.imagen}" alt="${plant.nombre}" class="rounded-2xl">
                <h2 class="text-xl">${plant.nombre}</h2>
                <p>${plant.descripcion}</p>
                <div class="text-light flex gap-2">
                    <a class="bg-primary grow rounded-full p-3 text-center" href="/plantas.html?id=${plant.id}">
                        <i class="fa fa-solid fa-circle-info p-1"></i>
                        Más
                    </a>
                    <button class="bg-primary grow rounded-full p-3">
                        <i class="fa fa-solid fa-cart-shopping p-1"></i>
                        <span>Añadir</span>
                    </button>
                </div>
            </article>
        `);
    }
});

function getUsername() {
    const URLparams = new URLSearchParams(window.location.search);
    return URLparams.get("username");
}