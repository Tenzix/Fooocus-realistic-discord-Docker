#!/bin/bash
# Start Fooocus
python /Fooocus/entry_with_update.py --preset realistic --share &

# Start Python Discord bot
python /Fooocus-discord-autopublish--docker/autopublish.py
