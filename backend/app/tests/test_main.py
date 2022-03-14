from fastapi.testclient import TestClient

SERVER_URI = "http://127.0.0.1:8000"


def test_home(client: TestClient) -> None:
    response = client.get(f"{SERVER_URI}/")
    assert response.status_code == 200
    assert response.json() == {"message": "Welcome to FastAPI"}


def test_health_check(client: TestClient) -> None:
    response = client.get(f"{SERVER_URI}/heatlh")
    assert response.status_code == 200
    assert response.json() == {
        "status": "OK",
        "message": "Service is running with FastAPI",
    }


def test_not_found(client: TestClient) -> None:
    response = client.get(f"{SERVER_URI}/blabla")
    assert response.status_code == 404
    assert response.json() == {"detail": "Not Found"}
