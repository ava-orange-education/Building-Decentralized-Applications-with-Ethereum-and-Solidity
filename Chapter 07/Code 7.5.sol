// Example of using Conditional Statements and Loops

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ControlStructures {
    uint[] public numbers;
    // Adds numbers from 1 to n to the array
    function addNumbers(uint n) public {
        for (uint i = 1; i <= n; i++) {
            numbers.push(i);
        }
    }
    // Checks if a number exists in the array
    function checkNumber(uint num) public view returns (bool) {
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] == num) {
                return true;
            }
        }
        return false;
    }
}
