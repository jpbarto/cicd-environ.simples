#!/bin/sh

cd terraform
tofu fmt
tofu init
tofu validate
