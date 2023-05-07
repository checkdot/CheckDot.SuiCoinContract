# CheckDot Sui Coin Contract

#### Install

UTIL: https://docs.sui.io/build/install#install-sui-binaries

testnet: `cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui`
mainnet: `cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui`

`aptos init`

#### Compile

`aptos move compile`

#### Deploy

```shell
aptos move publish
aptos move run --function-id x::CdtCoin::init
```

sui client publish --path . --gas-budget 10000

#### Burn

Example of burn of 1 CDT:

```
aptos move run --function-id x::CdtCoin::burn_amount --args u64:100000000
```

```
    sui client call --gas-budget 1000 --package $SUIX --module "suix" --function "add_liquidity_" --args $SUIX_POOL $YOUR_SUI
```

#### Unused Test Addresses (On Mainnet)

X::cdt::CDT

#### Final Address (On Mainnet Final used Address)

X::CdtCoin::CDT
TraceMove Link: ...