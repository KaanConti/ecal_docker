# Base image:
FROM ubuntu:focal

# Copy eCAL package from local directory
COPY ecal-neu.deb /tmp/ecal.deb

# Install eCAL from copied package
RUN apt-get update && \
    apt-get install -y /tmp/ecal.deb && \
    rm -rf /var/lib/apt/lists/* /tmp/ecal.deb

# Add additional repositories
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe

# Install dependencies for compiling the hello world examples.
# You can omit this if you don't want to build applications in the container.
RUN apt-get update && \
    apt-get install -y cmake g++ libprotobuf-dev protobuf-compiler

# Set network_enabled = true in ecal.ini.
# You can omit this if you only need local communication.
RUN awk -F"=" '/^network_enabled/{$2="= true"}1' /etc/ecal/ecal.ini > /etc/ecal/ecal.tmp && \
    rm /etc/ecal/ecal.ini && \
    mv /etc/ecal/ecal.tmp /etc/ecal/ecal.ini

ARG host_group_name
RUN sed -i "s/host_group_name\s*=\s*\"\"/host_group_name = $host_group_name/" /etc/ecal/ecal.ini
RUN echo $host_group_name


RUN apt-get update && apt-get install -y vim
RUN apt-get update && apt-get install -y iputils-ping

# Install iproute2 package
RUN apt-get update && \
    apt-get install -y iproute2 && \
    rm -rf /var/lib/apt/lists/* \
# Print the eCAL config
RUN ecal_config
