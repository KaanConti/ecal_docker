#ecal base image:
FROM ecal-runtime

WORKDIR /src/sub

COPY CMakeLists.txt main.cpp ./
RUN cmake . && make

ARG host_group_name
RUN sed -i "s/host_group_name\s*=\s*\"\"/host_group_name = $host_group_name/" /etc/ecal/ecal.ini

CMD ./hello_world_rec



#RUN echo "Host group name:" > output.log
#RUN cat /etc/ecal/ecal.ini | grep host_group_name >> output.log

#CMD ./hello_world_rcv
