#!/bin/bash
# Init Foocus & bot
python /Fooocus/entry_with_update.py --preset realistic --share &
python /Fooocus-discord-autopublish--docker/autopublish.py
