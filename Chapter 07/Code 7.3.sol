// Immutable Variables

pragma solidity ^0.8.0;
contract Example {
    address public immutable OWNER;
    constructor(address owner) {
        OWNER = owner;
    }
    function getOwner() public view returns (address) {
        return OWNER;
    }
}
