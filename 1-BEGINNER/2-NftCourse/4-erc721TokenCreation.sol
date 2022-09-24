// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.0/access/Ownable.sol";

// we name our contract the name of our token 'MyToken'
// this inherits the openZepplin token contract implementation(line 4)
contract MyToken is ERC721, Ownable {
    // the name and symbol of our token
    constructor() ERC721("MyToken", "MTK") {}

    // our baseURI
    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/QmUYLUKwqX6CaZxeiYGwmAYeEkeTsV4cHNZJmCesuu3xKy/";
    }
    //  enable the owner to create new tokens with a dedicated token id after contract deployment.
    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
// implementation of a ERC721 contract.
// implement https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol

/*  Assignment

Rename your contract to Geometry.
Rename your token to Geometry.
Change the symbol of your token to GEO.
Change the _baseURI to
https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/

*/
contract Geometry is ERC721, Ownable {
    // the name and symbol of our token
    constructor() ERC721("Geometry", "GEO") {}

    // our baseURI
    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/";
    }
    //  enable the owner to create new tokens with a dedicated token id after contract deployment.
    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}