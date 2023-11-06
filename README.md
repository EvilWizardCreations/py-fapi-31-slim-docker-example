# Python 3.10 Slim FAPI Dockerfile Example

A base Python 3.10 Slim FAPI image[^docker_pull_cmd_note] for basing projects available at [EWC Docker Hub](https://hub.docker.com/r/ewc2020/web).

This Image is intended for ***Development*** purpose only & to use as a learning aid. ***DO NOT*** use this anywhere near a ***Production*** environment.

## Installed Python Dependencies

The following `pip` dependencies are already installed.

- `fastapi`
- `uvicorn`

## Build & Compose Up

Note that the `py-fapi-31-slim` is the Docker Compose Service to ***Build***.

There is an [Evil Wizard Creations Protocol](https://bitbucket.org/evilwizardcreations/ewc-protocols) that makes this much simpler.

```bash
ewc-docker-build-up.sh py-fapi-31-slim "Python FastAPI webapp"
```

Alternatively there is the *full Procedure*.

1. Build the Image using the `docker-compose-build.yaml` configuration.

    ```bash
    docker-compose -f ./docker-compose-build.yaml build --no-cache py-fapi-31-slim
    ```

1. Compose *Up* using the `docker-compose-build.yaml` configuration will use the new built Image and `-d` to *detach*.

    ```bash
    docker-compose -f ./docker-compose-build.yaml up -d
    ```

[^docker_pull_cmd_note]: Use `docker pull ewc2020/web:py-fapi-31-slim-latest` to get a copy of the image.
