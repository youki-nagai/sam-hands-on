# sam-hands-on

## 環境変数 setup

```sh
touch .env
## nothing
```

---

## docker で動かす場合

```sh
docker-compose build

docker-compose up -d
```

---

## local で 動かす場合

```sh
poetry install

poetry self add poetry-dotenv-plugin

poetry run uvicorn main:app --reload
```

## ブラウザで閲覧

```sh
open http://localhost:8000
```

---

## sam install

```sh
docker-compose run --rm sam init
```

```sh
brew install aws/tap/aws-sam-cli
```
