# Financial Data API

Access market, historical stock, screening, and public financial data through the corresponding Muapi endpoints. Confirm symbols, modes, and response shape from each schema.

[Muapi Financial Data API landing page](https://muapi.ai/financial-data-api) · [API reference](https://muapi.ai/docs/api-reference) · [Create an API key](https://muapi.ai/access-keys)

## Related Projects

- [Lead-Enrichment-API](https://github.com/Anil-matcha/Lead-Enrichment-API)
- [Ecommerce-Intelligence-API](https://github.com/Anil-matcha/Ecommerce-Intelligence-API)

## What this API covers

Use the endpoint that matches the task and input media. The routes below are enabled Muapi model IDs checked against the current model catalog; availability, request fields, and pricing can change, so verify the linked landing page and endpoint schema before production use.

| Endpoint | Purpose | Category |
|---|---|---|
| `crypto-market-data` | CryptoMarketDataResult | `Text to Text` |
| `market-stock-history` | MarketStockHistoryResult | `Text to Text` |
| `market-stock-screener` | MarketStockScreenerResult | `Text to Text` |
| `company-public-financials` | CompanyPublicFinancialsResult | `Text to Text` |

## Quick start

Muapi uses an asynchronous REST contract. Submit a JSON request with your API key, save the returned `request_id`, then poll the result endpoint. Replace sample URLs with files you control and fields with values supported by the selected endpoint.

```bash
curl -X POST https://api.muapi.ai/api/v1/crypto-market-data \
  -H "Content-Type: application/json" \
  -H "x-api-key: $MUAPI_API_KEY" \
  -d '{
    "mode": "quote",
    "coin_id": "bitcoin"
  }'
```

### Request fields in this example

| Field | Requirement | Notes |
|---|---|---|
| `mode` | Optional | Which crypto market data to return. |
| `coin_id` | Optional | CoinGecko coin id, e.g. bitcoin, ethereum. Required for quote/profile/history. |

### Poll for the result

```bash
curl "https://api.muapi.ai/api/v1/predictions/$REQUEST_ID/result" \
  -H "x-api-key: $MUAPI_API_KEY"
```

Poll until the task status is `completed` or `failed`. Read the response’s output URLs on completion; download outputs you need to retain, since provider-hosted URLs may expire.

## Choosing an endpoint

Compare supported inputs and output behavior first, then resolution, duration, quality controls, latency, and price for your use case. Similar names do not guarantee interchangeable request schemas. This repository lists representative routes; the [landing page](https://muapi.ai/financial-data-api) contains the current task-specific explanation, examples, and pricing context.

## Errors and production notes

- Keep the API key in an environment variable; do not commit credentials.
- Validate inputs against the selected endpoint’s current schema.
- Handle non-success HTTP responses and failed task states explicitly.
- Retry only when appropriate for the error; avoid submitting duplicate billable jobs after a timeout without checking the original `request_id`.
- Confirm current pricing and availability on the Muapi page before estimating production cost.

## Links

- [Muapi Financial Data API](https://muapi.ai/financial-data-api)
- [API reference](https://muapi.ai/docs/api-reference)
- [Playground](https://muapi.ai/playground)
- [API key setup](https://muapi.ai/access-keys)
