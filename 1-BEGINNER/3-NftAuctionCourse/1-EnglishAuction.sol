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
    mapping(address => uint) public bids; // total value of bids an account has made

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
}

/* ⭐️ Assignment

We will use the assignment part of the following sections to give you instructions
on testing your contract in the JavaScript VM environment of Remix.

Deploy an NFT contract. You can use the NFT contract that we created in
our "3.3 ERC721 - Token Creation" section.

Deploy this EnglishAuction contract.
Use the address of the NFT contract as an argument
for the _nft parameter, 0 for _nftId, and 1 for _startingBid.

After deploying your contract, test if contract functions like nft, nftId, and
started work as expected.

*/
