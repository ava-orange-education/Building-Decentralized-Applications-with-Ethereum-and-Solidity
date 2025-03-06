// Example of Reentrancy Attack vulnerability and mitigation

// Vulnerable Code
function withdraw(uint _amount) public {
    require(balances[msg.sender] >= _amount, "Insufficient balance");
    (bool sent, ) = msg.sender.call{value: _amount}("");
    require(sent, "Failed to send Ether");
    balances[msg.sender] -= _amount;
}

// Secure Code
function withdraw(uint _amount) public {
    require(balances[msg.sender] >= _amount, "Insufficient balance");
    balances[msg.sender] -= _amount;
    (bool sent, ) = msg.sender.call{value: _amount}("");
    require(sent, "Failed to send Ether");
}
