#!/bin/sh

pushd terraform
tofu fmt
tofu init
tofu validate
popd

helm install --dry-run goodman --debug ./helm/simples
