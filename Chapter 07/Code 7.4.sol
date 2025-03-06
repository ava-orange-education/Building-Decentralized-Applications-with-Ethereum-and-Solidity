// Creating and Emitting Events

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract EventExample {
    uint256 public value;
    address public owner;
    event ValueSet(address indexed author, uint256 newValue);
    event ErrorOccurred(string message);
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 newValue) public onlyOwner {
        if (newValue == 0) {
            emit ErrorOccurred("Value cannot be zero");
            revert("Value must be non-zero");
        }
        value = newValue;
        emit ValueSet(msg.sender, newValue);
    }
}
