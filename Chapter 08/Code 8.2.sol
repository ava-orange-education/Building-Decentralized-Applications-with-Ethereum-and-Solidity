// Multiple Inheritance in Solidity

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}
contract B {
    function foo() public pure virtual returns (string memory) {
        return "B";
    }
}
contract C is A, B {
    // Override to resolve ambiguity
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo(); // This resolves to "B" as B is the rightmost parent
    }
}
