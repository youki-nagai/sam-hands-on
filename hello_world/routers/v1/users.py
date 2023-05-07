from fastapi import APIRouter

router = APIRouter(prefix="/v1/users", tags=["v1/users"])


@router.get("")
def index():
    return {"users": "all"}
