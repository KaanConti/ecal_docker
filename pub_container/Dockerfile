# ecal base image
FROM ecal-runtime

# Set the working directory inside the container
WORKDIR /src/pub

# Copy your application files into the container
COPY CMakeLists.txt main.cpp ./
RUN cmake . && make

# Set the host group name using the ARG
ARG host_group_name
RUN sed -i "s/host_group_name\s*=\s*\"\"/host_group_name = $host_group_name/" /etc/ecal/ecal.ini

# Copy the network_configure.sh script into the container
COPY network_configure.sh /usr/local/bin/network_configure.sh

# Make the network_configure.sh script executable
RUN chmod +x /usr/local/bin/network_configure.sh

# Set the script to run as the entrypoint
ENTRYPOINT ["/usr/local/bin/network_configure.sh"]
