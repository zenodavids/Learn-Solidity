// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.0 (token/ERC721/extensions/IERC721Metadata.sol)

pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.4.0/token/ERC721/IERC721.sol";

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Metadata is IERC721 {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}
/*

Metadata extension allows us to add additional information to our ERC721 tokens.
We can specify a name, a symbol, and an URI (Uniform Resource Identifier)
that can point to a file where we can add even more information in the form of a JSON.

ERC721 Metadata Functions

name
The function name (line 16) returns the name of the token collection.
A token collection means all tokens created with your ERC721 token contract implementation.
Every token in this collection will have this name, regardless of their tokenId.

symbol
The function symbol (line 21) returns the symbol of the token collection.

tokenURI
The function tokenURI (line 26) returns the URI for the token with the id tokenId.
In this case it’s not the URI of the whole collection but of an individual token in the collection.

ERC721 Metadata JSON Schema
The file that the tokenURI points to should conform to the
Metadata JSON Schema as it is specified in the EIP-721.

{
    "title": "Asset Metadata",
    "type": "object",
    "properties": {
        "name": {
            "type": "string",
            "description": "Identifies the asset to which this NFT represents"
        },
        "description": {
            "type": "string",
            "description": "Describes the asset to which this NFT represents"
        },
        "image": {
            "type": "string",
            "description": "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
        }
    }
}
The root element must be of the type object.
This root object should have properties with the keys: name, description, and image that should be all of the type string.

The ERC721 standard is pretty flexible, the tokenURI does not need to point to a JSON document
and the JSON does not need to have all properties and often has additional properties.
*/