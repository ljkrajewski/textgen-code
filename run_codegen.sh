#!/usr/bin/env bash

BASE='/workspace'
TGWBASE="$BASE/text-generation-webui"
#MODEL='TheBloke/WizardCoder-15B-1.0-GPTQ'
#   https://huggingface.co/TheBloke/WizardCoder-15B-1.0-GPTQ#how-to-easily-download-and-use-this-model-in-text-generation-webui
MODEL='TheBloke/WizardCoder-Python-34B-V1.0-GPTQ'   #Original: WizardLM/WizardCoder-Python-34B-V1.0
#   https://huggingface.co/TheBloke/WizardCoder-Python-34B-V1.0-GPTQ#how-to-easily-download-and-use-this-model-in-text-generation-webui
#MODEL='WizardLM/WizardCoder-Python-34B-V1.0'   #Original: WizardLM/WizardCoder-Python-34B-V1.0
#   https://huggingface.co/TheBloke/WizardCoder-Python-34B-V1.0-GPTQ#how-to-easily-download-and-use-this-model-in-text-generation-webui
MODEL_DIR=$(echo $MODEL | awk -F '/' '{ print $2 }')

## Prereqs
apt update && apt upgrade git -y && apt install tmux vim psmisc less unzip git-lfs -y
python -m pip install --upgrade pip
python -m pip install virtualenv auto-gptq

## Install Oobabooga & start virtual environment
cd $BASE
git clone https://github.com/oobabooga/text-generation-webui.git
cd $TGWBASE
python -m venv venv
source venv/bin/activate

## Download model from Hugging Face
cd $TGWBASE/models
git lfs install
git clone --single-branch --branch main https://huggingface.co/$MODEL
##  If git chokes on the large files...
#export GIT_LFS_SKIP_SMUDGE=1; git clone --single-branch --branch main https://huggingface.co/$MODEL
#cd $MODEL_DIR
#wget https://huggingface.co/$MODEL/resolve/main/model.safetensors

## Command-line flag options:  https://github.com/oobabooga/text-generation-webui#starting-the-web-ui
cd $TGWBASE
#echo "--listen --chat --model llama" >> CMD_FLAGS.txt
#echo "--listen --chat --auto-devices --cpu --model $MODEL_DIR" >> CMD_FLAGS.txt
echo "--listen --chat --model $MODEL_DIR" >> CMD_FLAGS.txt
#echo "--listen --listen-port 7860 --chat --cpu --model $MODEL_DIR" >> CMD_FLAGS.txt

## GPU_CHOICE options
#    A) NVIDIA
#    B) AMD (Linux/MacOS only. Requires ROCm SDK 5.6 on Linux)
#    C) Apple M Series
#    D) Intel Arc (IPEX)
#    N) None (I want to run models in CPU mode)
export GPU_CHOICE='A'

bash start_linux.sh
