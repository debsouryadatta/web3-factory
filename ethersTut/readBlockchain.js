require('dotenv').config()
const {ethers} = require("ethers");
const provider = new ethers.JsonRpcProvider(process.env.MAINNET_RPC_URL);

const queryBlockchain = async() => {
    // const block = await provider.getBlockNumber();
    // console.log("Current block number: ", block);

    const balance = await provider.getBalance("0xf8238a3dd9a67b8419412eDE613A06D73Ffc2D93");
    console.log("Account balance in BN: ", balance);

    const balanceEther = ethers.formatEther(balance);
    console.log("Account balance in Ether: ", balanceEther);
}

queryBlockchain();