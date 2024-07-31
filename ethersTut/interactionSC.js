require('dotenv').config()
const {ethers} = require("ethers");
const provider = new ethers.JsonRpcProvider(process.env.SEPOLIA_RPC_URL);

const walletAddress = "0x316124dc1b34414dba8fe7750a889075d3ae3521"; // Demo Contract Address
const walletAbi = [
	{
		"inputs": [],
		"name": "sendEthContract",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_user",
				"type": "address"
			}
		],
		"name": "sendEthUser",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_num",
				"type": "uint256"
			}
		],
		"name": "setValue",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "accountBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "contractBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getValue",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "name",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]

const contractInteraction = async () => {
    const walletContract = new ethers.Contract(walletAddress, walletAbi, provider); // instance of the contract

    // const contractName = await walletContract.name();
    // console.log("Contract Name: ", contractName);
    // const num = await walletContract.getValue();
    // console.log("Number Value: ", num);
    const contractBalance= await walletContract.contractBalance();
    console.log("Contract Balance: ", contractBalance);
    // const userBalance = await walletContract.accountBalance("0xF2de1E3000fbD29cD227aFc3B86721987B4AF701");
    // console.log("User Balance: ", userBalance);
}

contractInteraction();
