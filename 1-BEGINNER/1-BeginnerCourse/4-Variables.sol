// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint public num = 123;
    uint public blockNumber;


    function doSomething() public {
        // Local variables are not saved to the blockchain.
        uint i = 456;

        // Here are some global variables (also called special variables)
        // used to retrieve information about the blockchain, particular addresses, contracts, and transactions.
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
        blockNumber = block.number; // current block number
    }
}
// complete list of global variables
// https://docs.soliditylang.org/en/latest/cheatsheet.html?highlight=Variables#global-variables