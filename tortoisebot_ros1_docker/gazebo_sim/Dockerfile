FROM nvidia_ros1:latest

# Minimal setup
RUN apt-get update \
 && apt-get install -y locales lsb-release\
 build-essential
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales

