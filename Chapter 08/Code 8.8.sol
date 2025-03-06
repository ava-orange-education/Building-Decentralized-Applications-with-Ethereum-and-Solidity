// Upgradeable Token Contract

contract TokenProxy {
    address public implementation;
    constructor(address _implementation) {
        implementation = _implementation;
    }
    function upgrade(address _newImplementation) external {
        implementation = _newImplementation;
    }
    fallback() external payable {
        address _impl = implementation;
        require(_impl != address(0), "Implementation contract not set");
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), _impl, ptr, calldatasize(), 0, 0)
            returndatacopy(ptr, 0, returndatasize())
            switch result
            case 0 {
                revert(ptr, returndatasize())
            }
            default {
                return(ptr, returndatasize())
            }
        }
    }
}

contract TokenV1 {
    mapping(address => uint256) public balances;
    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
