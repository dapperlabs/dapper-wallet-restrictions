## Dapper Wallet Restrictions

This contract contains restrictions dapper imposes on collections that are stored on dapper custodial wallet

| Network | Address            |
|---------|--------------------|
| Mainnet | 0x2d4cebdb9eca6f49 |
| Testnet | 0xa7d10afc50b14991 |

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

### Deploy contract
```bash
flow deploy -n testnet
```

### Update contract
```bash
flow accounts update-contract contracts/DapperWalletRestrictions.cdc DapperWalletRestrictions --signer dapper-wallet-restrictions-testnet
```

### Add Restriction
```bash
flow transactions send transactions/add_restriction.cdc "A.69f6cf3aacf5b1b1.Magic.Collection" '{"CAN_INIT":true}' --signer dapper-wallet-restrictions-testnet -n testnet

flow transactions send transactions/add_restriction.cdc "A.edf9df96c92f4595.Pinnacle.NFT" '{"CAN_SELL":true, "CAN_TRADE":true, "CAN_TRADE_EXTERNAL":false, "CAN_TRADE_DIFF_NFT":false}' --signer dapper-wallet-restrictions-mainnet -n mainnet
```