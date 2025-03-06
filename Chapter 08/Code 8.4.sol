// Abstract Contracts

abstract contract Vehicle {
    function drive() public virtual;
}
contract Car is Vehicle {
    function drive() public override {
        // Implement drive functionality specific to a car
    }
}
contract Bike is Vehicle {
    function drive() public override {
        // Implement drive functionality specific to a bike
    }
}
