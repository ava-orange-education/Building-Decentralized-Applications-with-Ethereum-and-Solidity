// Vehicle Factory Pattern

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract VehicleContract {
    string public model;
    address public owner;
    constructor(string memory _model, address _owner) {
        model = _model;
        owner = _owner;
    }
}
contract VehicleFactory {
    VehicleContract[] public vehicles;
    function createVehicle(string memory _model) public {
        VehicleContract newVehicle = new VehicleContract(_model, msg.sender);
        vehicles.push(newVehicle);
    }
    function getVehicles() public view returns (VehicleContract[] memory) {
        return vehicles;
    }
}
