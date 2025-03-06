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

// Writing data to the contract using ethers.js

const { ethers } = require("ethers");

async function setValue() {
    // Connect to the Ethereum provider
    const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545");
    // Define the deployer's wallet using a private key
    const privateKey = "YOUR_PRIVATE_KEY";
    const wallet = new ethers.Wallet(privateKey, provider);
    // Smart contract address and ABI
    const contractAddress = "YOUR_CONTRACT_ADDRESS";
    const abi = [
        "function setValue(uint256 _value) public"
    ];

    // Create a contract instance with the wallet to authorize

    const contract = new ethers.Contract(contractAddress, abi, wallet);
    new ethers.Contract(contractAddress, abi, wallet);
    // Send a transaction to setValue()
    const tx = await contract.setValue(42);
    await tx.wait();
    console.log("Transaction successful, value set to 42");
}
setValue();