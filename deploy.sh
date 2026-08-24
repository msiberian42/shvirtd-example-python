#!/bin/bash

set -e

REPO_URL="https://github.com/msiberian42/shvirtd-example-python.git"
PROJECT_DIR="/opt/my_service"

git clone "$REPO_URL" "$PROJECT_DIR"

cd "$PROJECT_DIR"

docker compose up -d
