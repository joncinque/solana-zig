#!/usr/bin/env bash
set -e
case $(uname -s | cut -c1-7) in
"Windows")
  vcpkg install openssl:x64-windows-static-md
  vcpkg integrate install
  choco install protoc
  export PROTOC='C:\ProgramData\chocolatey\lib\protoc\tools\bin\protoc.exe'
  ;;
"Darwin")
  brew install protobuf
  ;;
"Linux")
  sudo apt update
  sudo apt install protobuf-compiler -y
  ;;
*)
  echo "Unknown Operating System"
  exit 1
  ;;
esac
