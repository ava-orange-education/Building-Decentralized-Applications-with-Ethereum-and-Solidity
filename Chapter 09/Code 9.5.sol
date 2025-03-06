// Creating an ERC721 Token using OpenZeppelin

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract MyNFT is ERC721 {
    uint256 public tokenCounter;
    constructor() ERC721("MyNFT", "MNFT") {
        tokenCounter = 0;
    }
    function createNFT() public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId); // Safely mint the NFT to avoid reentrancy attacks
        tokenCounter++;
        return newTokenId;
    }
}
