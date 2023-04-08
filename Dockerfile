FROM rocker/verse:latest
LABEL maintainer="Yoshihiko Kunisato <kunisato@psy.senshu-u.ac.jp>"

# Install ipaexfont
RUN apt-get update
RUN apt-get install -y fonts-ipaexfont

# Insatall notofont
RUN apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra

# install libjpeg & V8 for "psycho"
RUN apt-get install -y libjpeg-dev libv8-dev

# install ffmpeg
RUN apt-get -y install ffmpeg

# install ImageMagick++ library for magick
RUN apt-get install -y libmagick++-dev

# install clang for Rstan
RUN apt-get install -y clang make

# Install JAGS and other linux packages
RUN apt-get update && apt-get install -y \
    jags \
    libgsl0-dev \
    tcl8.6-dev \
    tk8.6-dev\
    openmpi-bin\
    libglpk-dev \
    libcgal-dev \
    libglu1-mesa-dev \
    libsecret-1-dev \
    libsodium-dev \
    libssl-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# install sqlite3
RUN apt-get update
RUN apt-get install -y sqlite3

# install Mecab and Dictionary
RUN wget -O mecab-0.996.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" ;\
    tar -xzf mecab-0.996.tar.gz ;\
    cd mecab-0.996; ./configure --enable-utf8-only; make; make install; ldconfig

RUN wget -O mecab-ipadic-2.7.0-20070801.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" ;\
    tar -xzf mecab-ipadic-2.7.0-20070801.tar.gz ;\
    cd mecab-ipadic-2.7.0-20070801; ./configure –with-charset=utf-8; make; make install; ldconfig

# install R packages
COPY install_r.r install_r.r
RUN ["r", "install_r.r"]

# install python packaegs
RUN apt-get install -y python3-pip
RUN pip3 install notebook \
    jupyterlab \
    jupyterlab-git \
    scipy \
    seaborn \
    scikit-learn \
    sympy \
    mne \
    deap \
    japanize-matplotlib \
    mecab-python3 \
    unidic-lite \
    networkx \
    PuLP \
    pymc3 \
    simpy \
    psychrnn \
    pyddm \
    inferactively-pymdp\
    bokeh \
    sudachipy

# Install Julia
ARG JULIA_VERSION="1.8.5"
RUN JULIA_MAJOR=`echo $JULIA_VERSION | sed -E  "s/\.[0-9]+$//g"` && \
    wget https://julialang-s3.julialang.org/bin/linux/x64/$JULIA_MAJOR/julia-$JULIA_VERSION-linux-x86_64.tar.gz && \
    tar -xvzf julia-$JULIA_VERSION-linux-x86_64.tar.gz && \
    cp -r julia-$JULIA_VERSION /opt/ && \
    ln -s /opt/julia-$JULIA_VERSION/bin/julia /usr/local/bin/julia && \
    rm -r julia-$JULIA_VERSION-linux-x86_64.tar.gz

RUN chown -hR rstudio:staff /opt/julia-$JULIA_VERSION