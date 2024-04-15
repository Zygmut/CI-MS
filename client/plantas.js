async function call(query) {
    let url = "./php/conexion.php?q=" + query;
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error("Error in database response: ${response.status}");
    }

    return response.json();
}