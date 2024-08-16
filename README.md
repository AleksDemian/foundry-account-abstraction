# Account Abstraction

<br/>
<p align="center">
<img src="./img/ethereum/Account Abstraction Ethereum Transaction.jpg" width="500" alt="aa">
</p>
<br/>

## What is Account Abstraction?

Account Abstraction means that not only the execution of a transaction can be arbitrarily complex computation logic as specified by the EVM, but also the authorization logic.

EoAs are now smart contracts. That's all account abstraction is.

Right now, every single transaction in web3 stems from a single private key.
<br/>
<p align="center">
<img src="./img/ethereum/Traditional Ethereum Transaction.jpg" width="500" alt="tr">
</p>
<br/>

# Getting Started 

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Installation

```bash
git clone https://github.com/AleksDemian/foundry-account-abstraction
cd foundry-account-abstraction
make
```
# Quickstart 

## Vanilla Foundry

```bash
foundryup
make test
```

### Deploy - Arbitrum

```bash
make deployEth
```

### User operation - Arbitrum

```bash
make sendUserOp
```

> Note: Sending an account abstraction transaction doesn't work on the local network, because we don't have the system contracts setup on the local network. 

# Example Deployments

## Ethereum (Arbitrum)
- [Minimal Account](https://arbiscan.io/address/0x60d9aa4e11d72004e2e6ef37eecd282ceec51521#code)
- [USDC Approval via EntryPoint](https://arbiscan.io/tx/0xe23c3b8c6e4c913695d69337e6e64d2f648423eedfea17675a8e3249e9bcf065)
