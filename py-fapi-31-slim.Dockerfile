FROM python:3.10-slim as build-py-fapi-31-slim

# Set some image labels
LABEL evilwizardcreations.image.authors="evil.wizard95@googlemail.com" \
    evilwizardcreations.image.python.version="3.10"

ARG APP_VER=local
ENV APP_VER=$APP_VER

# Set the working directory
WORKDIR /code

# Copy the Python dependency requirements for the project
COPY ./build-assets/python/requirements.txt ./
# Upgrade PIP & install the requirements
RUN pip install --upgrade pip; \
    pip install --no-cache-dir -r requirements.txt

# Copy the project source code
COPY ./src ./src

# Set the Command to launch the FAPI server
CMD [ "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload" ]

# A test build to play with while getting it all working
FROM python:3.10-slim as build-py-fapi-31-slim-test

# Set some image labels
LABEL evilwizardcreations.image.authors="evil.wizard95@googlemail.com" \
    evilwizardcreations.image.python.version="3.10"

ARG APP_VER=local
ENV APP_VER=$APP_VER

# Set the working directory
WORKDIR /code

# Copy the Python dependency requirements for the project
COPY ./build-assets/python/requirements.txt ./
# Upgrade PIP & install the requirements
RUN pip install --upgrade pip; \
    pip install --no-cache-dir -r requirements.txt

# Copy the project source code
COPY ./src ./src

# Set the Command to launch the FAPI server
CMD [ "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload" ]
