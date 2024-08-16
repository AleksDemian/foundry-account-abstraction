-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil scopefile flatten encryptKey

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

all: remove install build

# Clean the repo
clean :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install foundry-rs/forge-std@v1.8.2 --no-commit && forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit && forge install eth-infinitism/account-abstraction@v0.7.0 --no-commit && forge install cyfrin/foundry-era-contracts@0.0.3 --no-commit && forge install cyfrin/foundry-devops@0.2.2 --no-commit

# Update Dependencies
update:; forge update

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

# /*//////////////////////////////////////////////////////////////
#                               EVM
# //////////////////////////////////////////////////////////////*/
build:; forge build 

test :; forge test

testFork :; forge test --fork-url mainnet

snapshot :; forge snapshot 

# /*//////////////////////////////////////////////////////////////
#                          EVM - SCRIPTS
# //////////////////////////////////////////////////////////////*/

getEntryPoint :; forge clone -c 1 --etherscan-api-key ${ETHERSCAN_API_KEY} 0x0000000071727De22E5E9d8BAf0edAc6f37da032 --no-git

flattenClone :; forge flatten src/core/EntryPoint.sol > MockEntryPoint.sol

deployEth :; forge script script/DeployMinimal.s.sol --rpc-url arbitrum --sender ${SMALL_MONEY_SENDER} --account smallmoney --broadcast --verify -vvvv

verify :; forge verify-contract --etherscan-api-key ${ETHERSCAN_API_KEY} --rpc-url ${MAINNET_RPC_URL} XXX <PATH_TO_CONTRACT>

getCalldata :; cast calldata "approve(address,uint256)" 0x3b29236323d90e62782737eAEF81A2dFdbfB95fD 100000000000000000000

estimate :; cast estimate "approve(address,uint256)" "approve(address,uint256)" 0x3b29236323d90e62782737eAEF81A2dFdbfB95fD 100000000000000000000

sendUserOp :; forge script script/SendPackedUserOp.s.sol --rpc-url arbitrum --sender ${SMALL_MONEY_SENDER} --account smallmoney --broadcast -vvvv