// Examples of error handling in smart contracts

contract SafeTransfer {
    address public owner;
    uint public balance;
    constructor() {
        owner = msg.sender;
        balance = 1000;
    }
    function transfer(uint amount) public {
        require(msg.sender == owner, "Only owner can transfer funds");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }
    function withdraw(uint amount) public {
        if (amount > address(this).balance) {
            revert("Not enough Ether in contract");
        }
        payable(msg.sender).transfer(amount);
    }
}
