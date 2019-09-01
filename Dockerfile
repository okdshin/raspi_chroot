FROM debian:stretch


RUN apt-get update && apt-get install -y \
   qemu-user-static binfmt-support \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /raspbian

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
