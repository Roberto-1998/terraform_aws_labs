#!/bin/bash

echo "Buscando carpetas '.terraform' en el directorio actual y subdirectorios..."

find . -type d -name ".terraform" | while read dir; do
  parent_dir=$(dirname "$dir")
  echo "Eliminando .terraform en: $parent_dir"
  rm -rf "$dir"
done

echo "✅ Proceso completado."

