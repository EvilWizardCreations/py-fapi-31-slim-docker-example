# Python 3.10 Slim FAPI Dockerfile Example

A base Python 3.10 Slim FAPI image[^docker_pull_cmd_note] for basing projects available at [EWC Docker Hub](https://hub.docker.com/r/ewc2020/web).

## Installed Python Dependencies

The following `pip` dependencies are already installed.

- `fastapi`
- `uvicorn`

## Build & Compose Up

Note that the `py-fapi-31-slim` is the Docker Compose Service to ***Build***.

There is a build script included that uses the local `.env` file & an [Evil Wizard Creations Protocol](https://bitbucket.org/evilwizardcreations/ewc-protocols) that makes this much simpler.

```bash
build-up-py-fapi-31-slim.sh
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

## Build Image The Long Way

Build the ***Docker Image*** without using ***cached*** versions of previous image build stages.

```bash
sudo docker build \
    -f py-fapi-31-slim.Dockerfile \
    --target build-py-fapi-31-slim \
    --build-arg APP_ENV=local \
    --no-cache \
    -t py-fapi-31-slim:latest \
    .
```

**N.B.**

- Using `-f py-fapi-31-slim.Dockerfile`

    To specify the *filename* to ***build*** otherwise it is expected to be named `Dockerfile`.

- Using `--target build-py-fapi-31-slim`

    To select the ***build target stage***[^multi_stage_builds_note] from the *Dockerfile*.
    
- Using `--build-arg ARG=value`

    To set build argument values to use.

### Create A Container

This creates a named container and attaches it to the ***host network*** and may cause port conflict if the host machine is already listening on any exposed ports from the ***Docker Image*** being used.

```bash
sudo docker run \
    -d \
    --network host \
    -v "$(pwd)"/public_html:/code/src \
    --name py-fapi-31-slim \
    py-fapi-31-slim:latest
```

**OR**

This creates a named container and attaches it to the ***bridge network*** and allows for ***port forward mapping*** from the ***host*** to the ***Container***.

```bash
sudo docker run \
    -d \
    --network bridge \
    -p 8080:80/tcp \
    -v "$(pwd)"/src:/code/src \
    --name py-fapi-31-slim \
    py-fapi-31-slim:latest
```

**N.B.**

- Using `-v "$(pwd)"/src:/code/src`

    To ***Volume Mount*** the folder `src` from the current folder to `/code/src` on the ***running*** container. It is where ***Python FAPI*** serves the content from & allows for *realtime* change updates.

- Using `-p 8080:80/tcp` 

    To map port **8080** on the ***Host*** machine to port **80** on the ***Container*** using the ***bridge network***.

- Using `--name py-fapi-31-slim`

    To name the ***Container*** being created.

### Start Container

```bash
sudo docker start py-fapi-31-slim
```

### Stop Container

```bash
sudo docker stop py-fapi-31-slim
```

## Connect To Container

```bash
sudo docker exec -it py-fapi-31-slim /bin/bash
```

# Disclaimer

This Image is intended for ***Development*** purpose only & to use as a learning aid. ***DO NOT*** use this anywhere near a ***Production*** environment.

[^docker_pull_cmd_note]: Use `docker pull ewc2020/web:py-fapi-3.10-slim-latest` to get a copy of the image.

[^multi_stage_builds_note]: Used mostly in ***Multi Stage*** image builds.

[^compose_name_note]: The `py-fapi-31-slim` container name to build the image for.
