// Example of Transaction Origin vulnerability and mitigation

// Vulnerable Code
function onlyOwner() public {
    require(tx.origin == owner, "Not authorized");
    // Some privileged action
}

// Secure Code
function onlyOwner() public {
    require(msg.sender == owner, "Not authorized");
    // Some privileged action
}
