# docker-training 

Training materials: Docker for scientific computing

Maintained by Max Joseph (@mbjoseph)

This repository contains slides (`slides.Rmd`) and a simple example of a Dockerfile and an R script in `example/` to introduce the idea of containerization through docker for scientific computing.

## Dependencies

- git
- Docker

## Acquiring the files

To work through the example or make the slides, you'll need to clone the repository:

```bash
git clone https://github.com/earthlab/docker-training.git
```

## Working through the example

The `example/` subdirectory contains two files. 
One is `example/some-script.R`, which is an example R script that loads a package and outputs a pdf figure.
The other file is `example/Dockerfile` which provides instructions to create an image that bundles all of the dependencies for `example/some-script.R`. 
To create the image, enter the `example` subdirectory and use `docker build`:

```bash
cd example
docker build -t some-image .
```

The `-t` flag specifies a tag or name for your image.  
Then to create the container:

```bash
docker run -v $(pwd):/home/docker/ some-image
```

The `-v` flag links volumes between the host (your computer) and the container. 
The `$(pwd) bit will automatically substitute your current working directory.


## Making the slides

The slides are generated from an R markdown file (`slides.Rmd`). 
At the risk of being too meta, there is a Dockerfile that can be used to generate the pdf version of the slides.
To render the slides, you'll need to fetch the repository using `git clone`, described above.
Then, enter the directory and use `docker build` to create the image.

```bash
cd docker-training
docker build -t docker-training .
```
 
Once the image is done building, you'll be able to run it as follows, linking your current working directory `$(pwd)` to the `/home/docker/` directory inside of the container with the `-v` flag: 

```bash
docker run docker run -v $(pwd):/home/docker docker-training
```

