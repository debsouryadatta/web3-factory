### Steps of Dev:

-**Installation of Hardhat**
1. Hardhat installation ->
    - Commands - For package.json - npm init -y
    - To install hardhat - `pnpm install --save-dev hardhat`
    - To run hardhat - `npx hardhat init`
    - Not required - see step 9 - To install chai and others - pnpm install --save-dev @nomiclabs/hardhat-ethers ethers @nomiclabs/hardhat-waffle ethereum-waffle chai

2. Creating 3 folders - contracts, tests, scripts
3. Importing the "require("@nomiclabs/hardhat-waffle")" in the hardhat.config.js file

-**Compilation using Hardhat**
4. Creating a new file Token.sol in which we will write the contract code to be tested

5. Writing the constructor and the transfer, balanceOf functions in the Token.sol file

6. `npx hardhat compile` to compile the contract

-**Testing of smart contract Part-A**
7. Creating a test file token.js, writing the first test function, getSigners() - to get the signers, getContractFactory("Token") - to get an instance of the contract factory, .deploy() - to deploy contract, expect() - to check the output, etc

8. I guess Chai not only supports ES modules so downgrading the version of Chai to 4.4.1, then `npx hardhat test` to run the test

9. Another error arised - test failed, to fix this - `pnpm i @nomicfoundation/hardhat-toolbox`, require("@nomicfoundation/hardhat-toolbox") in the hardhat.config.js file, then `npx hardhat test` to run the test - test passed

-**Testing of smart contract Part-B**
10. Creating another test function to test the transfer function, 2 tests passed

-**Testing of smart contract Part-C**
11. Understanding the hooks - beforeEach to run before each test, clearing all the code and rewriting the test functions again using the hooks.
  
12. In the beforeEach hook, we will be deploying the contract and getting the signers

13. Then writing 2 test functions for - Deployment, and another one for - Transactions

14. Writing another function to test failing if sender does not have enough tokens

15. Writing the final test function to check updation of balances after transfers

-**Debugging in Hardhat**
16.  Using JS console.log() to debug inside the solidity code.

-**Deploying on Live Network**
17. For testing purpose, hardhat handles the deployment of the contracts in builtin local hardhat network.

18. Creating a new deploy.js in the scripts folder, writing the main() func to deploy the contract on the local network, `npx hardhat run scripts/deploy.js` to run the deploy script on the local network

19. One importing thing which lead to an error - await token.getAddress() - to get the address of the deployed contract(slight syntax change)

20. Getting the ALCHEMY_API_KEY from the alchemy website, and the SEPOLIA_PRIVATE_KEY from the metamask acc1, adding the sepolia network in the hardhat.config.js file, `npx hardhat run scripts/deploy.js --network sepolia` to deploy the contract on the sepolia network

21. The ALCHEMY_API_KEY/url is required to connect to the live test network - sepolia where the contract will be deployed

22. And the SEPOLIA_PRIVATE_KEY/metamask_private_key is required to sign the transactions on the sepolia network

<br>
<br>


### Key Concepts:
- Need of metamask/private key:
    - To sign the transactions on the network
    - To deploy the contract on the network with the signature of the owner
    - To interact with the contract on the network with the signature of the user

- Workflow:
    - Blockchain World/On Chain       ||||||||||    Outer World/Off Chain
    - To connect with the blockchain world, we need to install and run geth node(make our machine a node/evm)
    - Another approach is to use the Infura/Alchemy APIs(Using their VMs) to connect to the blockchain world
    - But for testing purpose we don't need live networks, we can run local blockchains on our machine(which hardhat does behind the scenes)


- Ethers.js 
    - A library to interact with the Ethereum blockchain
    - Irrespective of the network, we have to use libraries like ethers.js to interact with the blockchain
    - Even if we run and connect to local blockchains, we have to use ethers.js to understand and interact with that blockchain


- IPFS
    - IPFS(InterPlanetary File System) is a peer to peer, decentralized and distributed file system
    - Suppose there are 5 nodes - A,B,C,E,F, and file is uploaded on A(file gets stored in A's cache), suppose E wants the file, it can take it from A and store it in its cache. Then suppose F wants the file, the file is now transferred to F both by A,E hence halving the load on A and now even F has the file in its cache. This is how IPFS works.
    - IPFS Application -> Machine acting as Node -> Upload -> IPFS Network -> Hashing of file -> File is stored in the cache of the node who uploaded the file -> link/url is generated which can be used to access the file from the cache of the node who uploaded the file
    - One confusion -> When i upload my photo to ipfs application, it gives us a link of that photo but if i shut down my machine, will the link work? 
    - No, the link won't work reliably if you shut down your machine, unless you've taken steps to ensure the photo is hosted elsewhere on the IPFS network.
    - To maintain availability, it's best to use a pinning service or run a persistent IPFS node to host your content. This way, your photo remains accessible even when your personal machine is offline.



