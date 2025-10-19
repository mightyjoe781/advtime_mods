#!/bin/bash
set -e

PATCH_DIR="$(pwd)/.patches"

for patch in "$PATCH_DIR"/*.patch; do
  submodule_name=$(basename "$patch" .patch)

  # Ensure submodule directory exists
  if [ ! -d "$submodule_name" ]; then
    echo "Skipping $submodule_name — directory not found."
    continue
  fi

  echo "Applying patch to $submodule_name..."

  (
    cd "$submodule_name"
    git apply "$patch"
  )
done
