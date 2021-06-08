#!/usr/bin/env bash
rm -rf build/*
ansible-playbook -i inventory.yml playbook.yml -v
