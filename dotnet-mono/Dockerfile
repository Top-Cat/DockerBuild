FROM mcr.microsoft.com/dotnet/sdk:7.0

ENV MONO_VERSION 6.12.0.199

RUN apt-get update
RUN apt-get install -y mono-devel mono-utils ca-certificates-mono
RUN rm -rf /var/lib/apt/lists/* /tmp/*

ENV FrameworkPathOverride /usr/lib/mono/4.7.2-api
RUN ln -s /usr/lib/mono/4.7.2-api/Facades/netstandard.dll /usr/lib/mono/4.7.2-api/netstandard.dll
