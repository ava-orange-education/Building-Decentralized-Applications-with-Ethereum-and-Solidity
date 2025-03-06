// Factory Pattern

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ChildContract {
    address public owner;
    constructor(address _owner) {
        owner = _owner;
    }
}
contract FactoryPattern {
    ChildContract[] public childContracts;
    function createChildContract() public {
        ChildContract newChild = new ChildContract(msg.sender);
        childContracts.push(newChild);
    }
    function getChildContracts() public view returns (ChildContract[] memory) {
        return childContracts;
    }
}
