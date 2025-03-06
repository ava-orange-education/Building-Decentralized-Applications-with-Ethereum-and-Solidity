// Example of Cross-Function Race Attack vulnerability and mitigation

// Vulnerable Code
mapping(address => uint256) public balances;
function deposit() public payable {
    balances[msg.sender] += msg.value;
}
function withdraw(uint256 _amount) public {
    require(balances[msg.sender] >= _amount, "Insufficient balance");
    balances[msg.sender] -= _amount;
    (bool sent, ) = msg.sender.call{value: _amount}("");
    msg.sender.call{value: _amount}("");
    require(sent, "Failed to send Ether");
}

// Secure Code
function depositAndWithdraw(uint256 _amount) public payable {
    balances[msg.sender] += msg.value;
    require(balances[msg.sender] >= _amount, "Insufficient balance");
    balances[msg.sender] -= _amount;
    (bool sent, ) = msg.sender.call{value: _amount}("");
    require(sent, "Failed to send Ether");
}