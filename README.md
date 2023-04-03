# Dockerfile of writing paper by R Markdown

This is a repository of Dockerfile including packages and add-ins that are useful for writing articles with R Markdown in Rstudio. This Dockerfile is based on rocker/verse. Installing rstan conducted by the method described in antoine-sachet / rocker-ML.

[日本語解説(Japanese)](https://github.com/ykunisato/ccp-r/blob/master/README_jp.md)

Maintainer is Yoshihiko Kunisato (ykunisato@psy.senshu-u.ac.jp)

Keywords: psychology, cognitive science, rstudio, rstan, rmarkdown

## Usage

1. Install ["Docker Desktop"](https://www.docker.com/products/docker-desktop)

2. Open "terminal"(Mac) or "Command Prompt"(Windows)

3. Type the following code to pull a Docker container. Change the "password" and "name_of_container" as you like.


**Mac**


```
docker run -e PASSWORD=password -p 8787:8787 -v $(pwd):/home/rstudio -d --name cppr ghcr.io/ykunisato/ccp-r:latest
```
or

```
docker run -e PASSWORD=password -e DISABLE_AUTH=true -p 8787:8787 -v $(pwd):/home/rstudio -d --name cppr ghcr.io/ykunisato/ccp-r:latest
```

**Windows**


```
docker run -e PASSWORD=password -p 8787:8787 -v "%cd%":/home/rstudio -d --name cppr ghcr.io/ykunisato/ccp-r:latest
```


4. Open the web browser and type "http://localhost:8787/" in the URL bar.

5. You will see the Rstudio on the web browser. Type rstudio in ID column and password that you set in password column.

6. If you need to install cmdstan and Juliapackage, please execute the following.

- Install cmdstan

```
cmdstanr::install_cmdstan(cores = 2)
```

- Install Julia packages

Type "julia" in Terminal of the Rstudio and then type the following code.

```
using Pkg;Pkg.add(["DataFrames","CSV","Distributions","Statistics","JuliaFormatter","CPUTime","Gadfly","GLM","Optim","Plots","RDatasets","StatsBase","StatsFuns","StatsPlots","AdvancedHMC","Turing","Roots","ForneyLab","Suppressor", "LogExpFunctions", "Colors", "StatsModelComparisons","RxInfer","BenchmarkTools"]);Pkg.precompile()
```


## [List of R packages](https://github.com/ykunisato/ccp-r/list_packages.md)
