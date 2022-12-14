require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

const QUICKNODE_HTTP_URL = process.env.QUICKNODE_HTTP_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      //how do we define which test network to deploy to?
      url: QUICKNODE_HTTP_URL,
      // how do we define which account to use for deployment?
      accounts: [PRIVATE_KEY],
    },
  },
};
