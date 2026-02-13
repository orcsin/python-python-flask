"""Unit tests for the Flask application."""
from app import app


def test_hello():
    """Test that the root endpoint returns Hello, World."""
    response = app.test_client().get('/')

    assert response.status_code == 200
    assert response.data == b'Hello, World!'
