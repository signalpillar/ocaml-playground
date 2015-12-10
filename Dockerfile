FROM ubuntu:vivid

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y ppa:avsm/ppa \
    && add-apt-repository -y ppa:chris-lea/zeromq \
    && add-apt-repository -y ppa:fkrull/deadsnakes \
    && apt-get update -y \
    && apt-get install -y \
                          ocaml \
                          ocaml-native-compilers \
                          camlp4-extra \
                          opam \
                          make \
                          m4 \
                          libgmp-dev \
                          libffi-dev \
                          libzmq3-dev \
                          python3.5 \
                          build-essential \
                          python3.5-dev \
                          python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade jupyter \
    && opam init --auto-setup --build-doc \
    && opam install --build-doc --yes depext batteries \
    && opam install --build-doc --yes --deps-only iocaml \
    && opam upgrade

# TODO: check that your opam is at least 1.2.0

ENV PATH=$PATH:/root/.opam/system/bin
RUN git clone -b fix_for_jupyter https://github.com/signalpillar/iocaml.git \
    && cd iocaml \
    && eval `opam config env` \
    && opam remove iocaml-kernel \
    && opam install ocp-index \
    && make install \
    && ipython kernelspec install --name iocaml-kernel /root/.opam/system/lib/iocaml-kernel/ \
    && ipython kernelspec list \
    && touch /root/keyfile \
    && mkdir /root/notebooks

COPY kernel.json /usr/local/share/jupyter/kernels/iocaml-kernel/kernel.json

ENV OCAML_TOPLEVEL_PATH=/root/.opam/system/lib/toplevel
CMD eval `opam config env` \
    && OCAMLRUNPARAM=b \
    && ipython notebook \
       --debug \
       --ip=0.0.0.0 \
       --no-browser \
       --Session.keyfile=/root/keyfile \
       --notebook-dir=/root/notebooks
