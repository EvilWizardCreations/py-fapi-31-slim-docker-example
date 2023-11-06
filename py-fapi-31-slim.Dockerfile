FROM python:3.10-slim as build-py-fapi-31-slim

# Set some image labels
LABEL evilwizardcreations.image.authors="evil.wizard95@googlemail.com" \
    evilwizardcreations.image.python.version="3.10"

ARG APP_VER=local
ENV APP_VER=$APP_VER

WORKDIR /code

COPY ./build-assets/python/requirements.txt ./
RUN pip install --upgrade pip; \
    pip install --no-cache-dir -r requirements.txt

COPY ./src ./src

CMD [ "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload" ]
