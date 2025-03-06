// Example of Integer overflow/underflow vulnerability and mitigation

uint8 public count = 255;
    function increment() public {
    count += 1; // Overflow occurs here, as uint8 max value is 255
}

// Secure Code
uint8 public count = 255;
    function increment() public {
    count += 1; // Automatically reverts on overflow in Solidity 0.8
}