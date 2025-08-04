# FundMe Smart Contract

A decentralized crowdfunding smart contract built with Solidity that accepts ETH from users, validates real-time conversion with Chainlink Price Feeds, and allows only the owner to withdraw funds securely.

---

## About

This project demonstrates a simple yet powerful funding mechanism that:

- Accepts ETH from contributors
- Ensures a minimum USD value of 5 USD using real-time ETH/USD price via Chainlink
- Stores funder details
- Allows only the contract owner to withdraw the collected funds

---

## Features

- Accept ETH funding
- Enforce a minimum contribution (in USD)
- Real-time ETH/USD conversion using Chainlink Oracle
- Track individual funders
- Owner-only withdrawal
- Efficient gas usage via `immutable`, `constant`, and custom errors
- Modular price conversion using a Solidity `library`

---

## 🛠 Tech Stack

- **Solidity** `^0.8.20` & `^0.8.25`
- **Chainlink** Price Feeds
- **Ethereum** (Compatible with testnets like Sepolia, Goerli)
- **Remix** for deployment

---

## 🧪 Getting Started

### Clone the repository

```bash
git clone https://github.com/yourusername/fundme-smart-contract.git
cd fundme-smart-contract
```

### Or you can directly run in remix

- delete all the default files in remix ide
- copy and paste the fundme.sol and priceConvertor.sol files in remix
- a new folder .deps will appear
- then compile the files and deploy the fundme.sol
- then you can fund and interact with the contract
