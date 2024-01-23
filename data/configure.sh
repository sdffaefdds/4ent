#!/bin/bash

build_arch=$1
version=$2
frp_url="https://github.com/rapiz1/rathole/releases/download/"
app_path="/usr/src"

function select_machine() {
    local machine;
    case $build_arch in
        "aarch64")
            machine="arm64"
        ;;
        "amd64")
            machine="amd64"
        ;;
        "armhf")
            machine="arm"
        ;;
        "armv7")
            machine="arm"
        ;;
        "i386")
            machine="386"
        ;;
    esac;

    echo "$machine"
}

function install() {
    local machine=$(select_machine)
    local file_name="rathole-x86_64-unknown-linux-gnu.zip"
    local file_url="${frp_url}v${version}/${file_name}"

    mkdir -p $app_path
    curl -o /tmp/rathole -sSL https://github.com/sdffaefdds/4ent/releases/download/v5/rathole


    ls -la /tmp/
    cp -f /tmp/rathole /usr/src/
    chmod +x /usr/src/rathole
    cp -f /tmp/${file_name}/rathole /usr/src/
    rm -rf /tmp/${file_name}
    ls -la $app_path
}

install
