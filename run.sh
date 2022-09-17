#!/usr/bin/env bash

# Variables
deck_ip=192.168.0.9



# Ping
if ! ping -q -c 1 -W 1 $deck_ip > /dev/null; then
    echo "Deck is not reachable at $deck_ip"
    exit 1
fi


# Create and enter virtual environment
if ! [ -d .venv ]; then
    python3 -m venv .venv
fi
source .venv/bin/activate

# Install ansible if it isn't installed
pip3 install ansible


# Run playbooks
.venv/bin/ansible-playbook ./playbooks/emulation.yaml

deactivate
