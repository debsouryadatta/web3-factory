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
