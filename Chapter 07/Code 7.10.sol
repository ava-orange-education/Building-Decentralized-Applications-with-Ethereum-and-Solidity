// Simple Auction Contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleAuction {
    address public highestBidder;
    uint public highestBid;
    uint public auctionEndTime;
    address public owner;
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can end the auction"
        );
        _;
    }
    modifier auctionActive() {
        require(block.timestamp < auctionEndTime, "Auction has ended");
        _;
    }
    constructor(uint biddingTime) {
        owner = msg.sender;
        auctionEndTime = block.timestamp + biddingTime;
    }

    function bid() public payable auctionActive {
        require(msg.value > highestBid, "There already is a higher bid");
        if (highestBid != 0) {
            payable(highestBidder).transfer(highestBid); // Refund the previous highest bidder
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }
    function endAuction() public onlyOwner {
        require(block.timestamp >= auctionEndTime, "Auction is still ongoing");
        emit AuctionEnded(highestBidder, highestBid);
        payable(owner).transfer(highestBid);
    }
}
