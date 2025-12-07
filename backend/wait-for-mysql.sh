#!/bin/bash

echo "⏳ Waiting for MySQL to be ready..."

while true; do
    if mysql -h"$DB_HOST" -P"${DB_PORT:-3306}" -u"${DB_USERNAME:-root}" -p"${DB_PASSWORD:-}" --skip-ssl -e "SELECT 1" >/dev/null 2>&1; then
        break
    fi
    sleep 1
done

echo "✅ MySQL is ready!"
