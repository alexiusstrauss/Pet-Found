FROM python:3.9-slim-buster

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

WORKDIR /app/

# Install dependencies
RUN apt-get update -yy \
    && apt-get upgrade -yy \
    && apt-get install -yy libpq-dev pipenv

# Install python dependencies in /.venv
COPY ./app/Pipfile ./app/Pipfile.lock* /app/

# Allow installing dev dependencies to run tests
ARG INSTALL_DEV=true
RUN bash -c "if [ $INSTALL_DEV == 'true' ] ; then pipenv install --dev ; else pipenv install; fi"

COPY ./app /app
ENV PYTHONPATH=/app