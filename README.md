# xmrig Docker Image
Docker container for running xmrig to mine Crypto on CPU. 
Tested mining Monero (XMR) on Intel, AMD and ARM (Raspberry Pi). 

## RPi (Raspberry Pi) Support
Works on Rasperry Pi devices with ARMv7 or greater CPU
    cat /proc/cpuinfo | grep model | uniq
    model name      : ARMv7 Processor rev 4 (v7l)
Unfortunatley does not work on older ARMv6 devices as they are no supported by xmrig (https://github.com/xmrig/xmrig/issues/437)

# Quick install and run
    laurence@raspberrypi $ docker build -t xmrig https://github.com/baldy-cape/xmrig.git
    laurence@raspberrypi $ docker run -d --name xmrig xmrig
## Check the output 
    laurence@raspberrypi $ docker logs xmrig

# Hashrate Comparison
##Intel(R) Core(TM) i7-8565U
    |    CPU # | AFFINITY | 10s H/s | 60s H/s | 15m H/s |
    |        0 |        0 |   230.3 |     n/a |     n/a |
    |        1 |        1 |   226.2 |     n/a |     n/a |
    |        2 |        2 |   258.5 |     n/a |     n/a |
    |        3 |        3 |   262.9 |     n/a |     n/a |
    |        - |        - |   977.9 |     n/a |     n/a |

##ARMv7 (Raspberry Pi 3 Model B Plus Rev 1.3)
    |    CPU # | AFFINITY | 10s H/s | 60s H/s | 15m H/s |
    |        0 |       -1 |     n/a |     n/a |     0.5 |
    |        1 |       -1 |     n/a |     n/a |     0.5 |
    |        2 |       -1 |     n/a |     n/a |     0.5 |
    |        3 |       -1 |     n/a |     n/a |     0.5 |
    |        - |        - |     n/a |     n/a |     1.9 |

# Example with custom settings
    laurence@raspberrypi $ docker run -it xmrig /xmrig/build/xmrig --url xmr.pool.gntl.co.uk:10009 --user 43YtAMg8uRQg6a8jktm34pKqBvU8JRgU1LrDUa1hHG7nXq9aS2fi2sySioPmDhwks35LAhjT2Qj2mhH3XVm1rFCu34CKqVw --pass XXXX --tls  --donate-level=1  --cpu-no-yield
 


