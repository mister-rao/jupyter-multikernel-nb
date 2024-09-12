FROM jupyter/minimal-notebook

USER root

RUN apt-get update && apt-get install -y \ 
    r-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#### ----- INSTALL R ----- #####
# Install IRkernel
RUN R -e "install.packages(c('IRkernel'), repos='https://cloud.r-project.org')"

WORKDIR $HOME
USER $NB_USER


RUN R -e "IRkernel::installspec()"