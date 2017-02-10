FROM r-base

MAINTAINER Max Joseph maxwell.b.joseph@colorado.edu

RUN apt-get update

RUN apt-get -y install gdal-bin libgdal-dev libproj-dev

RUN R -e "install.packages('rasterVis', repos='http://cran.us.r-project.org')"

COPY . /home/docker/

WORKDIR /home/docker

CMD ["Rscript", "some-script.R"]

