This project corresponds to the tutorial [Creating an NFT with solmate and foundry](https://onbjerg.github.io/foundry-book/tutorials/solmate-nft.html) from the Foundry Book and includes the implementation of a basic Opensea compatible NFT using the foundry framework to test and deploy your contract. Furthermore it offers an implementation using both [Solmate](https://github.com/Rari-Capital/solmate/blob/main/src/tokens/ERC721.sol)'s gas optimised ERC721 library as well as [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol)'s ERC721 library. 

### Run tests:
```bash
forge test
```

### Compare gas costs between OpenZeppelin and Solmate library
```bash
forge test --gas-report
```
#### Deployment:

Set the following environment variables

```bash
export RPC_URL=<Your RPC endpoint>
export PRIVATE_KEY=<Your wallets private key>
```

```bash
npm run deploy <constructor-args>
```
#### Send transaction:
```bash
npm run send <contractAddress> <functionSignature> <args>
```
