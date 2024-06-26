import unittest, requests 

ENDPOINT = "https://www.musapientum.com/api/catalogo.php"


class TestCatalogo(unittest.TestCase):
    def test_headers(self):
        res = requests.get(ENDPOINT)
        self.assertEqual(res.status_code, 200)
        self.assertTrue("application/json" in res.headers["content-type"])

    def test_content(self):
        res = requests.get(ENDPOINT)
        self.assertEqual(res.status_code, 200)
        keys = ["_id", "nombre", "descripcion", "coste", "imagen"]
        for key in keys:
            self.assertIn(
                key,
                res.json()["plantas"],
                f"La clave '{key}' no está presente en la respuesta JSON",
            )


if __name__ == "__main__":
    unittest.main()
