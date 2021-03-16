FROM debian
LABEL maintainer="laurence.baldwin@gmail.com"
RUN apt-get update 
RUN apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
RUN cd /
RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir /xmrig/build 
RUN cd /xmrig/build; cmake .. 
RUN cd /xmrig/build; make
ENTRYPOINT ["/xmrig/build/xmrig"]
CMD ["--url","xmr.pool.gntl.co.uk:10009","--user","43YtAMg8uRQg6a8jktm34pKqBvU8JRgU1LrDUa1hHG7nXq9aS2fi2sySioPmDhwks35LAhjT2Qj2mhH3XVm1rFCu34CKqVw","--pass", "ArthurDent" ,"--tls","--no-color","--donate-level=1"]
