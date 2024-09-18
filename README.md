# Jupyter Notebook Multi-Kernel & R Kernel Docker Images

This repository provides Docker configurations for running Jupyter Notebook environments with support for multiple programming languages and R, facilitating flexible and interactive learning and teaching experiences. The images are available on [Docker Hub](https://hub.docker.com/repository/docker/gprao7/jupyter/general).


## Quick Start

Run the below command from the directory that you want to be mounted inside the container.

### 1. Multi Kernel Notebook [Python + Java, C, JavaScript]
- Windows
```bash
   docker run -p 8888:8888 -v ${PWD}:/home/jovyan/notebooks gprao7/jupyter:multi
   ```
- Linux/Unix
```bash
   docker run -p 8888:8888 -v $(pwd):/home/jovyan/notebooks gprao7/jupyter:multi
   ```

###  2. R Notebook
- Windows
```bash
   docker run -p 8888:8888 -v ${PWD}:/home/jovyan/notebooks gprao7/jupyter:r-notebook
   ```
- Linux/Unix
```bash
   docker run -p 8888:8888 -v $(pwd):/home/jovyan/notebooks gprao7/jupyter:r-notebook
   ```


## Images

1. **`gprao7/jupyter:multi`**  
   Supports Jupyter kernels for:
   - Java (via Rapaio Jupyter Kernel)
   - C (via Brendan Rius's C kernel)
   - JavaScript (via IJavascript)

2. **`gprao7/jupyter:r-notebook`**  
   Includes the R kernel for running R in Jupyter Notebook.

## How to Use

### Pull the Images from Docker Hub

You can pull the pre-built images from Docker Hub using the following commands:

```bash
docker pull gprao7/jupyter:multi
```

```bash
docker pull gprao7/jupyter:r-notebook
```

### Running with Docker

To run the images directly with Docker, map the host port and volume for persistent storage of your notebooks:

#### `gprao7/jupyter:multi`:

```bash
docker run -p <host_port>:8888 -v <host_directory>:/home/jovyan/notebooks gprao7/jupyter:multi
```

#### `gprao7/jupyter:r-notebook`:

```bash
docker run -p <host_port>:8888 -v <host_directory>:/home/jovyan/notebooks gprao7/jupyter:r-notebook
```

Replace:
- `<host_port>` with the port number on your local machine (e.g., `8888`).
- `<host_directory>` with the path on your local machine where you want to save notebooks.

### Running with Docker Compose

Alternatively, you can use the included `docker-compose.yml` file for easier setup. This file allows you to configure and run the images using a single command.

1. Clone the repository:

```bash
git clone <repository_url>
cd <repository_folder>
```

2. Modify the `docker-compose.yml` file if needed to adjust port mappings or volume paths.

3. Run the services:

```bash
docker-compose up
```

This will start the Jupyter Notebook environment, accessible at `http://localhost:8888`.

## Included Files

- **Dockerfile**: Used to build the Docker images from scratch.
- **docker-compose.yml**: Used to define and run multi-container Docker applications.

## Accessing Jupyter

Once the container is running, you can access the Jupyter Notebook interface by opening a web browser and navigating to `http://localhost:<host_port>`. You will be prompted to enter a token, which can be found in the container logs.

## Contribution

Feel free to open issues or submit pull requests if you find any bugs or have suggestions for improvements.