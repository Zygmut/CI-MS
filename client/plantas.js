async function call(url) {
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error("Error in database response: ${response.status}");
    }

    return await response.json();
}

document.addEventListener("DOMContentLoaded", async () => {
    query = await call("../server/plantas.php")
    document.getElementById("plant_name").innerHTML=query._nom_prod
    document.getElementById("sci_name").innerHTML="mussasapientum"
    document.getElementById("price").innerHTML=query.coste
    document.getElementById("prod_image").src=query.imagen
    document.getElementById("plant_description").innerHTML=query._desc_prod
    for (let index = 0; index < query.caracteristicas.length; index++) {
        document.getElementById("plant_char").innerHTML += "<li><a style='float: right;'>" + query.caracteristicas[index].valor + "</a>" + query.caracteristicas[index].nombre + "</li>";
    }
});
    