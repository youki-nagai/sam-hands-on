from fastapi import APIRouter

router = APIRouter(prefix="/v1/articles", tags=["v1/articles"])


@router.get("")
def index():
    return {"articles": "all"}
