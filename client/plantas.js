async function call(url) {
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error("Error in database response: ${response.status}");
    }

    return await response.json();
}

document.addEventListener("DOMContentLoaded", async () => {
    query = await call("http://127.0.0.1:5500/client/prueba.json")
    console.log(query.nombre)
    console.log(query)
    document.getElementById("plant_name").innerHTML=query.nombre
    document.getElementById("sci_name").innerHTML="biel"
    document.getElementById("price").innerHTML=query.coste
    document.getElementById("plant_description").innerHTML=query.descripcion
    for (let index = 0; index < query.caracteristicas.length; index++) {
        document.getElementById("plant_char").innerHTML+="<li><a href=\"#!\">Web Design</a></li>"
    }
    
        
    
});
    