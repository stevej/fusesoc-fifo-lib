ARG VARIANT=ubuntu-22.04
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive
ENV PDK=sky130A
# For cocotb
ENV PYGPI_PYTHON_BIN=/usr/bin/python
ENV PATH="$PATH:/workspaces/fusesoc-fifo-lib/oss-cad-suite"

WORKDIR /app
COPY . .

RUN apt update --fix-missing
RUN apt install -y iverilog gtkwave python3 python3-pip python3-venv python3-tk python-is-python3 libcairo2 verilator libpng-dev libqhull-dev ninja-build

RUN pip3 install -r /app/requirements.txt

# Install verible (for formatting)
RUN umask 022 && \
    curl -L https://github.com/chipsalliance/verible/releases/download/v0.0-3795-gf4d72375/verible-v0.0-3795-gf4d72375-linux-static-x86_64.tar.gz | \
    tar zxf - -C /usr/local --strip-components=1 && \
    chmod 755 /usr/local/bin


# TODO: Install symbiyosys for formal testing
RUN /app/src/install-oss-cad.sh
# Install LibreLane
#RUN pip3 install librelane==2.4.2
