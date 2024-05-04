####################STAGE 1#####################
################DO NOT EDIT THESE###############
FROM rocker/r-ubuntu as base

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    pandoc
    
RUN mkdir /final_project

WORKDIR /final_project

COPY renv.lock .
COPY .Rprofile .
RUN mkdir -p renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN mkdir renv/.cache

ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir -p code output
COPY code code
COPY Makefile .
COPY Final-Project-Report.Rmd .
COPY app_data.xlsx .
COPY config.yml .
COPY README.md .

RUN mkdir -p report

WORKDIR /final_project

CMD make && mv Final-Project-Report.pdf report

RUN Rscript -e "tinytex::install_tinytex()"

ENV PATH="${PATH}:/root/bin"