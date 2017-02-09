# specify starting point
FROM r-base

# name self as maintainer
MAINTAINER Max Joseph maxwell.b.joseph@colorado.edu

# update existing libraries
RUN apt-get update

# install new libraries
RUN apt-get -y install gdal-bin libgdal-dev libproj-dev

# execute R commands to install packages
RUN R -e "install.packages('rasterVis', repos='http://cran.us.r-project.org')"

# copy scripts into the container
COPY . /home/docker/

# specify that the location of script is the working directory
WORKDIR /home/docker

# the command you want to run when "docker run ..." is excecuted
CMD ["Rscript", "some-script.R"]

