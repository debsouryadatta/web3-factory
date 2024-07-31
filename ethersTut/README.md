### Steps of Dev:

- **Course Contents**
- **Ethers.js Installation**
1. `pnpm i --save ethers` -> Install ethers.js
   
- **Alchemy RPC URL**
2. Getting the Mainnet RPC Url from the Alchemy website and storing it in the .env file.

- **Current Block Number**
3. Creating a readBlockchain.js file where we created a queryBlockchain func to get the info of the current block that is being mined(Using ethers.js and the RPC Url).

4. In ethers.js new version - "new ethers.JsonRpcProvider" is used instead of "new ethers.providers.JsonRpcProvider".

- **Balance of Account**
5. Going through the functions for getting the balance of an account.

- **Smart Contract Interaction**
6. Deploying a demo smart contract to sepolia test network using Remix, with which we can interact using ethers.js. Also storing the contract address and ABI for future use.

7. Creating a file interactionSC.js, getting the SEPOLIA_RPC_URL from the alchemy dashboard and storing it to .env file

8. Creating a contractInteraction func to get the read functions of the smart contract.

9. For Read -> Provider & Infura, and For Write -> Signer & Metamask.

10. - For Read:
        - No need for the user to sign the transaction.
        - No need for the user to pay for the transaction.
        - No need for the user to have an account.

11. - For Write:
        - Need the user to sign the transaction.
        - Need the user to pay for the transaction.
        - Need the user to have an account.

- **Calling Write Functions**
12. We can't directly access metamask from the node.js environment, so we need to create a react app to get the window.ethereum object and perform the write operations.

13. `pnpm create vite` -> Create a vite react app.

14. Creating the writeContract func in the App.jsx(react app), ethers.providers.web3Provider is used in place of ethers.providers.web3Provider and also provider.getSigner() needs to be awaited.

15. Setting the num in the smart contract to 2, verifying it in the remix_ide/interactionSC.js.
    
16. Calling the sendEthContract() func in the smart contract with some eth, verifying the contract balance in the interactionSC.js.

17. Calling another function - sendEthUser() with my another acc address and some eth, sending eth from one account to another using the smart contract.



