# Docker Image for Fooocus Realistic Preset

This Docker image is designed to run the Fooocus image editing application with the "realistic" preset. Fooocus is a command-line-based image editing tool.

## Environment Variables

Before running the container, ensure you set the following environment variables:

- `DISCORD_TOKEN`: Your Discord authentication token.
- `DISCORD_CHANNEL_ID`: The ID of the Discord channel where you want to publish the generated images.

## Usage

1. Build the Docker image using the following command:

   ```
   docker build -t tenzix/fooocusrunpod .
   ```

2. Once the image is built, run a container using the following command:

   ```
   docker run -d --name fooocus-container -e DISCORD_TOKEN=YOUR_DISCORD_TOKEN -e DISCORD_CHANNEL_ID=YOUR_DISCORD_CHANNEL_ID tenzix/fooocusrunpod
   ```

   Replace `YOUR_DISCORD_TOKEN` and `YOUR_DISCORD_CHANNEL_ID` with your own values.

3. Access the container by running the following command in a terminal:

   ```
   python entry_with_update.py --preset realistic --share
   ```

   This command will launch Fooocus with the "realistic" preset and enable image sharing.

## Pre-trained Models

The Dockerfile downloads several pre-trained models required for running Fooocus. The models are downloaded from various sources, including Hugging Face and external URLs. Ensure you have enough available disk space to store these models.

# Easy deploy on Rundpod template 
Click and run 🚀 https://runpod.io?ref=19ex0x7p

Install & run this in your web terminal when container is ready, and get the web url 🔗
```
python entry_with_update.py --preset realistic --share
```
