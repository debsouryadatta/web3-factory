import { useState, useEffect } from "react";
import "./App.css";
// const { ethers } = require("ethers");
import { ethers } from "ethers";

function App() {
  const walletAddress = "0x316124dc1b34414dba8fe7750a889075d3ae3521"; // Demo Contract Address
  const walletAbi = [
    {
      inputs: [],
      name: "sendEthContract",
      outputs: [],
      stateMutability: "payable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "_user",
          type: "address",
        },
      ],
      name: "sendEthUser",
      outputs: [],
      stateMutability: "payable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "_num",
          type: "uint256",
        },
      ],
      name: "setValue",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "_address",
          type: "address",
        },
      ],
      name: "accountBalance",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "contractBalance",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "getValue",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "name",
      outputs: [
        {
          internalType: "string",
          name: "",
          type: "string",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
  ];

  useEffect(() => {
    const writeContract = async () => {
      const provider = new ethers.BrowserProvider(window.ethereum);
      await provider.send("eth_requestAccounts", []); // Request user to connect wallet
      const signer = await provider.getSigner();
      const contract = new ethers.Contract(walletAddress, walletAbi, signer);
      // await contract.setValue(2);
      // await contract.sendEthContract({value: ethers.parseEther("0.01")});
      await contract.sendEthUser("0xf90A4a18415Ee1D761f1a7747146cCE6Df5420D2", {value: ethers.parseEther("0.01")});
    }

    writeContract();
  }, [])

  return <div>Hello</div>;
}

export default App;
