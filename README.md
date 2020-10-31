# Dockerfile for creating a full Ubuntu 18.04 image with cmake and Ninja

A [Ubuntu 18.04 Docker image](https://hub.docker.com/repository/docker/winksaville/ubuntu-cmake-ninja)
suitable for locally running Github Actions that need cmake and ninja
using [github.com/nektos/act](https://github.com/nektos/act).

This is based on the [18.04-full image here](https://hub.docker.com/r/nektos/act-environments-ubuntu/tags).

**Warning:**

This image is about 12GB compressed and 35GB uncompressed. On
my machine, which is an AMD 3900X with 32GB of RAM and a
fast internet connection, it took about 20min to download
the 12GB image and 9min to to extract!
```
$ time docker pull winksaville/ubuntu-cmake-ninja:18.04-full
18.04-full: Pulling from winksaville/ubuntu-cmake-ninja
5c939e3a4d10: Pull complete 
c63719cdbe7a: Pull complete 
19a861ea6baf: Pull complete 
651c9d2d6c4f: Pull complete 
8dd387d4677b: Pull complete 
2277daa6bda3: Pull complete 
44122f010d2c: Pull complete 
27df41a4b327: Pull complete 
6ff41af36e89: Pull complete 
dd9bc71c4a21: Pull complete 
Digest: sha256:10bf08709d1728ec0fa54d7bf60ab7a6c2ef50ba4cd2ab9cdeb73ed2d5880995
Status: Downloaded newer image for winksaville/ubuntu-cmake-ninja:18.04-full
docker.io/winksaville/ubuntu-cmake-ninja:18.04-full

real	28m41.547s
user	0m0.918s
sys	0m0.448s

$ docker images
REPOSITORY                       TAG                 IMAGE ID            CREATED             SIZE
winksaville/ubuntu-cmake-ninja   18.04-full          d3a084081e1c        6 hours ago         35GB
```

## Build
```
wink@3900x:~/prgs/docker/ubuntu-cmake-ninja (master)
$ docker build -t winksaville/ubuntu-cmake-ninja:18.04-full .
Sending build context to Docker daemon  44.03kB
Step 1/5 : FROM nektos/act-environments-ubuntu:18.04-full
 ---> d74dd75edae2
Step 2/5 : RUN sudo apt-get install cmake ninja-build
 ---> Running in bb95c35e483c
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  liblldb-6.0 liblldb-8
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  cmake-data librhash0 libuv1
Suggested packages:
  cmake-doc
The following NEW packages will be installed:
  cmake cmake-data librhash0 libuv1 ninja-build
0 upgraded, 5 newly installed, 0 to remove and 9 not upgraded.
Need to get 4719 kB of archives.
After this operation, 24.9 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 cmake-data all 3.10.2-1ubuntu2.18.04.1 [1332 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic/main amd64 librhash0 amd64 1.3.6-2 [78.1 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic/main amd64 libuv1 amd64 1.18.0-3 [64.4 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 cmake amd64 3.10.2-1ubuntu2.18.04.1 [3152 kB]
Get:5 http://archive.ubuntu.com/ubuntu bionic/universe amd64 ninja-build amd64 1.8.2-1 [93.3 kB]
Fetched 4719 kB in 2s (2809 kB/s)      
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package cmake-data.
(Reading database ... 205511 files and directories currently installed.)
Preparing to unpack .../cmake-data_3.10.2-1ubuntu2.18.04.1_all.deb ...
Unpacking cmake-data (3.10.2-1ubuntu2.18.04.1) ...
Selecting previously unselected package librhash0:amd64.
Preparing to unpack .../librhash0_1.3.6-2_amd64.deb ...
Unpacking librhash0:amd64 (1.3.6-2) ...
Selecting previously unselected package libuv1:amd64.
Preparing to unpack .../libuv1_1.18.0-3_amd64.deb ...
Unpacking libuv1:amd64 (1.18.0-3) ...
Selecting previously unselected package cmake.
Preparing to unpack .../cmake_3.10.2-1ubuntu2.18.04.1_amd64.deb ...
Unpacking cmake (3.10.2-1ubuntu2.18.04.1) ...
Selecting previously unselected package ninja-build.
Preparing to unpack .../ninja-build_1.8.2-1_amd64.deb ...
Unpacking ninja-build (1.8.2-1) ...
Setting up libuv1:amd64 (1.18.0-3) ...
Setting up cmake-data (3.10.2-1ubuntu2.18.04.1) ...
Setting up librhash0:amd64 (1.3.6-2) ...
Setting up cmake (3.10.2-1ubuntu2.18.04.1) ...
Setting up ninja-build (1.8.2-1) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Removing intermediate container bb95c35e483c
 ---> 45f69640b1ae
Step 3/5 : LABEL Description="Image suitable for running Github Actions locally using github.com/nektos/act"
 ---> Running in 1f6dec6e13eb
Removing intermediate container 1f6dec6e13eb
 ---> e4d655911eb6
Step 4/5 : LABEL Author="Wink Saville"
 ---> Running in d01d34ee47ea
Removing intermediate container d01d34ee47ea
 ---> 42d35d1e89ee
Step 5/5 : LABEL Email="wink@saville.com"
 ---> Running in 3a9eb632d12e
Removing intermediate container 3a9eb632d12e
 ---> d3a084081e1c
Successfully built d3a084081e1c
Successfully tagged winksaville/ubuntu-cmake-ninja:18.04-full
```

## Pushed using
```
wink@3900x:~/prgs/cmake/projects/gha-cmake-HelloWorld (Simpler)
$ docker push winksaville/ubuntu-cmake-ninja:18.04-full
The push refers to repository [docker.io/winksaville/ubuntu-cmake-ninja]
a9935acfca9e: Pushed 
f41a153ec141: Layer already exists 
0f4f66d8b6c2: Layer already exists 
a9747d73d8ed: Layer already exists 
0f22c2599cf3: Layer already exists 
94baca1d8950: Layer already exists 
f55aa0bd26b8: Layer already exists 
1d0dfb259f6a: Layer already exists 
21ec61b65b20: Layer already exists 
43c67172d1d1: Layer already exists 
18.04-full: digest: sha256:10bf08709d1728ec0fa54d7bf60ab7a6c2ef50ba4cd2ab9cdeb73ed2d5880995 size: 2425
```
