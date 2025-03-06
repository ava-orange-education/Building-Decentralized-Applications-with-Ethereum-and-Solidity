// Constant Variables

pragma solidity ^0.8.0;
contract Example {
    uint256 public constant MY_CONSTANT = 100;
    function getConstantValue() public pure returns (uint256) {
        return MY_CONSTANT;
    }
}
