// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract EtherUnits {
    uint public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    uint public oneGwei = 1 gwei;
    // 1 gwei is equal to 10^9 wei.
    bool public isOneGwei = 1 gwei == 1e9;

    uint public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;

}

/*
wei
is the smallest subunit of Ether,
Ether numbers without a suffix are treated as wei.

gwei
One gwei (giga-wei) is equal to 1,000,000,000 (10^9) wei.

ether
One ether is equal to 1,000,000,000,000,000,000 (10^18) wei
*/