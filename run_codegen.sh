#!/usr/bin/env bash

BASE='/workspace'
TGWBASE="$BASE/text-generation-webui"
MODEL='TheBloke/WizardCoder-15B-1.0-GPTQ'
MODEL_DIR=$(echo $MODEL | awk -F '/' '{ print $2 }')

apt update && apt upgrade git -y && apt install tmux vim psmisc less unzip git-lfs -y
python -m pip install --upgrade pip
python -m pip install virtualenv auto-gptq

cd $BASE
git clone https://github.com/oobabooga/text-generation-webui.git
cd $TGWBASE
python -m venv venv
source venv/bin/activate

cd $TGWBASE/models
git lfs install
git clone https://huggingface.co/$MODEL
#export GIT_LFS_SKIP_SMUDGE=1; git clone https://huggingface.co/$MODEL
#cd $MODEL_DIR
#wget https://huggingface.co/$MODEL/resolve/main/model.safetensors

cd $TGWBASE
#echo "--listen --chat --auto-devices --model llama" >> CMD_FLAGS.txt
echo "--listen --chat --auto-devices --model $MODEL_DIR" >> CMD_FLAGS.txt
export GPU_CHOICE='A'
bash start_linux.sh
