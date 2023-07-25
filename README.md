## Development

Follow the steps outlined below to set up your development environment.

1. **Initialize and Update Submodules**

   This project uses Git submodules. To initialize and update them, run the following command in your terminal:

   ```bash
   git submodule update --init --recursive
   ```

2. **Run test**

   ```bash
   ./test.sh
   ```
   

## Deployment

```bash
flow deploy -n testnet -f flow.json -f flow-keys.json
```