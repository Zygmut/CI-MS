import unittest, requests  # noqa: E401


class TestCatalogo(unittest.TestCase):
    def test_headers(self):
        res = requests.get("/catalogo.php")
        self.assertEqual(res.status_code, 200)
        self.assertTrue("application/json" in res.headers["content-type"])

    def test_content(self):
        res = requests.get("/catalogo.php")
        self.assertEqual(res.status_code, 200)
        keys = ["_id", "nombre", "descripcion", "coste", "imagen"]
        for key in keys:
            self.assertIn(
                key,
                res.json(),
                f"La clave '{key}' no está presente en la respuesta JSON",
            )


if __name__ == "__main__":
    unittest.main()
