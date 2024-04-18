async function call(url) {
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error("Error in database response: ${response.status}");
    }

    return await response.json();
}

document.addEventListener("DOMContentLoaded", async () => {
    const query = await call("../server/catalogo.php")
    const articles = document.getElementById("articles");

    for (const plant of query) {
        articles.insertAdjacentHTML("beforeend", ```
            <article class="w-min-10 flex max-w-md grow flex-col gap-3">
                <img src="${plant.imagen}" alt="${plant.nombre}" class="rounded-2xl">
                <h2 class="text-xl">${plant.nombre}</h2>
                <p>${plant.descripcion}</p>
                <div class="text-light flex gap-2">
                    <button class="bg-primary grow rounded-full p-3">
                        <i class="fa fa-solid fa-circle-info p-1"></i>
                        <a href="/plantas.html?id=${plant.id}">Más</a>
                    </button>
                    <button class="bg-primary grow rounded-full p-3">
                        <i class="fa fa-solid fa-cart-shopping p-1"></i>
                        <span>Añadir</span>
                    </button>
                </div>
            </article>
        ```);
    }
});