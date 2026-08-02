#!/usr/bin/env sh
set -eu

script_dir="$(readlink -f "$(dirname "$0")")"

COMPOSE_FILE=${COMPOSE_FILE:-"$script_dir/compose.yml"}
MARIADB_SERVICE=${MARIADB_SERVICE:-db}
MARIADB_DATABASE=${MARIADB_DATABASE:-pinakes}
MARIADB_USER=${MARIADB_USER:-user}
MARIADB_PASSWORD=${MARIADB_PASSWORD:-user}

PODMAN_COMPOSE_WARNING_LOGS=false \
exec podman compose -f "$COMPOSE_FILE" exec \
  -e MYSQL_PWD="$MARIADB_PASSWORD" \
  "$MARIADB_SERVICE" mariadb -u "$MARIADB_USER" --database="$MARIADB_DATABASE" "$@"
