FROM mcr.microsoft.com/dotnet/sdk:7.0

ENV MONO_VERSION 6.12.0.199
ENV FrameworkPathOverride /usr/lib/mono/4.7.2-api

RUN apt-get update \
  && apt-get install -y mono-devel ca-certificates-mono \
  && rm -rf /var/lib/apt/lists/* /tmp/*
