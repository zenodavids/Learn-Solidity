/* *
PRIMITIVE DATATYPES
===================

-> uint(or uint256)
unsigned integars(only positive to zero)
8-256 bits
uint, uint8 and uint256

-> bool
true or false

-> int(also int256)
both positive and negative integars
8-256 bits
int, int8 and int256

-> address
20 byte (same as an ethereum address)
address payable - recieve ethers from the contract

*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Primitives {
    bool public boo = true;

    /*
    uint stands for unsigned integer, meaning non negative integers
    different sizes are available
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint is an alias for uint256

    /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is same as int256

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false on default if no value is assigned to it.
    uint public defaultUint; // 0 on default if no value is assigned to it.
    int public defaultInt; // 0 on default if no value is assigned to it.
    address public defaultAddr; // 0x0000000000000000000000000000000000000000

    /*==================== assignment ==========================*/
    address public newAddr = 0xcD6a42782d230D7c13A74ddec5dD140e55499Df9 ;
    int public neg = -2;
    uint8 public newU = 0;
}