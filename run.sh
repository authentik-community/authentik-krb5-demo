#!/usr/bin/env bash

set -euo pipefail

echo "Usage: ./run.sh <SPNEGO domain>"
domain="${1}"

docker compose pull
docker compose up -d
sleep 2
docker compose exec kdc kadmin.local addprinc -randkey authentik/admin@AUTHENTIK.COMPANY
docker compose exec kdc kadmin.local addprinc -randkey "HTTP/${domain}@AUTHENTIK.COMPANY"
docker compose exec kdc kadmin.local ktadd -k /shared/admin.keytab authentik/admin@AUTHENTIK.COMPANY
docker compose exec kdc kadmin.local ktadd -k /shared/spnego.keytab "HTTP/${domain}@AUTHENTIK.COMPANY"
docker compose exec kdc chmod 777 /shared/admin.keytab /shared/spnego.keytab
