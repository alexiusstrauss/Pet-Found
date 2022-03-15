.PHONY: help
SHELL:=/bin/bash

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

clean:
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf
	@rm -f .coverage
	@rm -rf htmlcov/
	@rm -rf xmlcov/
	@rm -fr .pytest_cache/
	@rm -f coverage.xml
	@rm -f *.log

conf-env:
	@cp contrib/localenv .env

docker-build:
	docker-compose build

runserver: clean
	docker-compose up -d

tests:
	docker-compose exec backend pipenv run pytest

tests-cov:
	docker-compose exec backend pipenv run pytest --cov

