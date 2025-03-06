// Uniswap Mechanism at the contract level

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract UniswapPool {
    uint256 public reserveX;
    uint256 public reserveY;
    constructor(uint256 initialX, uint256 initialY) {
        reserveX = initialX;
        reserveY = initialY;
    }
    function swap(uint256 inputX) public returns (uint256 outputY) {
        require(inputX > 0, "Input amount must be greater than zero");
        uint256 newReserveX = reserveX + inputX;
        uint256 newReserveY = (reserveX * reserveY) / newReserveX;

        reserveX = newReserveX;
        reserveY = newReserveY;
    }
}
