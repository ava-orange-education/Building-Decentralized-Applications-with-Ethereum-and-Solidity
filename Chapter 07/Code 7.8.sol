// Basic Bank Contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleBank {
    // Balances mapping to store user balances (discussed briefly; detailed explanation in the next chapter)
    mapping(address => uint) private balances;
    address public owner;
    event Deposit(address indexed accountHolder, uint amount);
    event Withdraw(address indexed accountHolder, uint amount);
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can execute this"
        );
        _;
    }
    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function withdraw(uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
