import unittest, requests 


class TestCatalogo(unittest.TestCase):
    def test_headers(self):
        res = requests.get("https://www.musapientum.com/api/jardines.php")
        self.assertEqual(res.status_code, 200)
        self.assertTrue("application/json" in res.headers["content-type"])

    def test_content(self):
        res = requests.get("https://www.musapientum.com/api/jardines.php")
        self.assertEqual(res.status_code, 200)
        keys = ["_id", "nombre", "descripcion", "valoracion", "imagen", "characteristics", "location"]
        for key in keys:
            self.assertIn(
                key,
                res.json(),
                f"La clave '{key}' no está presente en la respuesta JSON",
            )


if __name__ == "__main__":
    unittest.main()
