#!/usr/bin/env bash

sudo -v;

# git latest stabale version
sudo add-apt-repository ppa:git-core/ppa;
sudo apt update;
sudo apt install -y git;
