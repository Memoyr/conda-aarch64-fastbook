## Dockerized Jupyterlab server with Fastai/Fastbook - conda based 


The image created compatible with aarch64 (arm64) systems. 
See Miniconda notes [here](https://github.com/conda-forge/miniforge#mambaforge)

Once your container is running, jupyterlab will provide a link to open in a browser.

You can git clone Fastbook, or create a new noteboook project.


## Usage:

Use it with docker-compose or manually directly on Dockerfile.

###  Use with docker-compose

Note: local volume is set on path `project/notebooks`

```bash
$ docker-compose up --build
```

Or if you need a fresh cache
```bash
$ docker-compose build --no-cache
$ docker-compose up
```

### Use via Dockerfile
```bash
$ docker build --no-cache  -t [name_of_image]:[tag_of_image] .
$ docker run -it -p 8888:8888 -v ./project/notebooks:/notebooks [name_of_image]:[tag_of_image] jupyter lab --ip=0.0.0.0 --no-browser --allow-root --notebook-dir=/notebooks/
```
