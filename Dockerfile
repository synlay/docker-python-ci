FROM phusion/baseimage:0.9.18

MAINTAINER David Robakowski <david.robakowski@synlay.com>

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT 2016-01-02

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN add-apt-repository ppa:fkrull/deadsnakes \
	&& apt-get update -qq \
	&& apt-get install -y \
			python-dev \
			python2.6 python2.6-dev \
			python2.7 python2.7-dev \
			python3.3 python3.3-dev \
			python3.4 python3.4-dev \
			python3.5 python3.5-dev \
			pypy pypy-dev \
			python-flake8 \
			python-tox \
			python-pip \
			git \
			wget

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
