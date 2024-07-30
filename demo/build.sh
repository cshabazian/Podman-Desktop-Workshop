#!/bin/sh
#  To run: curl -s https://raw.githubusercontent.com/cshabazian/Podman-Desktop-Workshop/main/demo/build.sh | bash
curl -s https://raw.githubusercontent.com/cshabazian/Podman-Desktop-Workshop/main/demo/wordpress.sh | bash
mkdir -p ~/webserver_9.3/content
curl -s https://raw.githubusercontent.com/cshabazian/Podman-Desktop-Workshop/main/demo/content/index.html -o ~/webserver_9.3/content/index.html
curl -s https://raw.githubusercontent.com/cshabazian/Podman-Desktop-Workshop/main/demo/Containerfile -o ~/webserver_9.3/Containerfile
