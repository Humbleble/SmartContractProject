# Smart Contract Project

## Overview
This project implements a basic ERC20-like token contract named `LoyaltyToken`. The contract includes functionalities for minting tokens, burning tokens, managing loyalty points, and demonstrates the usage of `require()`, `assert()`, and `revert()` statements for error handling and validation.

## Contract Details
- **Name:** LoyaltyToken
- **Symbol:** LT
- **Decimals:** 18
- **Total Supply:** Initially set to 0 and increases with minting.

## Functionalities and Error Handling
1. **Minting Tokens**: Only the contract owner can mint new tokens and assign them to specified addresses. Uses `require()` for input validation and `assert()` to ensure no overflow.
2. **Burning Tokens**: Token holders can burn (destroy) their own tokens, reducing the total supply. Uses `require()` for balance validation and `assert()` to prevent underflow.
3. **Earning Loyalty Points**: Token holders can earn loyalty points based on their interactions with the contract. Uses `require()` to check input conditions.
4. **Redeeming Loyalty Points**: Token holders can redeem their accumulated loyalty points for specified benefits. Uses `require()` to validate conditions and `revert()` to handle specific errors.

## Events
- **Transfer**: Triggered when tokens are transferred between addresses.
- **Mint**: Triggered when new tokens are minted and assigned to an address.
- **Burn**: Triggered when tokens are burned (destroyed) by an address.
- **RedeemLoyaltyPoints**: Triggered when loyalty points are redeemed for a specified benefit.

## Owner Functions
The contract owner has exclusive rights to mint tokens, ensuring controlled token supply.

## Usage
To deploy and interact with this contract:
1. Compile and deploy the `LoyaltyToken.sol` contract using a Solidity development environment.
2. Interact with the deployed contract using Ethereum wallets or scripts that support Ethereum transactions.
