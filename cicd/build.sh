#!/bin/bash

# install opentofu
# Download the installer script:
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh

# Give it execution permissions:
chmod +x install-opentofu.sh

# Run the installer:
./install-opentofu.sh --install-method deb

# Remove the installer:
rm -f install-opentofu.sh

pushd terraform
tofu fmt
tofu init
tofu validate
popd

helm install --dry-run noop --debug ./helm/simples
