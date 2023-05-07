from mangum import Mangum
from asgi_app import app


lambda_handler = Mangum(app)
