// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


/* contract to auction NFT to the highest bidder
Auction
Seller of NFT deploys this contract.
Auction lasts for 7 days.
Participants can bid by depositing ETH greater than the current highest bidder.
All bidders can withdraw their bid if it is not the current highest bid.

After the auction
Highest bidder becomes the new owner of NFT.
The seller receives the highest bid of ETH.
*/

// create an interface
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

    function withdraw() external {
        uint bal = bids[msg.sender]; // stores total value of bids the function caller has made
        bids[msg.sender] = 0; // set the value to 0 because bidders (excluding the highest bidder) will withdraw all their bids
        payable(msg.sender).transfer(bal); // we trnasfer the total number of bid from the contract too the function caller

        emit Withdraw(msg.sender, bal);
    }

    /*Before the function caller can execute this function and end the auction,
    we need to check if certain conditions are met.*/
    function end() external {
        require(started, "not started"); //  The auction needs to have started
        require(block.timestamp >= endAt, "not ended"); //  the end date of the auction needs to have been reached
        require(!ended, "ended"); // the auction must not have ended already

        ended = true; // Once the auction has ended, set to true.
        if (highestBidder != address(0)) { // check if anyone participated in the auction and bid on the NFT
            nft.safeTransferFrom(address(this), highestBidder, nftId); // If there was a bid, transfer the NFT from the contract to the highest bidder
            seller.transfer(highestBid); //  transfer the ETH that was sent from the highest bidder to the contract, now to the address of the auctioneer, the seller of the NFT
        } else {
            nft.safeTransferFrom(address(this), seller, nftId); // If nobody bids on the NFT, we send the NFT back to the auctioneer
        }

        emit End(highestBidder, highestBid);
    }
}