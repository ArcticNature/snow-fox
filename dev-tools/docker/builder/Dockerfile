FROM fedora:25

# Install build tools and node.
RUN dnf install -y \
      autoconf \
      automake \
      cmake \
      gcc-c++ \
      git \
      http-parser-devel \
      libcurl-devel \
      libssh2-devel \
      libtool \
      make \
      openssl-devel \
      protobuf-compiler \
      protobuf-devel \
      wget \
    && curl --silent --location https://rpm.nodesource.com/setup_7.x | bash - \
    && dnf install -y nodejs \
    && npm install -g grunt-cli

# Get the repo at the requested version of the code.
ARG COMMITISH=master
RUN git clone --recursive --branch ${COMMITISH} \
      https://github.com/ArcticNature/snow-fox.git \
      /tmp/snow-fox-source
WORKDIR /tmp/snow-fox-source

# Compile the code now (code can be changed with volumes).
COPY compile-code.sh /compile-code.sh
CMD ["/compile-code.sh"]
