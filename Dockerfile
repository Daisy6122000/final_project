FROM rocker/r-ubuntu as base

RUN mkdir /project
WORKDIR /project

RUN apt-get update && apt-get install -y pandoc

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc

WORKDIR /project
COPY --from=base /project .

COPY Makefile .
COPY report.Rmd .

RUN mkdir code
RUN mkdir output
RUN mkdir raw_data
RUN mkdir final_report

COPY raw_data/heart.csv raw_data
COPY code code

CMD make && mv report.html final_report

