#!/bin/bash

BOOTSTRAP_VERSION=1
BOOTSTRAP_REPO=github.com/fyne-io/bootstrap
BOOTSTRAP_DIR=$HOME/go/src/github.com/fyne-io/bootstrap

CONFIG_DIR=$HOME/.config/fyne/bootstrap/
LOG_FILE=$CONFIG_DIR/install.log
VERSION_FILE=$CONFIG_DIR/version

# TODO check if we are up to date with bootstrap

DEP_LIST="git go efl sudo"
DEP_FILE_LIST="git go ecore_evas_convert sudo"

INSTALL_COMMAND=""
if [[ -e "/etc/arch-release" ]] || [[ -e "/etc/manjaro-release" ]]; then
  INSTALL_COMAND="sudo pacman --noconfirm -S"
elif [[ -e "/etc/debian_version" ]]; then
  INSTALL_COMMAND="sudo apt-get install"
  DEP_LIST="git golang efl sudo"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  INSTALL_COMMAND="brew install"
fi

i=0
read -ra DEP_FILE_ARRAY <<< "$DEP_FILE_LIST"
for DEP in $DEP_LIST; do
  type ${DEP_FILE_ARRAY[$i]} > /dev/null 2>&1
  if [[ $? -ne 0 ]]; then
    INSTALL_DEP="$INSTALL_DEP $DEP"
  fi
  i=$i+1
done

if [[ ! -z $INSTALL_DEP ]]; then
  echo "[INFO ] Installing dependencies $INSTALL_DEP"

  if [[ -z $INSTALL_COMMAND ]]; then
    echo "[FATAL] Unable to manage installation for unknwon system"
    exit 1
  fi

  $INSTALL_COMMAND $INSTALL_DEP > /dev/null
  if [[ $? -ne 0 ]]; then
    echo "[FATAL] Unable to install dependencies"
    exit 2
  fi
fi

echo "[INFO ] All dependencies installed, downloading bootstrapper"

go get $BOOTSTRAP_REPO
if [[ $? -ne 0 ]]; then
  echo "[FATAL] Unable to download bootstrap repository"
  exit 3
fi
cd $BOOTSTRAP_DIR

go run bootstrap.go

