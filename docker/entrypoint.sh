#!/bin/bash
set -e

while ! ./bin/rails db:migrate; do sleep 10; done;

# Remove a potentially pre-existing server.pid for Rails.
rm -f /beerApi/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"