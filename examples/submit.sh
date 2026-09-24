#!/usr/bin/env bash
set -euo pipefail
: "${MUAPI_API_KEY:?Set MUAPI_API_KEY first}"
curl --fail-with-body -sS -X POST https://api.muapi.ai/api/v1/crypto-market-data \
  -H "Content-Type: application/json" \
  -H "x-api-key: $MUAPI_API_KEY" \
  -d '{"mode": "quote", "coin_id": "bitcoin"}'
