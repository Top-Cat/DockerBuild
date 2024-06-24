FROM postgres:16
RUN apt-get update
RUN apt-get install -y build-essential git postgresql-server-dev-16 libicu-dev

WORKDIR /opt
RUN git clone https://github.com/postgrespro/pg_trgm_pro

WORKDIR /opt/pg_trgm_pro
RUN make USE_PGXS=1
RUN make USE_PGXS=1 install

FROM postgres:16
RUN mkdir -p /usr/lib/postgresql/16/lib && mkdir -p /usr/lib/postgresql/16/extension
WORKDIR /usr/lib/postgresql/16/lib
COPY --from=0 /usr/lib/postgresql/16/lib/pg_trgm.so .
WORKDIR /usr/share/postgresql/16/extension
COPY --from=0 /usr/share/postgresql/16/extension/pg_trgm* ./

RUN mkdir -p /usr/lib/postgresql/16/lib/bitcode/pg_trgm
WORKDIR /usr/lib/postgresql/16/lib/bitcode
COPY --from=0 /usr/lib/postgresql/16/lib/bitcode/pg_trgm* ./
WORKDIR /
