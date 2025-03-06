// Simple Storage Contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleStorage {
    uint256 public storedValue;
    function setValue(uint256 _value) public {
        storedValue = _value;
    }
    function getValue() public view returns (uint256) {
        return storedValue;
    }
}

// Reading data from the contract using ethers.js

const { ethers } = require("ethers");

async function readValue() {
    // Connect to the Ethereum provider (local or remote)
    const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545");
    // Smart contract address and ABI
    const contractAddress = "YOUR_CONTRACT_ADDRESS";
    const abi = [
        "function getValue() public view returns (uint256)"
    ];
    // Create a contract instance
    const contract = new ethers.Contract(contractAddress, abi, provider);
    // Call the getValue() function
    const value = await contract.getValue();
    console.log("Stored value:", value.toString());
}

readValue();