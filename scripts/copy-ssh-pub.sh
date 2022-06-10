#!/usr/bin/env bash

ssh-copy-id -i ~/.ssh/id_rsa.pub ${1}@${2}
