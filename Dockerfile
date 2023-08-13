FROM ubuntu:22.04

LABEL maintainer="MindGspl" \ 
      version="0.1" \ 
      description="Ubuntu / Miniconda / aarch64  / PyTorch cpuonly / Jupyter lab / Fastai"

LABEL org.opencontainers.image.title="mimi/ubu-miniconda-aarch64-cpuonly-pyju"
LABEL org.opencontainers.image.description="Ubuntu / Miniconda / aarch64  / PyTorch cpuonly / Jupyter lab / Fastai & Fastbook"
LABEL org.opencontainers.image.version="0.1"

ARG PY_VER=3.10
ARG CONDA_VER=latest


RUN apt-get update
RUN apt-get install --assume-yes git
RUN apt-get install --assume-yes wget
RUN apt-get install --assume-yes curl
RUN apt-get install --assume-yes vim
RUN apt-get install --assume-yes unzip

# Needed for unstructured[all-docs]
#RUN apt-get install --assume-yes python3.10-dev gcc

RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh"
RUN bash Miniforge3-Linux-aarch64.sh -p /miniconda -b

ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

ARG PY_VER

RUN pip install "unstructured[jpeg,png,csv]"

# Use with Langchain
RUN pip install langsmith
# About pydantic below : https://github.com/langchain-ai/langchain/issues/8361#issuecomment-1655141355

# Install packages from conda and downgrade py (optional).
RUN conda install -c anaconda -y python=${PY_VER}
RUN conda install -c anaconda -y \
    ipython \
    pytorch torchvision cpuonly -c pytorch &&\
    conda install -c anaconda ipywidgets  &&\
    conda install -c fastchan fastai &&\
    conda install -c fastchan fastbook &&\
    conda install pydantic -c conda-forge  &&\
    conda install langchain -c conda-forge &&\
    conda install jupyterlab &&\
    conda install -c conda-forge jupyter_contrib_nbextensions &&\
    conda install -c conda-forge jupyter_nbextensions_configurator &&\
    conda install -c conda-forge jupyterlab-git &&\
    conda install -c conda-forge -y python-dotenv


# Install torchaudio  with pip since there's an issue in version cpuonly in conda pkg
RUN pip install torchaudio

# enable jupyter extensions
RUN jupyter contrib nbextension install
RUN jupyter nbextensions_configurator enable

# turn on extensions
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter nbextension enable jupyterlab-git

RUN rm -rf packages
RUN rm Miniforge3-Linux-aarch64.sh


RUN mkdir /project
RUN mkdir /notebooks
RUN mkdir /secrets

COPY . /project
COPY . /notebooks
COPY . /secrets

WORKDIR /notebooks


EXPOSE 8888

# Start the JupyterLab server
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
