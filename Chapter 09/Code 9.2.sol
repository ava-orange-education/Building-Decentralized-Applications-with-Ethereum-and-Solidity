// Creating an ERC721 Token without using OpenZeppelin

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract BasicERC721Token {
    string public name = "BasicNFT";
    string public symbol = "BNFT";
    uint256 public totalSupply;
    uint256 public tokenCounter;
    // Mapping to store token owners and approved addresses
    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => address) public tokenApprovals;
    // Events to log transfers and approvals
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    constructor() {
        tokenCounter = 0;
    }
    // Function to mint a new NFT
    function mint(address _to) public returns (uint256) {
        require(_to != address(0), "Invalid address"); // Ensure recipient address is valid
        uint256 newTokenId = tokenCounter;
        ownerOf[newTokenId] = _to; // Assign ownership to the recipient
        tokenCounter++;
        totalSupply++;
        emit Transfer(address(0), _to, newTokenId); // Emit transfer event from zero address (minting)
        return newTokenId;
    }
    // Function to approve another address to manage the NFT
    function approve(address _approved, uint256 _tokenId) public {
        address owner = ownerOf[_tokenId];
        require(msg.sender == owner, "Caller is not the owner"); // Only owner can approve
        tokenApprovals[_tokenId] = _approved; // Set the approved ad- dress
        emit Approval(owner, _approved, _tokenId); // Emit approval event
    }
    // Function to transfer NFT ownership
    function transfer(address _to, uint256 _tokenId) public {
        address owner = ownerOf[_tokenId];
        require(msg.sender == owner, "Caller is not the owner"); // Only owner can transfer
        require(_to != address(0), "Invalid address"); // Ensure recipi- ent address is valid
        ownerOf[_tokenId] = _to; // Update ownership
        emit Transfer(owner, _to, _tokenId); // Emit transfer event
    }
}
