// Self Destruct Pattern

contract Destructible {
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    function destroy() public {
        require(msg.sender == owner, "Only owner can destroy");

        selfdestruct(payable(owner));
    }
}
