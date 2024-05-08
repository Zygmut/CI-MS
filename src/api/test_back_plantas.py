import unittest, requests


class TestCatalogo(unittest.TestCase):
    def test_headers(self):
        res = requests.get("https://www.musapientum.com/api/plantas.php?id=2004")
        self.assertEqual(res.status_code, 200)
        self.assertTrue("application/json" in res.headers["content-type"])

    def test_content(self):
        res = requests.get("https://www.musapientum.com/api/plantas.php?id=2004")
        self.assertEqual(res.status_code, 200)
        keys = ["_id_planta", "_nom_prod", "_desc_prod", "coste", "imagen", "caracteristicas", "nombre", "valor", "temporadas"]
        json_data = res.json()

        for key in keys:
            self.assertIn(
                key,
                json_data,
                f"La clave '{key}' no está presente en la respuesta JSON",
            )


if __name__ == "__main__":
    unittest.main()
