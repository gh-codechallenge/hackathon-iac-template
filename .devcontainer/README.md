# Codespace for Infrastructure Workflows

## Summary

This is a baseline Codespace container for use in general CSE infrastructure-specific workflows. Includes Git, kubectl, Helm, minikube, Terraform and Docker. The included `.devcontainer/devcontainer.json` uses the infra-specific docker image stored in the GHCR.

If you want to add / make changes to that upstream image for all users, please open a PR at https://github.com/gh-inner/gh-container-codespaces-base/tree/main/containers/debian-infra

For more info about the features in this codespace devcontainer and how to use them, go here: https://github.com/gh-inner/gh-container-codespaces-base/blob/main/containers/debian-infra/README.md