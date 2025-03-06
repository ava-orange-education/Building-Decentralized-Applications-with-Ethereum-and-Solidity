// Polymorphism in Solidity

// Base contract
contract Country {
    function getTaxRate() public pure virtual returns (uint) {
        return 10; // Default tax rate
    }
}
// Derived contract ProvinceA
contract ProvinceA is Country {
    function getTaxRate() public pure override returns (uint) {
        return 12; // Specific tax rate for ProvinceA
    }
}
// Derived contract ProvinceB
contract ProvinceB is Country {
    function getTaxRate() public pure override returns (uint) {
        return 8; // Specific tax rate for ProvinceB
    }
}
