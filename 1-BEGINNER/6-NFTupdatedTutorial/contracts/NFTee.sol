// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// GameItem is  ERC721 signifies that the contract we are creating imports ERC721 and follows ERC721 contract from openzeppelin
contract GameItem is ERC721 {

  // here we will call the constructor from ERC721.sol 'ERC721("GameItem", "ITM")' and edit the parameter to fit our needs
    constructor() ERC721("GameItem", "ITM") {
        // mint an NFT to yourself
        _mint(msg.sender, 1);

        // we can mint as many as we want
        // _mint(msg.sender, 2);
        // _mint(msg.sender, 3);
        // _mint(msg.sender, 4);
        // _mint(msg.sender, 5);
    }
}