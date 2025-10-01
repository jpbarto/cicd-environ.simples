#!/bin/sh

cd terraform
tofu init
tofu plan
tofu apply -auto-approve
