// Inline Assembly in Solidity

contract InlineExample {
    function add(uint x, uint y) public pure returns (uint result) {
        assembly {
            result := add(x, y)
        }
    }
}

contract StorageExample {
    function storeValue(uint slot, uint value) public {
        assembly {
            sstore(slot, value)
        }
    }

    function loadValue(uint slot) public view returns (uint result) {
        assembly {
            result := sload(slot)
        }
    }
}

contract ExternalAccessExample {
    uint public data;
    function setData(uint value) public {
        assembly {
            sstore(data.slot, value)
        }
    }
    function getData() public view returns (uint result) {
        assembly {
            result := sload(data.slot)
        }
    }
}
