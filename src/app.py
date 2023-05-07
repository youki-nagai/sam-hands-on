from mangum import Mangum
from asgi_app import app

```test```

lambda_handler = Mangum(app)
