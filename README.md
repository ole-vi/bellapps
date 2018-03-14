# Bell

Dockerize bell app

## Components

* Bell. It is bell app container build with node.js.
* Couchdb. It is the database container which is initiated with `db-init`.

## How to use

### Build manually

1. Download the source code. Get into the version folder (x86 or arm for example).
2. Run command to build the image

    ```shell
    /bin/bash build.sh
    ```
3. Run command to start containers

    ```shell
    docker-compose up -d
    ```
4. Run command to stop containers

    ```shell
    docker-compose stop
    ```
5. Run command to delete the environment

    ```shell
    docker-compose down
    ```
6. See if docker containers running

    ```shell
    docker ps
    ```

7. View container log

    ```shell
    docker logs {{container_id}}
    ```

### Use the pre-build image

1. Run command to start bell
    ```shell
    docker-compose -f docker-compose-ready.yml up -d
    ```

2. Run command to stop bell
    ```shell
    docker-compose -f docker-compose-ready.yml stop
    ```

3. Delete environment
    ```shell
    docker-compose -f docker-compose-ready.yml down
    ```