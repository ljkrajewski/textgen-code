# Researching LLM Sources
1. Most LLM models are hosted on [Hugging Face](https://huggingface.co/models).
2. Each model on Hugging Face has a model card (for example, [mistralai/Mistral-7B-Instruct-v0.2](https://huggingface.co/mistralai/Mistral-7B-Instruct-v0.2)) that contains:
   - who created the model (in this example, Mistral AI [[website](https://mistral.ai/), [Wikipedia article](https://en.wikipedia.org/wiki/Mistral_AI)])
   - that may information on how the model was generated. Possible methods include:
     - training sets used,
     - LLMs merged,
     - Links to papers outlining how it the model was created.  

In this example, the Mistral-7B-Instruct-v0.2 LLM was fine-tuned from the Mistral-7B-v0.2 LLM. A [paper](https://arxiv.org/abs/2310.06825) and a [blog post](https://mistral.ai/news/la-plateforme/) on how Mistral-7B was created.
