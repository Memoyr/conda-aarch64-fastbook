## Dockerized Jupyterlab server with Fastai/Fastbook - conda based 


The image created compatible with aarch64 (arm64) systems. 
See Miniconda notes [here](https://github.com/conda-forge/miniforge#mambaforge)

Once your container is running, jupyterlab will provide a link to open in a browser.

You can git clone Fastbook, or create a new noteboook project.


## Usage:

### Use via Dockerfile
```bash
$ docker build --no-cache  -t [name_of_image]:[tag_of_image] .
$ docker run -p 8888:8888 [name_of_image]:[tag_of_image]
```

### Use via with docker-compose, local volume is set on path `project/notebooks`

```bash
$ docker-compose up --build
```

Or if you need a fresh cash
```bash
$ docker-compose build --no-cahe
$ docker-compose up
```