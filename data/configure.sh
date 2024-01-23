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
    local file_dir=$(echo ${file_name} | sed 's/.zip//')

    mkdir -p /tmp/$file_dir
    mkdir -p $app_path
    curl -o /tmp/${file_name} -sSL $file_url
    unzip /tmp/${file_name} -d /tmp

    ls -la /tmp/
    cp -f /tmp/rathole ${app_path}/
    rm -rf /tmp/${file_name}
    rm -rf /tmp/${file_dir}
    ls -la $app_path
}

install
