* Update(s) - this image also serve as an ai-lab, so it might evolve and won't only serve fastai dev.

## Dockerized Jupyterlab server with Fastai/Fastbook - conda based 


The image created is compatible with aarch64 (arm64) systems. 
See Miniconda notes [here](https://github.com/conda-forge/miniforge#mambaforge)

Once your container is running, jupyterlab will provide a link to open in a browser.

You can git clone Fastbook, or create a new noteboook project.


## Usage:

- Use it with docker-compose or manually directly on Dockerfile.
- `project` & `secrets` directory include some utility script to help with projects configuration.

###  Use with docker-compose

Notes: 
- workdir is set on path `notebooks` 

```bash
$ docker-compose up --build
```

Or if you need a fresh cache
```bash
$ docker-compose build --no-cache
$ docker-compose up
# Also, in an other console you can log in the active container 
$ docker exec -it [active_container_name] /bin/bash

```

### Use via Dockerfile
```bash
$ docker build --no-cache  -t [name_of_image]:[tag_of_image] .
$ docker run -it -p 8888:8888 -v ./notebooks:/notebooks -v ./project:/project -v ./secrets:/secrets  [name_of_image]:[tag_of_image] jupyter lab --ip=0.0.0.0 --no-browser --allow-root --notebook-dir=/notebooks/
```
