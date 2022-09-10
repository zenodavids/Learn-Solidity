// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.0/access/Ownable.sol";

contract Geometry is ERC721, Ownable {
    constructor() ERC721("Geometry", "GEO") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/QmNeHq8ZApvmL9HcRYHJk5SujL1w6XCR1SPzCAHC22TT4v";
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}

/*
- IPFS ( InterPlanetary File System) is a peer-to-peer network for storing files in a distributed way.
- Pinata.cloud is a pinning service that allows users to easily host files on the IPFS network.

//////////////////////////////////////////////////////
 host our images and the JSON files with their metadata on IPFS.

Create Image Folder
In this example, we will create metadata for three tokens. As you can see below,
we create three images that we stored in a folder.

geo-img
├── geo_1.png
├── geo_2.png
├── geo_3.png

Register on Pinata
host these images somewhere so we can point to them in the metadata of our tokens.
Let's do it in a decentralized way and use Pinata to host them on IPFS.
Go to Pinata.cloud and create an account.
you can upload up to 1 GB of data for free.
Once you have signed up, you should be in the Pin Manager view.

Pin Manager Pinata
Upload Images to IPFS
Click on the upload button and upload the folder with your images.
Once you've uploaded your folder, you should see the name of your folder
and the CID (content identifier) associated with it.
If the content in the folder changes, the CID will also change.

To access your folder on IPFS,
enter this address "https://ipfs.io/ipfs/" and add your CID.
For our current example, you can access your folder by using:
https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P
You can access a specific image by using:
https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_1.png

Create JSON files
We create another folder where we store three JSON files.

geo-json
├── 0
├── 1
├── 2

Inside the JSON files, create the metadata for the tokens,
like name, description, and image.
For the image URL, we are going to use the URL of our images on IPFS.
You can add additional data if you like; in this example,
we added some unique attributes for each token.

This is how the JSON for the first token could look:

{
    "name": "Geometry#0",
    "description": "Geometry is an NFT collection for educational purposes.",
    "image": "https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_1.png
",
    "attributes": [
        { "trait_type": "background", "value": "cyan" },
        { "trait_type": "color", "value": "red" },
        { "trait_type": "shape", "value": "circle" }
    ]
}
This is how the JSON for the second token could look:

{
    "name": "Geometry#1",
    "description": "Geometry is an NFT collection for educational purposes.",
    "image": "https://ipfs.io/ipfs/QmTJok2tju9zstjtAqESdZxTiUiFCBAyApHiDVj4maV75P/geo_2.png",
    "attributes": [
        { "trait_type": "background", "value": "magenta" },
        { "trait_type": "color", "value": "green" },
        { "trait_type": "shape", "value": "square" }
    ]
}
As shown above, the folder in this example is called "geo-json".
Inside this folder, we have three JSON files.
The first JSON file is called "0", the second JSON file is called "1",
and the third JSON file is called "2".

Make sure that your JSON files don't have a file ending and are named like their corresponding tokenIds.
In the pin manager on pinata.cloud, click on the upload button and upload the folder with your JSON files.

To access your folder on IPFS, enter this address "https://ipfs.io/ipfs/" and add your CID.
For our current example, you can access your folder by using:
https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp
This will become our baseURI.

You can access a specific JSON file then by just adding a slash and the tokenId by using:
https://ipfs.io/ipfs/QmVrsYxXh5PzTfkKZr1MfUN6PotJj8VQkGQ3kGyBNVKtqp/0

In the contract, replace the baseURI with your own baseURI. In this example,
the baseURI consists of the URL "https://ipfs.io/ipfs/", the CID containing the JSON files,
and a slash at the end "/".

An individual tokenURI will now be created for each token by adding the tokenId to the baseURI — exactly what we did manually in the example above to access the JSON file.
*/