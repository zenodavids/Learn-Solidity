// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
// adding bid and start function to the auction
interface IERC721 {
    function safeTransferFrom(
      address from,
      address to,
      uint256 tokenId
    ) external;

    function transferFrom(
        address,
        address,
        uint
    ) external;
}

contract EnglishAuction {
    // create the four events (Start, Bid, Withdraw, End).
    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event End(address winner, uint amount);

    /* create state variables */

    // create two state variables for NFT to auction
    IERC721 public nft; // represent NFT contract
    uint public nftId; // specific NFT tokenId to be auctioned

    address payable public seller; // address of the NFT seller
    uint public endAt; // end date of auction
    bool public started; // (returns boolean) keep track of when auction starts
    bool public ended; // (returns boolean) keep track of when auction ends

    address public highestBidder; // address of the highest bidder to send NFt when auction ends
    uint public highestBid; // highest bidding
    mapping(address => uint) public bids; // map the address of the bidder to total value of bids his account has made.

    constructor(
        address _nft, // address of NFT contract
        uint _nftId, // tokenid of NFT
        uint _startingBid // starting bid price
    ) {
        nft = IERC721(_nft);
        nftId = _nftId;

        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        require(!started, "started"); // check if auction has started
        require(msg.sender == seller, "not seller"); // check if the seller is executing the auction

        nft.transferFrom(msg.sender, address(this), nftId); // transfer nft from seller to contract.
        started = true; // set 'started' to true
        endAt = block.timestamp + 7 days; // end contract in 7 days
        emit Start();
    }

    function bid() external payable {
        // Before a bid can be made, certain conditions must be met.
        require(started, "not started"); // the auction needs to have started.
        require(block.timestamp < endAt, "ended"); // the auction is still ongoing.
        require(msg.value > highestBid, "value < highest"); // value(bid) has to be > the highest bid

        if (highestBidder != address(0)) { // check if there is a bidder
        // if this is the first bid, this line will be irrelevant
            bids[highestBidder] += highestBid; // add the last bid of the highest bidder to the total bid they have made so far
        }

        highestBidder = msg.sender; // set the highestBidder to the account calling the function
        highestBid = msg.value; //and set their bid, the value that was sent with the call

        emit Bid(msg.sender, msg.value);
    }
}
