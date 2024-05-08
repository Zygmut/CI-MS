import unittest, requests  # noqa: E401

ENDPOINT = "https://www.musapientum.com/api/carrito.php"


class TestCatalogo(unittest.TestCase):
    def test_headers(self):
        res = requests.get(ENDPOINT)
        self.assertEqual(res.status_code, 200)
        self.assertTrue("application/json" in res.headers["content-type"])

    def test_content(self):
        res = requests.get(ENDPOINT)
        self.assertEqual(res.status_code, 200)
        data = res.json()["status"]
        self.assertEqual(data, "OK")


if __name__ == "__main__":
    unittest.main()
