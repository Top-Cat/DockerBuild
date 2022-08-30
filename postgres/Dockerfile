FROM postgres:14
RUN apt-get update
RUN apt-get install -y build-essential git postgresql-server-dev-14 libicu-dev

WORKDIR /opt
RUN git clone https://github.com/postgrespro/pg_trgm_pro

WORKDIR /opt/pg_trgm_pro
RUN make USE_PGXS=1
RUN make USE_PGXS=1 install

FROM postgres:14
RUN mkdir -p /usr/lib/postgresql/14/lib && mkdir -p /usr/lib/postgresql/14/extension
WORKDIR /usr/lib/postgresql/14/lib
COPY --from=0 /usr/lib/postgresql/14/lib/pg_trgm.so .
WORKDIR /usr/share/postgresql/14/extension
COPY --from=0 /usr/share/postgresql/14/extension/pg_trgm* ./

RUN mkdir -p /usr/lib/postgresql/14/lib/bitcode/pg_trgm
WORKDIR /usr/lib/postgresql/14/lib/bitcode
COPY --from=0 /usr/lib/postgresql/14/lib/bitcode/pg_trgm* ./
WORKDIR /
