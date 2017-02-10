FROM r-base

# name self as maintainer
MAINTAINER Max Joseph maxwell.b.joseph@colorado.edu

# update existing libraries
RUN apt-get update

# install new libraries
RUN apt-get -y --no-install-recommends install texlive-xetex pandoc ttf-dejavu lmodern texlive-fonts-recommended texlive-generic-recommended

# execute R commands to install packages
RUN R -e "install.packages(c('knitr', 'rmarkdown'), repos='http://cran.us.r-project.org')"

# copy scripts into the container
COPY . /home/docker/

# specify that the location of script is the working directory
WORKDIR /home/docker

# the command you want to run when "docker run ..." is excecuted
CMD ["Rscript", "-e", "rmarkdown::render('slides.Rmd')"]

