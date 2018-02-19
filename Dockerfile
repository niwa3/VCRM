FROM resin/raspberry-pi-buildpack-deps:jessie
MAINTAINER niwa3

ENV TREEFROG_VERSION 1.20.0
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
        qt5-default \
        qt5-qmake \
        qtbase5-dev \
        qtdeclarative5-dev \
        qtbase5-dev-tools \
        libqt5sql5-mysql \
        libqt5sql5-psql \
        libqt5sql5-odbc \
        libqt5sql5-sqlite \
        libqt5core5a \
        libqt5qml5 \
        libqt5xml5 \
        mariadb-client \
        libpq5 \
        libodbc1 \
        gcc \
        g++ \
        make && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/treefrog && \
    cd /usr/src/treefrog && \
    curl -sL https://github.com/treefrogframework/treefrog-framework/archive/v${TREEFROG_VERSION}.tar.gz | tar xz && \
    cd treefrog-framework-${TREEFROG_VERSION} && \
    ./configure && \
    make -j"$(nproc)" -C src && \
    make -C src install && \
    make -j"$(nproc)" -C tools && \
    make -C tools install && \
    rm -rf /usr/src/treefrog

RUN apt-get update && \
	apt-get install -y postgresql=9.4+165+deb8u3 && \
	mv /etc/postgresql/9.4/main/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf.bak && \
	sed -e "90s/peer/md5/g" /etc/postgresql/9.4/main/pg_hba.conf.bak > /etc/postgresql/9.4/main/pg_hba.conf

COPY . /tmp/

RUN git clone https://github.com/niwa3/VCRM.git

EXPOSE 8800
CMD sh /VCRM/start.sh
