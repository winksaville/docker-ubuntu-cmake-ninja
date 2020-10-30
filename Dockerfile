FROM nektos/act-environments-ubuntu:18.04-full
RUN sudo apt-get install cmake ninja-build
LABEL Description="Image suitable for running Github Actions locally using github.com/nektos/act"
LABEL Author="Wink Saville"
LABEL Email="wink@saville.com"
