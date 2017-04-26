FROM python:2.7

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      python-distutils-extra \
      python-gtk2 \
      python-setuptools \
      python-setuptools-git \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

ADD . /usr/src/app/
WORKDIR /usr/src/app/

RUN ./setup.py install

ENTRYPOINT [ "screenkey" ]
