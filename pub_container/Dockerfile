#ecal base image:
FROM ecal-runtime

WORKDIR /src/pub

COPY CMakeLists.txt main.cpp ./
RUN cmake . && make

ARG host_group_name
RUN sed -i "s/host_group_name\s*=\s*\"\"/host_group_name = $host_group_name/" /etc/ecal/ecal.ini

CMD ./hello_world_snd