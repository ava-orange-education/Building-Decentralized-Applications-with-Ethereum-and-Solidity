// Example Voting Contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Voting {
    struct Proposal {
        string name;
        uint voteCount;
    }
    // Mapping for tracking whether an address has voted (discussed briefly; detailed explanation in the next chapter)
    mapping(address => bool) public hasVoted;
    Proposal[] public proposals;
    address public owner;
    event Voted(address indexed voter, string proposalName);
    modifier onlyOnce() {
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can add proposals"
        );
        _;
    }
    constructor(string[] memory proposalNames) {
        owner = msg.sender;
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
        }
    }

    function vote(uint proposalIndex) public onlyOnce {
        require(proposalIndex < proposals.length, "Invalid proposal index");
        proposals[proposalIndex].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, proposals[proposalIndex].name);
    }
    function getProposal(
        uint index
    ) public view returns (string memory name, uint voteCount) {
        require(index < proposals.length, "Invalid proposal index");
        Proposal storage proposal = proposals[index];
        return (proposal.name, proposal.voteCount);
    }
}
