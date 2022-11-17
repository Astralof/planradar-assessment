#!/bin/bash
set -e
cd /planradar-assessment

echo "running as $(id)"
echo "starting in $(pwd)"

if [ -d /planradar-assessment/tmp ]; then
  rm -rf /planradar-assessment/tmp
fi

exec bundle exec "$@"