#!/bin/bash -i

cdroot=~

pip install --user kaggle

cd $cdroot

echo 'export PATH=~/.local/bin:$PATH' >> .bashrc

#source .bashrc
exec bash

#Now Export token from kaggle accout API token, see README
