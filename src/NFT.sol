// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";
import "openzeppelin-contracts/contracts/utils/Counters.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";


contract NFT is ERC721 {
    using Counters for Counters.Counter;
    using Strings for uint256;
    Counters.Counter private currentTokenId;
    string public baseURI;

    uint256 public constant TOTAL_SUPPLY = 10_000;
    uint256 public constant MINT_PRICE = 0.08 ether;



    constructor(string memory _name,
        string memory _symbol,
        string memory _baseURI) ERC721("NFTTutorial", "NFT") {
        baseURI = _baseURI;
    }
    
    function mintTo(address recipient)
        public payable
        returns (uint256)
    {    
        require(msg.value == MINT_PRICE, "Transaction value did not equal the mint price");
        uint256 tokenId = currentTokenId.current();
        require(tokenId < TOTAL_SUPPLY, "Max supply reached");
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(ownerOf[tokenId] != address(0), "ERC721Metadata: URI query for nonexistent token");
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }
}
