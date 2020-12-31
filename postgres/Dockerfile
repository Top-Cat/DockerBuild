FROM postgres:13
RUN apt-get update
RUN apt-get install -y build-essential git postgresql-server-dev-13 libicu-dev

WORKDIR /opt
RUN git clone https://github.com/postgrespro/pg_trgm_pro

WORKDIR /opt/pg_trgm_pro
RUN make USE_PGXS=1
RUN make USE_PGXS=1 install

FROM postgres:13
RUN mkdir -p /usr/lib/postgresql/13/lib && mkdir -p /usr/lib/postgresql/13/extension
WORKDIR /usr/lib/postgresql/13/lib
COPY --from=0 /usr/lib/postgresql/13/lib/pg_trgm.so .
WORKDIR /usr/share/postgresql/13/extension
COPY --from=0 /usr/share/postgresql/13/extension/pg_trgm* ./

RUN mkdir -p /usr/lib/postgresql/13/lib/bitcode/pg_trgm
WORKDIR /usr/lib/postgresql/13/lib/bitcode
COPY --from=0 /usr/lib/postgresql/13/lib/bitcode/pg_trgm* ./
WORKDIR /
