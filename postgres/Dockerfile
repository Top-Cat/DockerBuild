FROM postgres:14
RUN apt-get update
RUN apt-get install -y build-essential git postgresql-server-dev-14 libicu-dev \
    bison flex zlib1g zlib1g-dev pkg-config make libssl-dev libreadline-dev wget
RUN wget -qO - https://sh.rustup.rs | RUSTUP_HOME=/opt/rust CARGO_HOME=/opt/rust sh -s -- --no-modify-path -y
RUN /opt/rust/bin/rustup default stable
ENV RUSTUP_HOME=/opt/rust
ENV CARGO_HOME=/opt/rust

WORKDIR /opt
RUN git clone https://github.com/postgrespro/pg_trgm_pro
RUN git clone https://github.com/zombodb/zombodb

WORKDIR /opt/zombodb
RUN /opt/rust/bin/cargo install cargo-pgrx@0.9.8
RUN /opt/rust/bin/cargo pgrx init --pg14=`which pg_config`
RUN /opt/rust/bin/cargo pgrx install --release

WORKDIR /opt/pg_trgm_pro
RUN make USE_PGXS=1
RUN make USE_PGXS=1 install

FROM postgres:14
RUN mkdir -p /usr/lib/postgresql/14/lib && mkdir -p /usr/lib/postgresql/14/extension
WORKDIR /usr/lib/postgresql/14/lib
COPY --from=0 /usr/lib/postgresql/14/lib/pg_trgm.so .
COPY --from=0 /usr/lib/postgresql/14/lib/zombodb.so .
WORKDIR /usr/share/postgresql/14/extension
COPY --from=0 /usr/share/postgresql/14/extension/pg_trgm* ./
COPY --from=0 /usr/share/postgresql/14/extension/zombodb* ./

RUN mkdir -p /usr/lib/postgresql/14/lib/bitcode/pg_trgm
WORKDIR /usr/lib/postgresql/14/lib/bitcode
COPY --from=0 /usr/lib/postgresql/14/lib/bitcode/pg_trgm* ./
WORKDIR /
