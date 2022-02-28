# Fit Piggys NFT Minting dApp

This a complete example of fullstack NFT minting dApp. **Fit piggys** is built with the purpose of providing an _entry point for future NFT Minting Website_ projects.

## Installation

You can either use **the default Fit piggys smart contract** and play with it or you can also put **your own smart contract** and make changes as needed. _Remember to change `.env` file with your own variables._

Use the default **Fit piggys Smart Contract:**

```bash
  git clone https://github.com/tomiwolf/Piggydapp.git 
  cd Fit piggysdapp
  npm install
  npm run dev
```

Use **Your Own Smart Contract:**

```bash
  git clone https://github.com/tomiwolf/Piggydapp.git 
  cd Fit piggysdapp
  npm install
  npm run dev
```

- Change `.env` with your own environment variables.
- Remove `/artifacts`folder if it exists.
- Put your own smart contract inside `/contracts/`.
- Compile your smart contract with `npx hardhat compile`.
- Update `/scripts/deploy.js`according to your needs.
- If you need Deploy your smart contract with `npx hardhat run scripts/deploy.js --network rinkeby`.
- Copy the deployed _contract address_ and put it inside `/utils/interact.js` contractAddress section.
- If you used other smart contrcat you must Change your `/utils/interact.js` acording your needs.


## Tech Stack

**Client:** React, TailwindCSS, web3

**Server:** Alchemy, NextJS, Hardhat

## 🔗 Youtube Series For This Project

You can also watch tutorial videos for this project

[![youtube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=AXwS_2EKZSI&list=PLDq0IUpYONvQ2yfbMuL8G0VUu_a3uTR8U)

## Screenshots

![App Screenshot](https://raw.githubusercontent.com/codingwithdidem/Fit piggysdapp/master/public/demo.png)

## Support

For support, email codingwithdidem@gmail.com
