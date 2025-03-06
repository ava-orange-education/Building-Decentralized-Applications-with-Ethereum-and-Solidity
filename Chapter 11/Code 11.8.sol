// Name Registry Pattern

contract NameRegistry {
    mapping(string => address) public registry;
    function registerName(string memory name, address addr) public {
        require(registry[name] == address(0), "Name is already registered");
        registry[name] = addr;
    }
    function getAddress(string memory name) public view returns (address) {
        return registry[name];
    }
}
