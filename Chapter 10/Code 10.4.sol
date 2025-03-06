// Writing unit tests for the SimpleStorage contract using forge from Foundry

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }
    function testDefaultValue() public {
        uint256 value = simpleStorage.getValue();
        assertEq(value, 0);
    }
    function testSetValue() public {
        simpleStorage.setValue(42);
        uint256 value = simpleStorage.getValue();
        assertEq(value, 42);
    }
}
