import random

def gen_r_pla_car():
    # Lista de IDs de planta y características existentes
    plant_ids = list(range(1, 1001))  # Suponiendo que tienes 1000 plantas
    car_ids = list(range(1, 1001))    # Suponiendo que tienes 1000 características

    # Generar relaciones ficticias
    relations = []
    for plant_id in plant_ids:
        # Escoger aleatoriamente algunas características para esta planta
        num_characteristics = random.randint(1, 5)  # Suponiendo que cada planta tiene entre 1 y 5 características
        selected_characteristics = random.sample(car_ids, num_characteristics)

        # Crear relaciones
        for car_id in selected_characteristics:
            relations.append((plant_id, car_id))

    # Formatear las relaciones para SQL
    sql_values = ",\n".join([f"({plant_id}, {car_id})" for plant_id, car_id in relations])
    return f"INSERT INTO R_PLA_CAR (_id_planta, _id_caracteristica) VALUES\n{sql_values};"

def gen_r_pla_tem():
    # Lista de IDs de planta y nombres de temporada existentes
    plant_ids = list(range(1, 1001))  # Suponiendo que tienes 1000 plantas
    season_names = ['Verano', 'Otoño', 'Invierno']  # Temporadas existentes

    # Generar relaciones ficticias
    relations = []
    for plant_id in plant_ids:
        # Escoger una temporada aleatoria para esta planta
        selected_season = random.choice(season_names)

        # Crear relación
        relations.append((plant_id, selected_season))

    # Formatear las relaciones para SQL
    sql_values = ",\n".join([f"({plant_id}, '{season_name}')" for plant_id, season_name in relations])
    return f"INSERT INTO R_PLA_TEM (_id_planta, nombre_temporada) VALUES\n{sql_values};"

if __name__ == "__main__":
    r_pla_car_sql = gen_r_pla_car()
    r_pla_tem_sql = gen_r_pla_tem()

    # Guardar las sentencias SQL en archivos
    with open("r_pla_car.sql", "w") as f:
        f.write(r_pla_car_sql)
    with open("r_pla_tem.sql", "w", encoding="utf-8") as f:
        f.write(r_pla_tem_sql)

    print("Sentencias SQL generadas y guardadas en archivos 'r_pla_car.sql' y 'r_pla_tem.sql'")
