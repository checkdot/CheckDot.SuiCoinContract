# CheckDot Sui Coin Contract

#### Install

UTIL: https://docs.sui.io/build/install#install-sui-binaries

testnet: `cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui`
mainnet: `cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui`

`aptos init`

#### Compile

`sui move build`

#### Deploy

```shell
sui client publish
```

#### Burn

Example of burn of 1 CDT:

```
sui client call --package 0xa7fb4ed6e4965255acdca8bc1640d9701cb788d063320cfa7e041e5b8a0aa1aa --module cdt --function burn --args 0x78e14eb518738673e91c694f6046d1d4be9a7341d265168c537faee2c208d667 0x78e14eb518738673e91c694f6046d1d4be9a7341d265168c537faee2c208d667 --gas-budget 1000000
```

#### Unused Test Addresses (On Mainnet)

0xa7fb4ed6e4965255acdca8bc1640d9701cb788d063320cfa7e041e5b8a0aa1aa::cdt::CDT

#### Final Address (On Mainnet Final used Address)


[0x711d2704034eeb509104481a99a556f17b6b444c7fed7cfb223fd5567af843ad::cdt::CDT](https://suivision.xyz/coin/0x711d2704034eeb509104481a99a556f17b6b444c7fed7cfb223fd5567af843ad::cdt::CDT)
SuiVision Link: [https://suivision.xyz/coin/0x711d2704034eeb509104481a99a556f17b6b444c7fed7cfb223fd5567af843ad::cdt::CDT](https://suivision.xyz/coin/0x711d2704034eeb509104481a99a556f17b6b444c7fed7cfb223fd5567af843ad::cdt::CDT)