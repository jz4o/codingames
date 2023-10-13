## Usage

```
docker-compose build python
docker-compose up -d python
docker-compose exec python flake8 .
```

## How to update packages

```
docker-compose up -d python
docker-compose exec python pip list --outdated
vim vendor/python/requirements.txt
docker-compose exec python pip install -r requirements.txt
docker-compose exec python sh -c "pip freeze > requirements-lock.txt"
```

