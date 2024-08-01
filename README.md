### Web3 Factory
- Basics Practice Done from code eater cohort
- hardhat_tut Done - CodeEater
- ethers.js_tut Done - CodeEater

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




<br>

### ChainLink Oracle

- **How chainlink AggregatorV3Interface contract work to give the real time price of the crypto currencies?**
    - Purpose: AggregatorV3Interface is a standardized interface for price feeds on various blockchain networks.
    - Function: It provides up-to-date price data for cryptocurrencies, commodities, and other assets.
    - Data source: Aggregates price data from multiple trusted off-chain sources.
    - Update frequency: Prices are typically updated frequently, often every minute or less.
    - Key method: The latestRoundData() function returns the most recent price data.
    - Return values: Includes price, timestamp, and round ID among other data points.
    - Decentralization: Utilizes a network of independent node operators to ensure reliability.
    - Widespread adoption: Used by many DeFi protocols for accurate pricing information.
    - Gas efficiency: Designed to be cost-effective for on-chain price queries.
    - Cross-chain compatibility: Available on multiple blockchain networks.

<br>

- **Using Chainlink to generate random numbers in smart contracts:**
    - Chainlink VRF is a decentralized service that provides smart contracts with secure and verifiable random numbers.
    - VRF is used to generate random numbers in a way that is tamper-proof and transparent, making it ideal for applications such as gaming, gambling, and other use cases that require randomness.
    - The process involves requesting a random number from the Chainlink VRF service, which is then verified on-chain to ensure its integrity and authenticity.
    - By using Chainlink VRF, smart contracts can access a source of randomness that is both secure and reliable, providing a key building block for decentralized applications that require random number generation.

    - Steps involve:
        - Creating a subscriptionId
        - If you don't have Link token then go to Link faucet and transfer some Links into your wallet
        - Funding the subscriptionId with Link tokens
        - Using VRFV2PlusClient to create a request to the Chainlink providing the required parameters
        - Chainlink will generate a random number and send it back to the smart contract by calling the fulfillRandomWords() function but for that we need add the deployed contract address to the Chainlink as a consumer
