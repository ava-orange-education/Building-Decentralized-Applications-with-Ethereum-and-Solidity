// Assert for critical checks

contract CriticalCheck {
    uint public count;
    function increment() public {
        count++;
        assert(count > 0); // Critical check to ensure count is always positive
    }
}
