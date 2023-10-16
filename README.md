# textgen-code
The goal of this project is to have an easy way to spin up and run an LLM using Oobabooga's text-generation-webui on Runpod.

## To use:
1. Go to [RunPod.io](https://runpod.io/) and log in.
2. Go to _Templates_ and pick the _RunPod Pytorch 2.0.1_ template.
3. Select a pod to start.
   - Recommended VRAM:  48GB+ for 13B+ LLMs or hi-res Stable Diffusion pictures, 20GB
4. Set the following customizations:
   - Volume size: 150GB
   - HTTP service ports: 8888, 7860
5. Start the pod instance.
6. Once RunPod instance has finished booting up, open a terminal through an SSH connection using 
```
ssh <account/address provided by RunPod> -i ~/.ssh/runpod_key
```  
7. Inside the terminal, run the following commands:
```
cd /workspace
git clone https://github.com/ljkrajewski/textgen-code.git
/workspace/textgen-code/run_me_first.sh
```
8. When the script is finished, start a _tmux_ session.
```
$ tmux
```
> If you lose connection to your RunPod instance, reconnect to the instance with SSH, then attach to the running _tmux_ session.
> ```
> $ tmux attach
> ```
9. Inside the _tmux_ session, run ```run_codegen.sh```. This will download and install the web UI and models.
10. When the web UI starts running, connect to the webui through the _connect_ button for your RunPod instance.
