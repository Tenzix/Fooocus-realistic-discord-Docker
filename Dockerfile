FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel-ubuntu22.04

RUN apt-get update && apt-get upgrade -y && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN git clone https://github.com/lllyasviel/Fooocus.git
RUN git clone https://github.com/Tenzix/Fooocus-discord-autopublish--docker.git

ENV DISCORD_TOKEN=
ENV DISCORD_CHANNEL_ID=

RUN pip install watchdog discord.py


RUN pip install --upgrade --no-cache-dir jupyterlab ipywidgets jupyter-archive jupyter_contrib_nbextensions



RUN git clone https://github.com/Tenzix/Foocus-preset-.git /temp-repo
RUN cp /temp-repo/realistic.json /Fooocus/presets/realistic.json


WORKDIR /Fooocus

# checkpoints
RUN wget -O models/checkpoints/juggernautXL_version6Rundiffusion.safetensors https://huggingface.co/lllyasviel/fav_models/resolve/ab64b5c8d6607a0212abd119916a38db975a68ea/fav/juggernautXL_version6Rundiffusion.safetensors?download=true && \
    wget -O models/checkpoints/realisticVisionV60B1_v60B1VAE.safetensors https://huggingface.co/lllyasviel/fav_models/resolve/ab64b5c8d6607a0212abd119916a38db975a68ea/fav/realisticVisionV51_v51VAE.safetensors?download=true

# loras
RUN wget -O models/loras/Hotel_Interior.safetensors https://matthieu-delacour.com/launcher/ia/HotelInteriorDesign_GuestRoomV2.safetensors && \
    wget -O models/loras/Insta_baddies.safetensors https://matthieu-delacour.com/launcher/ia/insta_baddies_v1.safetensors && \
    wget -O models/loras/Modern_Bedroom.safetensors https://matthieu-delacour.com/launcher/ia/ModernBedroom-000012.safetensors && \
    wget -O models/loras/Nordic_Modern_Interior_Style.safetensors https://matthieu-delacour.com/launcher/ia/Nordic_Modern_Interior_Style.safetensors && \
    wget -O models/loras/Woman_life_actions.safetensors https://matthieu-delacour.com/launcher/ia/Woman_life_actions.safetensors

    
RUN pip install --no-cache-dir xformers==0.0.22 \
    && pip install --no-cache-dir -r requirements_versions.txt


CMD ["python", "/Fooocus-discord-autopublish--docker/autopublish.py"]



# # Set up Jupyter Notebook

# RUN pip install notebook==6.5.5
# RUN jupyter contrib nbextension install --user && \
#     jupyter nbextension enable --py widgetsnbextension
# EXPOSE 8888

# # Discord bot can't run with jupyter
# RUN echo "jupyter lab --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.allow_origin='*' --notebook-dir=/" >> /start.sh

# RUN chmod +x /start.sh
# CMD ["/start.sh"]
