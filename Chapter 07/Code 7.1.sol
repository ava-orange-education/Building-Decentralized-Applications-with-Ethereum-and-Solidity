// Smart Contract structure

contract MyFirstContract {
    uint public myValue; // State variable
    constructor() {
        myValue = 10; // Initialize value
    }
    function setValue(uint _value) public {
        myValue = _value;
    }
}
