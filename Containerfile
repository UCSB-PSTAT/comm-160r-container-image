FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN mamba install -y -c conda-forge\
    r-effectsize\
    r-palmerpenguins\
    r-ggrepel\
    r-ggthemes\
    r-gt\
    r-gtsummary\
    r-here\
    r-janitor\
    r-naniar\
    r-skimr\
    r-quarto &&\
    conda clean -afy &&\
    /usr/local/bin/fix-permissions "${CONDA_DIR}" || true

#RUN R -e "install.packages(c('<library>', '<library>'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

USER $NB_USER
