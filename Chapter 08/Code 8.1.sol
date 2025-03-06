// Inheritance in Solidity

// Base contract
contract Animal {
    string public species;
    function setSpecies(string memory _species) public {
        species = _species;
    }
}
// Derived contract inheriting from Animal
contract Dog is Animal {
    string public name;
    function setName(string memory _name) public {
        name = _name;
    }
}
