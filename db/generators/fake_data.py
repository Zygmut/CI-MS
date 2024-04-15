import random
from faker import Faker

fake = Faker()


def gen_pers(r):
    data = []
    for _ in range(r):
        nombre = fake.first_name()
        apellidos = fake.last_name()
        correo = fake.email()
        telf = fake.phone_number()
        usu = fake.user_name()
        passw = fake.password(length=10, special_chars=True, digits=True, upper_case=True, lower_case=True)
        data.append(f"('{nombre}', '{apellidos}', '{correo}', '{telf}', '{usu}', '{passw}')")
    p = ",\n".join(data)
    return f"INSERT INTO PERSONA (nombre, apellidos, correo, telf, usu, pass) VALUES {p};".strip()


def gen_prod(r):
    data = []
    for _ in range(r):
        nombre = fake.word()
        descripcion = fake.sentence()
        coste = round(random.uniform(1, 1000), 2)
        imagen = fake.image_url()
        data.append(f'("{nombre}", "{descripcion}", {coste}, "{imagen}")')
    p = ",\n".join(data)
    return f"INSERT INTO PRODUCTO (nombre, descripcion, coste, imagen) VALUES {p};".strip()


def gen_planta(r):
    data = []
    for _ in range(r):
        nombre = fake.word()
        descripcion = fake.sentence()
        data.append(f'("{nombre}", "{descripcion}")')
    p = ",\n".join(data)
    return f"INSERT INTO PLANTA (nombre, descripcion) VALUES {p};".strip()


def gen_caracteristica(r):
    data = []
    for _ in range(r):
        nombre = fake.word()
        valor = fake.word()
        data.append(f'("{nombre}", "{valor}")')
    p = ",\n".join(data)
    return f"INSERT INTO CARACTERISTICA (nombre, valor) VALUES {p};".strip()


def gen_temporada(r):
    data = []
    for _ in range(r):
        nombre = fake.word()
        fecha_inicio = (fake.date_time_this_decade(before_now=True, after_now=False)).strftime("%Y-%m-%d")
        fecha_fin = (fake.date_time_this_decade(before_now=False, after_now=True)).strftime("%Y-%m-%d")
        data.append(f'("{nombre}", "{fecha_inicio}", "{fecha_fin}")')
    p = ",\n".join(data)
    return f"INSERT INTO TEMPORADA (nombre, fecha_inicio, fecha_fin) VALUES {p};".strip()


if __name__ == "__main__":
    ROWS = 1000
    content = [
        ("personas.sql", gen_pers(ROWS)),
        ("productos.sql", gen_prod(ROWS)),
        ("plantas.sql", gen_planta(ROWS)),
        ("caracteristicas.sql", gen_caracteristica(ROWS // 10)),
        ("temporadas.sql", gen_temporada(ROWS // 100)),
    ]

    for f, d in content:
        with open(f, "w") as file:
            file.write(d)
