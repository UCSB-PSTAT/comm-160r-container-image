FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

#RUN R -e "install.packages(c('<library>', '<library>'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

RUN conda install -y -c conda-forge \
    r-effectsize \
    r-ggrepel \
    r-gt \
    r-gtsummary \
    r-here \
    r-janitor \
    r-naniar \
    r-skimr \
    r-quarto && \
    conda clean -afy

USER $NB_USER

